#ifndef __PRINTASM
#define __PRINTASM

#include "asm_arm.h"
#include <iostream>

namespace ASM
{
    std::string printAS_add(AS_address *adr);
    void printAS_global(std::ostream &os, ASM::AS_global *global);
    void printAS_decl(std::ostream &os, ASM::AS_decl *decl);
    void printAS_stm(std::ostream &os, ASM::AS_stm *stm);
    std::string printAS_reg(AS_reg *reg, bool integer=true);
    void printAS_func(std::ostream &os, ASM::AS_func *func);
    void printAS_prog(std::ostream &os, ASM::AS_prog *prog);
}

#endif