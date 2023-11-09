#ifndef __LLVM_IR
#define __LLVM_IR

#include "temp.h"
#include <string>
#include <vector>
#include <unordered_set>
#include <list>

namespace LLVMIR
{
enum class ReturnType
{
    INT_TYPE,
    STRUCT_TYPE,
    VOID_TYPE
};

struct FuncType
{
    ReturnType type;
    std::string structname;
    FuncType(ReturnType _type = ReturnType::INT_TYPE,const std::string _name = std::string())
        : type(_type), structname(_name) {}
};

enum class L_DefKind
{
    SRT,
    GLOBAL,
    FUNC
};

struct L_structdef
{
    std::string name;
    std::vector<TempDef> members;
    L_structdef(const std::string &_name,const std::vector<TempDef> &_members);
};

struct L_funcdecl
{
    std::string name;
    std::vector<TempDef> args;
    FuncType ret;
    L_funcdecl(const std::string &_name,const std::vector<TempDef> &_args,FuncType _ret);
};

struct L_globaldef
{
    std::string name;
    TempDef def;
    std::vector<int> init;
    L_globaldef(const std::string &_name,TempDef _def, const std::vector<int> &_init);
};

struct L_def
{
    L_DefKind kind;
    union 
    {
        L_funcdecl *FUNC;
        L_structdef *SRT;
        L_globaldef *GLOBAL;
    } u;
};

L_def* L_Structdef(const std::string &name,const std::vector<TempDef> &members);
L_def* L_Funcdecl(const std::string &name,const std::vector<TempDef> &args,FuncType ret);
L_def* L_Globaldef(const std::string &name,TempDef def, const std::vector<int> &init);

enum class L_binopKind
{
    T_plus,
    T_minus,
    T_mul,
    T_div,
};

enum class L_relopKind
{
    T_eq,
    T_ne,
    T_lt,
    T_gt,
    T_le,
    T_ge,
};

enum class L_StmKind
{
    T_BINOP, T_LOAD, T_STORE, T_LABEL,T_JUMP, T_CMP, T_CJUMP, T_MOVE, T_CALL, T_VOID_CALL, T_RETURN, T_PHI, T_NULL, T_ALLOCA, T_GEP
};

struct L_binop
{
    L_binopKind op;
    AS_operand *left,*right,*dst;
    L_binop(L_binopKind _op,AS_operand* _left,AS_operand *_right,AS_operand *_dst);
};

struct L_load
{
    AS_operand *dst,*ptr;
    L_load(AS_operand *_dst,AS_operand *_ptr);
};

struct L_store
{
    AS_operand *src,*ptr;
    L_store(AS_operand *_src,AS_operand *_ptr);
};

struct L_label
{
    Temp_label *label;
    L_label(Temp_label *_label);
};

struct L_jump
{
    Temp_label *jump;
    L_jump(Temp_label *_jump);
};

struct L_cmp
{
    L_relopKind op;
    AS_operand *left,*right;
    AS_operand *dst;
    L_cmp(L_relopKind _op,AS_operand *_left,AS_operand *_right,AS_operand *_dst);
};

struct L_cjump
{
    AS_operand *dst;
    Temp_label *true_label,*false_label;
    L_cjump(AS_operand *_dst,Temp_label *_true_label,Temp_label *_false_label);
};

struct L_move
{
    AS_operand *src,*dst;
    L_move(AS_operand *_src,AS_operand *_dst);
};

struct L_call
{
    std::string fun;
    AS_operand *res;
    std::vector<AS_operand*> args;
    L_call(const std::string &_fun,AS_operand *_res,const std::vector<AS_operand*> &_args);
};

struct L_voidcall
{
    std::string fun;
    std::vector<AS_operand*> args;
    L_voidcall(const std::string &_fun,const std::vector<AS_operand*> &_args);
};

struct L_ret
{
    AS_operand *ret;
    L_ret(AS_operand *_ret);
};

struct L_phi
{
    AS_operand *dst;
    std::vector<std::pair<AS_operand*,Temp_label*>> phis;
    L_phi(AS_operand *_dst,const std::vector<std::pair<AS_operand*,Temp_label*>> &_phis);
};

struct L_alloca
{
    AS_operand *dst;
    L_alloca(AS_operand *_dst);
};

struct L_gep
{
    AS_operand *new_ptr,*base_ptr,*index;
    L_gep(AS_operand *_new_ptr,AS_operand *_base_ptr,AS_operand *_index);
};

struct L_stm 
{
    L_StmKind type;
    union {
        L_binop *BINOP;
        L_load *LOAD;
        L_store *STORE;
        L_label *LABEL;
        L_jump *JUMP;
        L_cmp *CMP;
        L_cjump *CJUMP;
        L_move *MOVE;
        L_call *CALL;
        L_voidcall *VOID_CALL;
        L_ret *RET;
        L_phi *PHI;
        L_alloca *ALLOCA;
        L_gep *GEP;
    } u;
};

L_stm* L_Binop(L_binopKind op,AS_operand* left,AS_operand *right,AS_operand *dst);
L_stm* L_Load(AS_operand *dst,AS_operand *ptr);
L_stm* L_Store(AS_operand *src,AS_operand *ptr);
L_stm* L_Label(Temp_label *label);
L_stm* L_Jump(Temp_label *jump);
L_stm* L_Cmp(L_relopKind op,AS_operand *left,AS_operand *right,AS_operand *dst);
L_stm* L_Cjump(AS_operand *dst,Temp_label *true_label,Temp_label *false_label);
L_stm* L_Move(AS_operand *src,AS_operand *dst);
L_stm* L_Call(const std::string &fun,AS_operand *res,const std::vector<AS_operand*> &args);
L_stm* L_Voidcall(const std::string &fun,const std::vector<AS_operand*> &args);
L_stm* L_Ret(AS_operand *ret);
L_stm* L_Phi(AS_operand *dst,const std::vector<std::pair<AS_operand*,Temp_label*>> &phis);
L_stm* L_Alloca(AS_operand *dst);
L_stm* L_Gep(AS_operand *new_ptr,AS_operand *base_ptr,AS_operand *index);

struct L_block
{
    Temp_label *label;
    std::unordered_set<Temp_label*> succs;
    std::list<L_stm*> instrs;
    L_block(Temp_label *_label,const std::unordered_set<Temp_label*> &_succs,const std::list<L_stm*> &_instrs);
};

struct L_func
{
    std::string name;
    FuncType ret;
    std::vector<Temp_temp*> args;
    std::list<L_block*> blocks;
    L_func(const std::string &_name,FuncType _ret,const std::vector<Temp_temp*> _args,const std::list<L_block*> &_blocks);
};

struct L_prog
{
    std::vector<L_def*> defs;
    std::vector<L_func*> funcs;
    L_prog(const std::vector<L_def*> &_defs,const std::vector<L_func*> &_funcs);
};

L_block* L_Block(const std::list<L_stm*> instrs);

}

#endif