#include "llvm_ir.h"
#include <string>
#include <vector>
#include <cassert>

using namespace std;
using namespace LLVMIR;

LLVMIR::L_structdef::L_structdef(const std::string &_name,const std::vector<TempDef> &_members)
    : name(_name), members(_members) {}

LLVMIR::L_funcdecl::L_funcdecl(const std::string &_name,const std::vector<TempDef> &_args,FuncType _ret)
    : name(_name), args(_args), ret(_ret) {}

LLVMIR::L_globaldef::L_globaldef(const std::string &_name,TempDef _def, const std::vector<int> &_init)
    : name(_name), def(_def), init(_init) {}

L_def* LLVMIR::L_Structdef(const std::string &name,const std::vector<TempDef> &members)
{
    auto p = new L_def();
    p->kind = L_DefKind::SRT;
    p->u.SRT = new L_structdef(name,members);
    return p;
}

L_def* LLVMIR::L_Funcdecl(const std::string &name,const std::vector<TempDef> &args,FuncType ret)
{
    auto p = new L_def();
    p->kind = L_DefKind::FUNC;
    p->u.FUNC = new L_funcdecl(name,args,ret);
    return p;
}

L_def* LLVMIR::L_Globaldef(const std::string &name,TempDef def, const std::vector<int> &init)
{
    auto p = new L_def();
    p->kind = L_DefKind::GLOBAL;
    p->u.GLOBAL = new L_globaldef(name,def,init);
    return p;
}

LLVMIR::L_binop::L_binop(L_binopKind _op,AS_operand* _left,AS_operand *_right,AS_operand *_dst)
    : op(_op), left(_left), right(_right), dst(_dst) {}

LLVMIR::L_load::L_load(AS_operand *_dst,AS_operand *_ptr)
    : dst(_dst), ptr(_ptr) {}

LLVMIR::L_store::L_store(AS_operand *_src,AS_operand *_ptr)
    : src(_src), ptr(_ptr) {}

LLVMIR::L_label::L_label(Temp_label *_label)
    : label(_label) {}

LLVMIR::L_jump::L_jump(Temp_label *_jump)
    : jump(_jump) {}

LLVMIR::L_cmp::L_cmp(L_relopKind _op,AS_operand *_left,AS_operand *_right,AS_operand *_dst)
    : op(_op), left(_left), right(_right), dst(_dst) {}

LLVMIR::L_cjump::L_cjump(AS_operand *_dst,Temp_label *_true_label,Temp_label *_false_label)
    : dst(_dst), true_label(_true_label), false_label(_false_label) {}

LLVMIR::L_move::L_move(AS_operand *_src,AS_operand *_dst)
    : src(_src), dst(_dst) {}

LLVMIR::L_call::L_call(const std::string &_fun,AS_operand *_res,const std::vector<AS_operand*> &_args)
    : fun(_fun), res(_res), args(_args) {}

LLVMIR::L_voidcall::L_voidcall(const std::string &_fun,const std::vector<AS_operand*> &_args)
    : fun(_fun), args(_args) {}

LLVMIR::L_ret::L_ret(AS_operand *_ret)
    : ret(_ret) {}

LLVMIR::L_phi::L_phi(AS_operand *_dst,const std::vector<std::pair<AS_operand*,Temp_label*>> &_phis)
    : dst(_dst), phis(_phis) {}

LLVMIR::L_alloca::L_alloca(AS_operand *_dst)
    : dst(_dst) {}

LLVMIR::L_gep::L_gep(AS_operand *_new_ptr,AS_operand *_base_ptr,AS_operand *_index)
    : new_ptr(_new_ptr), base_ptr(_base_ptr), index(_index) {}

L_stm* LLVMIR::L_Binop(L_binopKind op,AS_operand* left,AS_operand *right,AS_operand *dst)
{
    auto p = new L_stm();
    p->type = L_StmKind::T_BINOP;
    p->u.BINOP = new L_binop(op,left,right,dst);
    return p;
}

L_stm* LLVMIR::L_Load(AS_operand *dst,AS_operand *ptr)
{
    auto p = new L_stm();
    p->type = L_StmKind::T_LOAD;
    p->u.LOAD = new L_load(dst,ptr);
    return p;
}

L_stm* LLVMIR::L_Store(AS_operand *src,AS_operand *ptr)
{
    auto p = new L_stm();
    p->type = L_StmKind::T_STORE;
    p->u.STORE = new L_store(src,ptr);
    return p;
}

