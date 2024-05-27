#include "asm_arm.h"
#include <string>
#include <vector>
#include <cassert>
using namespace std;
using namespace ASM;

ASM::AS_reg::AS_reg(AS_type _type, int _offset)
    : type(_type) { this->u.offset = _offset; }

ASM::AS_reg::AS_reg(AS_type _type, AS_address *_add)
    : type(_type) { this->u.add = _add; }

ASM::AS_label::AS_label(const std::string _name)
    : name(_name) {}

ASM::AS_address::AS_address(AS_reg *_base, int _imm)
    : base(_base), imm(_imm), reg(nullptr) {}

ASM::AS_address::AS_address(AS_reg *_base, AS_reg *_reg)
    : base(_base), reg(_reg), imm(0) {}

ASM::AS_address::AS_address(AS_reg *_base, int _imm, AS_reg *_reg)
    : base(_base), imm(_imm), reg(_reg) {}

ASM::AS_decl::AS_decl(const std::string _name)
    : name(_name) {}

ASM::AS_global::AS_global(AS_label *_label, int _init, int _len)
    : label(_label), init(_init), len(_len) {}

ASM::AS_binop::AS_binop(AS_binopkind _op, AS_reg *_left, AS_reg *_right, AS_reg *_dst)
    : op(_op), left(_left), right(_right), dst(_dst) {}

ASM::AS_ldr::AS_ldr(AS_reg *_dst, AS_reg *_ptr, int _post)
    : dst(_dst), ptr(_ptr), post_index(_post) {}

ASM::AS_ldp::AS_ldp(AS_reg *_dst1, AS_reg *_dst2, AS_reg *_ptr, int _post)
    : dst1(_dst1), dst2(_dst2), ptr(_ptr), post_index(_post) {}

ASM::AS_str::AS_str(AS_reg *_src, AS_reg *_ptr, int _pre)
    : src(_src), ptr(_ptr), pre_index(_pre) {}

ASM::AS_stp::AS_stp(AS_reg *_src1, AS_reg *_src2, AS_reg *_ptr, int _pre)
    : src1(_src1), src2(_src2), ptr(_ptr), pre_index(_pre) {}

ASM::AS_adr::AS_adr(AS_label *_label, AS_reg *_reg)
    : label(_label), reg(_reg) {}

ASM::AS_b::AS_b(AS_label *_jump)
    : jump(_jump) {}

ASM::AS_bcond::AS_bcond(AS_relopkind _op, AS_label *_jump)
    : op(_op), jump(_jump) {}

ASM::AS_bl::AS_bl(AS_label *_jump)
    : jump(_jump) {}

ASM::AS_cmp::AS_cmp(AS_reg *_left, AS_reg *_right)
    : left(_left), right(_right) {}

ASM::AS_mov::AS_mov(AS_reg *_src, AS_reg *_dst)
    : src(_src), dst(_dst) {}
ASM::AS_movz::AS_movz(AS_reg *_src, AS_reg *_dst) : src(_src), dst(_dst)
{
    assert(_src->type == ASM::AS_type::IMM);
}
ASM::AS_movk::AS_movk(AS_reg *_src, AS_reg *_dst) : src(_src), dst(_dst)
{
    assert(_src->type == ASM::AS_type::IMM);
}
ASM::AS_ret::AS_ret() {}

ASM::AS_llvmir::AS_llvmir(string _str) : llvmir(_str){};

AS_stm *ASM::AS_Binop(AS_binopkind op, AS_reg *left, AS_reg *right, AS_reg *dst)
{
    auto p = new AS_stm();
    p->type = AS_stmkind::BINOP;
    p->u.BINOP = new AS_binop(op, left, right, dst);
    return p;
}

