#ifndef __PRINTLLVM
#define __PRINTLLVM

#include "llvm_ir.h"
#include <iostream>

namespace LLVMIR
{
    void printL_def(std::ostream &os,LLVMIR::L_def *def);
    void printL_stm(std::ostream &os,LLVMIR::L_stm *stm);
    void printL_oper(std::ostream &os,AS_operand *oper);
    void printL_prog(std::ostream &os,LLVMIR::L_prog *prog);
    void printL_func(std::ostream &os,LLVMIR::L_func *func);
    void printL_block(std::ostream &os,LLVMIR::L_block *block);
}


#endif