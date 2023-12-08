#ifndef __ASM_ARM
#define __ASM_ARM

#include "temp.h"
#include <string>
#include <vector>
#include <unordered_set>
#include <list>

namespace ASM {

struct AS_reg {
    int reg;
    int offset;

    AS_reg(int _reg, int _offset);
};

struct AS_label {
    std::string name;

    AS_label(const std::string _name);
};

struct AS_decl {
    const std::string name;

    AS_decl(const std::string _name);
};

struct AS_global {
    AS_label *label;
    int init;
    int len;

    AS_global(AS_label *_label, int _init, int _len);
};

enum class AS_binopkind {
    ADD_,
    SUB_,
    MUL_,
    SDIV_,
};

enum class AS_relopkind {
    EQ_,
    NE_,
    LT_,
    GT_,
    LE_,
    GE_,
};

enum class AS_stmkind {
    BINOP,
    MOV,
    LDR,
    STR,
    LABEL,
    B,
    BCOND,
    BL,
    CMP,
    RET,
    ADR,
};

struct AS_binop {
    AS_binopkind op;
    AS_reg *left, *right, *dst;

    AS_binop(AS_binopkind _op, AS_reg *_left, AS_reg *_right, AS_reg *_dst);
};

struct AS_ldr {
    AS_reg *dst, *ptr;

    AS_ldr(AS_reg *_dst, AS_reg *_ptr);
};

struct AS_str {
    AS_reg *src, *ptr;

    AS_str(AS_reg *_src, AS_reg *_ptr);
};

struct AS_adr {
    AS_label* label;
    AS_reg *reg;

    AS_adr(AS_label *_label, AS_reg *_reg);
};

struct AS_b {
    AS_label *jump;

    AS_b(AS_label *_jump);
};

struct AS_bcond {
    AS_relopkind op;
    AS_label *jump;

    AS_bcond(AS_relopkind _op, AS_label *_jump);
};

struct AS_bl {
    AS_label *jump;

    AS_bl(AS_label *_jump);
};

struct AS_cmp {
    AS_reg *left, *right;

    AS_cmp(AS_reg *_left, AS_reg *_right);
};

struct AS_mov {
    AS_reg *src, *dst;

    AS_mov(AS_reg * _src, AS_reg *_dst);
};

struct AS_ret {

    AS_ret();
};

struct AS_stm {
    AS_stmkind type;
    union {
        AS_binop *BINOP;
        AS_mov *MOV;
        AS_ldr *LDR;
        AS_str *STR;
        AS_adr *ADR;
        AS_label *LABEL;
        AS_b *B;
        AS_bcond *BCOND;
        AS_bl *BL;
        AS_cmp *CMP;
        AS_ret *RET;
    } u;
};

AS_stm* AS_Binop(AS_binopkind op, AS_reg* left, AS_reg *right, AS_reg *dst);
AS_stm* AS_Mov(AS_reg *src, AS_reg *dst);
AS_stm* AS_Ldr(AS_reg *dst, AS_reg *ptr);
AS_stm* AS_Adr(AS_label *label, AS_reg *reg);
AS_stm* AS_Str(AS_reg *src, AS_reg *ptr);
AS_stm* AS_Label(AS_label *label);
AS_stm* AS_B(AS_label *jump);
AS_stm* AS_BCond(AS_relopkind _op, AS_label *_jump);
AS_stm* AS_Bl(AS_label *jump);
AS_stm* AS_Cmp(AS_reg *_left, AS_reg *_right);
AS_stm* AS_Ret();

struct AS_func {
    std::list<AS_stm*> stms;

    AS_func(const std::list<AS_stm*> &stms);
};

struct AS_prog {
    std::vector<AS_global*> globals;
    std::vector<AS_decl*> decls;
    std::vector<AS_func*> funcs;

    AS_prog(const std::vector<AS_global*> &_globals, const std::vector<AS_decl*> &_decls, const std::vector<AS_func*> &_funcs);
};

}

#endif