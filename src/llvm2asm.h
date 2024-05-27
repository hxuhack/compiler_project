#ifndef __LLVM2ASM
#define __LLVM2ASM

#include "llvm_ir.h"
#include "asm_arm.h"
#include "temp.h"

#include <vector>
#include <string>
#include <unordered_map>
#include <list>

using namespace std;
using namespace LLVMIR;
using namespace ASM;

void structLayoutInit(vector<L_def *> &defs);
void set_stack(L_func &func);
void new_frame(list<AS_stm *> &as_list, L_func &func);
void free_frame(list<AS_stm *> &as_list);
void allocReg(list<AS_stm *> &as_list, L_func &func);

void llvm2asmBinop(list<AS_stm *> &as_list, L_stm *binop_stm);
void llvm2asmLoad(list<AS_stm *> &as_list, L_stm *load_stm);
void llvm2asmStore(list<AS_stm *> &as_list, L_stm *store_stm);
void llvm2asmMov(list<AS_stm *> &as_list, L_stm *mov_stm);
void llvm2asmCmp(list<AS_stm *> &as_list, L_stm *cmp_stm);
void llvm2asmCJmp(list<AS_stm *> &as_list, L_stm *cjmp_stm);
void llvm2asmRet(list<AS_stm *> &as_list, L_stm *ret_stm);
void llvm2asmGep(list<AS_stm *> &as_list, L_stm *gep_stm);
void llvm2asmCall(list<AS_stm *> &as_list, L_stm *call);
void llvm2asmVoidCall(list<AS_stm *> &as_list, L_stm *call);

void llvm2asmStm(list<AS_stm *> &as_list, L_stm &stm, L_func &func);
void llvm2asmGlobal(vector<AS_global *> &globals, L_def &def);
void llvm2asmDecl(vector<AS_decl *> &decls, L_def &def);
AS_func *llvm2asmFunc(L_func &func);
AS_prog *llvm2asm(L_prog &p);

#endif