#ifndef __TEMP
#define __TEMP

#include <string>
#include <unordered_set>
enum class TempType
{
    INT_TEMP,
    INT_PTR,
    STRUCT_TEMP,
    STRUCT_PTR
};

struct Temp_temp
{
    int num;
    TempType type;
    std::string structname;
    std::string varname;
    int len;
    Temp_temp(int _num,TempType _type = TempType::INT_TEMP,int _len = 0,const std::string& _sname = std::string());
};

Temp_temp* Temp_newtemp_int();
Temp_temp* Temp_newtemp_int_ptr(int len);
Temp_temp* Temp_newtemp_struct(const std::string& name);
Temp_temp* Temp_newtemp_struct_ptr(int len, const std::string& name);

typedef std::unordered_set<Temp_temp*> TempSet_;
typedef TempSet_* TempSet;

void TempSet_add(TempSet tl, Temp_temp* t);
bool TempSet_contains(TempSet tl, Temp_temp* t);
TempSet TempSet_union(TempSet tl1, TempSet tl2);
TempSet TempSet_diff(TempSet tl1, TempSet tl2);
bool TempSet_eq(TempSet tl1, TempSet tl2);
void TempSet_remove(TempSet tl, Temp_temp* t);


struct TempDef
{
    TempType kind;
    int len;
    std::string structname;
    TempDef(TempType _kind = TempType::INT_TEMP,int _len = 0,const std::string &_structname = std::string());
};

struct Temp_label
{
    std::string name;
    Temp_label(std::string _name);
};

Temp_label* Temp_newlabel();
Temp_label* Temp_newlabel_named(const std::string &name);

struct Name_name
{
    Temp_label *name;
    TempType type;
    std::string structname;
    int len;
    Name_name(Temp_label *_name,TempType _type,int _len = 0,const std::string &_structname = std::string());
};

Name_name *Name_newname_int(Temp_label *name);
Name_name *Name_newname_int_ptr(Temp_label *name,int len);
Name_name *Name_newname_struct(Temp_label *name,const std::string &structname);
Name_name *Name_newname_struct_ptr(Temp_label *name,int len,const std::string &structname);

enum class OperandKind
{
    TEMP, NAME, ICONST
};

struct AS_operand 
{
    OperandKind kind;
    union {
        Temp_temp *TEMP;
        Name_name *NAME;
        int ICONST;
    } u;

    bool operator == (const AS_operand &a) const{
        return kind==a.kind && u.TEMP==a.u.TEMP;
    }
};

AS_operand* AS_Operand_Temp(Temp_temp *temp);
AS_operand* AS_Operand_Name(Name_name *name);
AS_operand* AS_Operand_Const(int iconst);

#endif
