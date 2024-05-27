#ifndef __ASM_ARM
#define __ASM_ARM

#include "temp.h"
#include <string>
#include <vector>
#include <unordered_set>
#include <list>

namespace ASM {
enum AS_type{
    IMM,//立即数
    SP,//栈指针
    Xn,//x0-x30
    ADR//地址
};
struct AS_reg {
    AS_type type;
    union
    {
        int offset;
        struct AS_address *add;
    } u;

    AS_reg(AS_type _type, int _offset);
    AS_reg(AS_type _type, AS_address *_add);
};


struct AS_address
{
    AS_reg *base;//<SP|Xn>
    int imm;
    AS_reg *reg;
    AS_address(AS_reg*,int);
    AS_address(AS_reg*,AS_reg*);
    AS_address(AS_reg*,int,AS_reg*);

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
    MOVZ,
    MOVK,
    LDR,
    LDP,
    STR,
    STP,
    LABEL,
    B,
    BCOND,
    BL,
    CMP,
    RET,
    ADR,
    LLVMIR
};

struct AS_binop {
    AS_binopkind op;
    AS_reg *left, *right, *dst;

    AS_binop(AS_binopkind _op, AS_reg *_left, AS_reg *_right, AS_reg *_dst);
};

struct AS_ldr {
    AS_reg *dst;
    AS_reg *ptr;
    int post_index;

    AS_ldr(AS_reg *_dst, AS_reg *_ptr,int _post=0);
};
struct AS_ldp {
    AS_reg *dst1;
    AS_reg *dst2;
    AS_reg *ptr;
    int post_index;

    AS_ldp(AS_reg *_dst1,AS_reg *_dst2, AS_reg *_ptr,int _post=0);
};
struct AS_str {
    AS_reg *src;
    AS_reg *ptr;
    int pre_index;

    AS_str(AS_reg *_src, AS_reg *_ptr,int _pre=0);
};
struct AS_stp {
    AS_reg *src1;
    AS_reg *src2;
    AS_reg *ptr;
    int pre_index;


    AS_stp(AS_reg *_src1,AS_reg *_src2, AS_reg *_ptr,int _pre);
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
struct AS_movz{
    AS_reg *src, *dst;
    AS_movz(AS_reg * _src, AS_reg *_dst);


};
struct AS_movk{
    AS_reg *src, *dst;
    AS_movk(AS_reg * _src, AS_reg *_dst);
};
struct AS_ret {

    AS_ret();
};
struct AS_llvmir
{
    std::string llvmir;
    AS_llvmir(std::string _str);
};

struct AS_stm {
    AS_stmkind type;
    union {
        AS_binop *BINOP;
        AS_mov *MOV;
        AS_movz *MOVZ;
        AS_movk *MOVK;
        AS_ldr *LDR;
        AS_ldp *LDP;
        AS_str *STR;
        AS_stp *STP;
        AS_adr *ADR;
        AS_label *LABEL;
        AS_b *B;
        AS_bcond *BCOND;
        AS_bl *BL;
        AS_cmp *CMP;
        
        AS_ret *RET;
        AS_llvmir *LLVMIR;
    } u;
};

AS_stm* AS_Binop(AS_binopkind op, AS_reg* left, AS_reg *right, AS_reg *dst);
AS_stm* AS_Mov(AS_reg *src, AS_reg *dst);
AS_stm* AS_Movz(AS_reg *src, AS_reg *dst);
AS_stm* AS_Movk(AS_reg *src, AS_reg *dst);
AS_stm* AS_Ldr(AS_reg *dst, AS_reg *ptr, int _post=0);
AS_stm* AS_Ldp(AS_reg *dst1, AS_reg *dst2, AS_reg *ptr, int _post);
AS_stm* AS_Adr(AS_label *label, AS_reg *reg);
AS_stm* AS_Str(AS_reg *src, AS_reg *ptr, int _pre=0);
AS_stm* AS_Stp(AS_reg *src1,AS_reg *src2, AS_reg *ptr, int _pre);
AS_stm* AS_Label(AS_label *label);
AS_stm* AS_B(AS_label *jump);
AS_stm* AS_BCond(AS_relopkind _op, AS_label *_jump);
AS_stm* AS_Bl(AS_label *jump);
AS_stm* AS_Cmp(AS_reg *_left, AS_reg *_right);
AS_stm* AS_Ret();
AS_stm* AS_Llvmir(std::string _str);

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

};

#endif