L_stm* LLVMIR::L_Label(Temp_label *label)
{
    auto p = new L_stm();
    p->type = L_StmKind::T_LABEL;
    p->u.LABEL = new L_label(label);
    return p;
}

L_stm* LLVMIR::L_Jump(Temp_label *jump)
{
    auto p = new L_stm();
    p->type = L_StmKind::T_JUMP;
    p->u.JUMP = new L_jump(jump);
    return p;
}

L_stm* LLVMIR::L_Cmp(L_relopKind op,AS_operand *left,AS_operand *right,AS_operand *dst)
{
    auto p = new L_stm();
    p->type = L_StmKind::T_CMP;
    p->u.CMP = new L_cmp(op,left,right,dst);
    return p;
}

L_stm* LLVMIR::L_Cjump(AS_operand *dst,Temp_label *true_label,Temp_label *false_label)
{
    auto p = new L_stm();
    p->type = L_StmKind::T_CJUMP;
    p->u.CJUMP = new L_cjump(dst,true_label,false_label);
    return p;
}

L_stm* LLVMIR::L_Move(AS_operand *src,AS_operand *dst)
{
    auto p = new L_stm();
    p->type = L_StmKind::T_MOVE;
    p->u.MOVE = new L_move(src,dst);
    return p;
}

L_stm* LLVMIR::L_Call(const std::string &fun,AS_operand *res,const std::vector<AS_operand*> &args)
{
    auto p = new L_stm();
    p->type = L_StmKind::T_CALL;
    p->u.CALL = new L_call(fun,res,args);
    return p;
}

L_stm* LLVMIR::L_Voidcall(const std::string &fun,const std::vector<AS_operand*> &args)
{
    auto p = new L_stm();
    p->type = L_StmKind::T_VOID_CALL;
    p->u.VOID_CALL = new L_voidcall(fun,args);
    return p;
}

L_stm* LLVMIR::L_Ret(AS_operand *ret)
{
    auto p = new L_stm();
    p->type = L_StmKind::T_RETURN;
    p->u.RET = new L_ret(ret);
    return p;
}

L_stm* LLVMIR::L_Phi(AS_operand *dst,const std::vector<std::pair<AS_operand*,Temp_label*>> &phis)
{
    auto p = new L_stm();
    p->type = L_StmKind::T_PHI;
    p->u.PHI = new L_phi(dst,phis);
    return p;
}

L_stm* LLVMIR::L_Alloca(AS_operand *dst)
{
    auto p = new L_stm();
    p->type = L_StmKind::T_ALLOCA;
    p->u.ALLOCA = new L_alloca(dst);
    return p;
}

L_stm* LLVMIR::L_Gep(AS_operand *new_ptr,AS_operand *base_ptr,AS_operand *index)
{
    auto p = new L_stm();
    p->type = L_StmKind::T_GEP;
    p->u.GEP = new L_gep(new_ptr,base_ptr,index);
    return p;
}

LLVMIR::L_block::L_block(Temp_label *_label,const std::unordered_set<Temp_label*> &_succs,const std::list<L_stm*> &_instrs)
    : label(_label), succs(_succs), instrs(_instrs) {}

LLVMIR::L_func::L_func(const std::string &_name,FuncType _ret,const std::vector<Temp_temp*> _args,const std::list<LLVMIR::L_block*> &_blocks)
    : name(_name), ret(_ret), args(_args), blocks(_blocks) {}

L_block* LLVMIR::L_Block(const std::list<L_stm*> instrs)
{
    auto label_ins = instrs.front();
    if(label_ins->type != L_StmKind::T_LABEL)
    {
        assert(0);
    }
    auto label = label_ins->u.LABEL->label;
    auto jump_ins = instrs.back();
    unordered_set<Temp_label*> succs;
    if(jump_ins->type == L_StmKind::T_CJUMP)
    {
        succs.emplace(jump_ins->u.CJUMP->true_label);
        succs.emplace(jump_ins->u.CJUMP->false_label);
    }
    else if(jump_ins->type == L_StmKind::T_JUMP)
    {
        succs.emplace(jump_ins->u.JUMP->jump);
    }
    else if(jump_ins->type == L_StmKind::T_RETURN)
    {

    }
    else
    {
        assert(0);
    }
    return new L_block(label,succs,instrs);
}

LLVMIR::L_prog::L_prog(const std::vector<L_def*> &_defs,const std::vector<L_func*> &_funcs)
    : defs(_defs), funcs(_funcs) {}