#include "printASM.h"
#include "asm_arm.h"
#include <iostream>

using namespace std;
using namespace ASM;

void ASM::printAS_global(std::ostream &os, ASM::AS_global *global) {
    // Fixme: add here
}

void ASM::printAS_decl(std::ostream &os, ASM::AS_decl *decl) {
    // Fixme: add here
}


void ASM::printAS_stm(std::ostream &os, AS_stm *stm) {
    // Fixme: add here
}

void ASM::printAS_reg(std::ostream &os, AS_reg *reg) {
    // Fixme: add here
}

void ASM::printAS_func(std::ostream &os, AS_func *func) {
    for(const auto &stm : func->stms) {
        printAS_stm(os, stm);
    }
}

void ASM::printAS_prog(std::ostream &os, AS_prog *prog) {

    os << ".section .data\n";
    for(const auto &global : prog->globals) {
        printAS_global(os, global);
    }

    os << ".section .text\n";

    for(const auto &decl : prog->decls) {
        printAS_decl(os, decl);
    }

    for(const auto &func : prog->funcs) {
        printAS_func(os, func);
    }

}