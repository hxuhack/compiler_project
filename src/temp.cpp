#include <string>
#include <assert.h>
#include <unordered_set>
#include "temp.h"

using namespace std;

static int temps = 100;

Temp_temp::Temp_temp(int _num,TempType _type,int _len,const string& _sname)
    : num(_num), type(_type), structname(_sname), len(_len),varname() {}

Temp_temp* Temp_newtemp_int()
{
    return new Temp_temp(temps++);
}

Temp_temp* Temp_newtemp_int_ptr(int len)
{
    return new Temp_temp(temps++,TempType::INT_PTR,len);
}

Temp_temp* Temp_newtemp_struct(const string& name)
{
    return new Temp_temp(temps++,TempType::STRUCT_TEMP,0,name);
}

Temp_temp* Temp_newtemp_struct_ptr(int len, const std::string& name)
{
    return new Temp_temp(temps++,TempType::STRUCT_PTR,len,name);
}

TempDef::TempDef(TempType _kind,int _len,const std::string &_structname)
    : kind(_kind), len(_len), structname(_structname) {}

static int labels = 1;

Temp_label::Temp_label(string _name)
    : name(_name) {}

Temp_label* Temp_newlabel()
{
    return new Temp_label("bb" + to_string(labels++));
}

Temp_label* Temp_newlabel_named(const string &name)
{
    return new Temp_label(name);
}

Name_name::Name_name(Temp_label *_name,TempType _type,int _len,const std::string &_structname)
    : name(_name),type(_type),len(_len),structname(_structname) {}

Name_name *Name_newname_int(Temp_label *name)
{
    return new Name_name(name,TempType::INT_TEMP);
}

Name_name *Name_newname_int_ptr(Temp_label *name,int len)
{
    return new Name_name(name,TempType::INT_PTR,len);
}

Name_name *Name_newname_struct(Temp_label *name,const std::string &structname)
{
    return new Name_name(name,TempType::STRUCT_TEMP,0,structname);
}

Name_name *Name_newname_struct_ptr(Temp_label *name,int len,const std::string &structname)
{
    return new Name_name(name,TempType::STRUCT_PTR,len,structname);
}

AS_operand* AS_Operand_Temp(Temp_temp *temp)
{
    auto p = new AS_operand();
    p->kind = OperandKind::TEMP;
    p->u.TEMP = temp;
    return p;
}

AS_operand* AS_Operand_Name(Name_name *name)
{
    auto p = new AS_operand();
    p->kind = OperandKind::NAME;
    p->u.NAME = name;
    return p;
}

AS_operand* AS_Operand_Const(int iconst)
{
    auto p = new AS_operand();
    p->kind = OperandKind::ICONST;
    p->u.ICONST = iconst;
    return p;
}

void TempSet_add(TempSet tl, Temp_temp* t){
  assert(tl != nullptr);
  (*tl).emplace(t);
}

bool TempSet_contains(TempSet tl, Temp_temp* t){
  return (*tl).find(t) != (*tl).end();
}

TempSet TempSet_union(TempSet tl1, TempSet tl2){
  assert(tl1 != nullptr);
  assert(tl2 != nullptr);

  TempSet unionSet = new TempSet_;
  for(auto &it : *tl1){
    (*unionSet).emplace(it);
  }
  for(auto &it : *tl2){
    (*unionSet).emplace(it);
  }
  return unionSet;
}

TempSet TempSet_diff(TempSet tl1, TempSet tl2){
  assert(tl1 != nullptr);
  assert(tl2 != nullptr);

  TempSet diffSet = new TempSet_;
  for(auto &it : *tl1){
    (*diffSet).emplace(it);
  }
  for(auto &it : *tl2){
    (*diffSet).erase(it);
  }
  return diffSet;
}

bool TempSet_eq(TempSet tl1, TempSet tl2){
  assert(tl1 != nullptr);
  assert(tl2 != nullptr);

  if((*tl1).size() != (*tl2).size()) return false;
  for(auto &it : *tl1){
    if(!TempSet_contains(tl2, it)) return false;
  }
  return true;
}

void TempSet_remove(TempSet tl, Temp_temp* t){
  assert(tl != nullptr);
  (*tl).erase(t);
}