AS_stm *ASM::AS_Ldr(AS_reg *dst, AS_reg *ptr, int _post)
{
    auto p = new AS_stm();
    p->type = AS_stmkind::LDR;
    p->u.LDR = new AS_ldr(dst, ptr, _post);
    return p;
}
AS_stm *ASM::AS_Ldp(AS_reg *dst1, AS_reg *dst2, AS_reg *ptr, int _post)
{
    auto p = new AS_stm();
    p->type = AS_stmkind::LDP;
    p->u.LDP = new AS_ldp(dst1, dst2, ptr, _post);
    return p;
}
AS_stm *ASM::AS_Str(AS_reg *src, AS_reg *ptr, int _pre)
{
    auto p = new AS_stm();
    p->type = AS_stmkind::STR;
    p->u.STR = new AS_str(src, ptr, _pre);
    return p;
}
AS_stm *ASM::AS_Stp(AS_reg *src1, AS_reg *src2, AS_reg *ptr, int _pre)
{
    auto p = new AS_stm();
    p->type = AS_stmkind::STP;
    p->u.STP = new AS_stp(src1, src2, ptr, _pre);
    return p;
}
AS_stm *ASM::AS_Adr(AS_label *label, AS_reg *reg)
{
    auto p = new AS_stm();
    p->type = AS_stmkind::ADR;
    p->u.ADR = new AS_adr(label, reg);
    return p;
}

AS_stm *ASM::AS_Label(AS_label *label)
{
    auto p = new AS_stm();
    p->type = AS_stmkind::LABEL;
    p->u.LABEL = new AS_label(*label);
    return p;
}

AS_stm *ASM::AS_B(AS_label *jump)
{
    auto p = new AS_stm();
    p->type = AS_stmkind::B;
    p->u.B = new AS_b(jump);
    return p;
}

AS_stm *ASM::AS_BCond(AS_relopkind op, AS_label *jump)
{
    auto p = new AS_stm();
    p->type = AS_stmkind::BCOND;
    p->u.BCOND = new AS_bcond(op, jump);
    return p;
}

AS_stm *ASM::AS_Bl(AS_label *jump)
{
    auto p = new AS_stm();
    p->type = AS_stmkind::BL;
    p->u.BL = new AS_bl(jump);
    return p;
}

AS_stm *ASM::AS_Cmp(AS_reg *left, AS_reg *right)
{
    auto p = new AS_stm();
    p->type = AS_stmkind::CMP;
    p->u.CMP = new AS_cmp(left, right);
    return p;
}

AS_stm *ASM::AS_Movz(AS_reg *src, AS_reg *dst)
{
    auto p = new AS_stm();
    p->type = AS_stmkind::MOVZ;
    p->u.MOVZ = new AS_movz(src, dst);
    return p;
}
AS_stm *ASM::AS_Movk(AS_reg *src, AS_reg *dst)
{
    auto p = new AS_stm();
    p->type = AS_stmkind::MOVK;
    p->u.MOVK = new AS_movk(src, dst);
    return p;
}
AS_stm *ASM::AS_Mov(AS_reg *src, AS_reg *dst)
{
    auto p = new AS_stm();
    p->type = AS_stmkind::MOV;
    p->u.MOV = new AS_mov(src, dst);
    return p;
}

AS_stm *ASM::AS_Ret()
{
    auto p = new AS_stm();
    p->type = AS_stmkind::RET;
    p->u.RET = new AS_ret();
    return p;
}
AS_stm *ASM::AS_Llvmir(std::string _str)
{
    auto p = new AS_stm();
    p->type = AS_stmkind::LLVMIR;
    p->u.LLVMIR = new AS_llvmir(_str);
    return p;
}
ASM::AS_func::AS_func(const std::list<AS_stm *> &_stms)
    : stms(_stms) {}

ASM::AS_prog::AS_prog(const std::vector<AS_global *> &_globals, const std::vector<AS_decl *> &_decls, const std::vector<AS_func *> &_funcs)
    : globals(_globals), decls(_decls), funcs(_funcs) {}