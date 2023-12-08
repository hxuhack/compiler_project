#include "asm_arm.h"
#include <string>
#include <vector>

using namespace std;
using namespace ASM;

ASM::AS_reg::AS_reg(int _reg, int _offset)
    : reg(_reg), offset(_offset) {}

ASM::AS_label::AS_label(const std::string _name)
    : name(_name) {}

ASM::AS_decl::AS_decl(const std::string _name)
    : name(_name) {}

ASM::AS_global::AS_global(AS_label *_label, int _init, int _len)
        : label(_label), init(_init), len(_len) {}

ASM::AS_binop::AS_binop(AS_binopkind _op, AS_reg *_left, AS_reg *_right, AS_reg *_dst)
    : op(_op), left(_left), right(_right), dst(_dst) {}

ASM::AS_ldr::AS_ldr(AS_reg *_dst, AS_reg *_ptr)
    : dst(_dst), ptr(_ptr) {}

ASM::AS_str::AS_str(AS_reg *_src, AS_reg *_ptr)
    : src(_src), ptr(_ptr) {}

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

ASM::AS_ret::AS_ret() {}

AS_stm* ASM::AS_Binop(AS_binopkind op, AS_reg* left, AS_reg *right, AS_reg *dst) {
    auto p = new AS_stm();
    p->type = AS_stmkind::BINOP;
    p->u.BINOP = new AS_binop(op, left, right, dst);
    return p;
}

AS_stm* ASM::AS_Ldr(AS_reg *dst, AS_reg *ptr) {
    auto p = new AS_stm();
    p->type = AS_stmkind::LDR;
    p->u.LDR = new AS_ldr(dst, ptr);
    return p;
}

AS_stm* ASM::AS_Str(AS_reg *src, AS_reg *ptr) {
    auto p = new AS_stm();
    p->type = AS_stmkind::STR;
    p->u.STR = new AS_str(src, ptr);
    return p;
}

AS_stm* ASM::AS_Adr(AS_label *label, AS_reg *reg) {
    auto p = new AS_stm();
    p->type = AS_stmkind::ADR;
    p->u.ADR = new AS_adr(label, reg);
    return p;
}

AS_stm* ASM::AS_Label(AS_label *label) {
    auto p = new AS_stm();
    p->type = AS_stmkind::LABEL;
    p->u.LABEL = new AS_label(*label);
    return p;
}

AS_stm* ASM::AS_B(AS_label *jump) {
    auto p = new AS_stm();
    p->type = AS_stmkind::B;
    p->u.B = new AS_b(jump);
    return p;
}

AS_stm* ASM::AS_BCond(AS_relopkind op, AS_label *jump) {
    auto p = new AS_stm();
    p->type = AS_stmkind::BCOND;
    p->u.BCOND = new AS_bcond(op, jump);
    return p;
}

AS_stm* ASM::AS_Bl(AS_label *jump) {
    auto p = new AS_stm();
    p->type = AS_stmkind::BL;
    p->u.BL = new AS_bl(jump);
    return p;
}

AS_stm* ASM::AS_Cmp(AS_reg *left, AS_reg *right) {
    auto p = new AS_stm();
    p->type = AS_stmkind::CMP;
    p->u.CMP = new AS_cmp(left, right);
    return p;
}

AS_stm* ASM::AS_Mov(AS_reg *src, AS_reg *dst) {
    auto p = new AS_stm();
    p->type = AS_stmkind::MOV;
    p->u.MOV = new AS_mov(src, dst);
    return p;
}

AS_stm* ASM::AS_Ret() {
    auto p = new AS_stm();
    p->type = AS_stmkind::RET;
    p->u.RET = new AS_ret();
    return p;
}

ASM::AS_func::AS_func(const std::list<AS_stm*> &_stms)
    : stms(_stms) {}

ASM::AS_prog::AS_prog(const std::vector<AS_global*> &_globals, const std::vector<AS_decl*> &_decls, const std::vector<AS_func*> &_funcs)
    : globals(_globals), decls(_decls), funcs(_funcs) {}