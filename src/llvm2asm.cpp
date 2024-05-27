#include "llvm_ir.h"
#include "asm_arm.h"
#include "temp.h"
#include "llvm2asm.h"
#include "allocReg.h"
#include <queue>
#include <cassert>
#include <iostream>
#include "printASM.h"
#include "printLLVM.h"
#include "register_rules.h"
#include <sstream>
#include <iostream>
using namespace std;
using namespace LLVMIR;
using namespace ASM;

#define INSERT1() printf("%s:%d\n", __FILE__, __LINE__);
static int stack_frame;
static bool alloc_frame = false;
struct StructDef
{
    std::vector<int> offset;
    int size;
    StructDef(std::vector<int> _offset, int _size) : offset(_offset), size(_size) {}
};

static AS_reg *sp = new AS_reg(AS_type::SP, -1);
static unordered_map<int, AS_address *> fpOffset;
static unordered_map<int, AS_relopkind> condMap;
static unordered_map<string, StructDef *> structLayout;
int getMemLength(TempDef &members)
{
    switch (members.kind)
    {
    case TempType::INT_PTR:
        return INT_LENGTH * members.len;
        break;
    case TempType::INT_TEMP:
        return INT_LENGTH;
        break;
    case TempType::STRUCT_PTR:
        return structLayout[members.structname]->size * members.len;
        break;
    case TempType::STRUCT_TEMP:
        return structLayout[members.structname]->size;
        break;
    default:
        assert(0);
    }
}
void structLayoutInit(vector<L_def *> &defs)
{
    // ToDo:计算结构体各个位置的偏移
}

void set_stack(L_func &func)
{
    stack_frame = 0;
    // ToDo:为函数局部变量分配内存，同时记录相对于fp的偏移

    stack_frame = ((stack_frame + 15) >> 4) << 4;
}

void new_frame(list<AS_stm *> &as_list, L_func &func)
{
    // ToDo:在刚刚进入函数的时候，需要调整sp，并将函数参数移入虚拟寄存器
}

void free_frame(list<AS_stm *> &as_list)
{
    as_list.emplace_back(AS_Mov(new AS_reg(AS_type::Xn, XnFP), sp));
}
void llvm2asmBinop(list<AS_stm *> &as_list, L_stm *binop_stm)
{

}

void llvm2asmLoad(list<AS_stm *> &as_list, L_stm *load_stm)
{

}

void llvm2asmStore(list<AS_stm *> &as_list, L_stm *store_stm)
{

}

void llvm2asmCmp(list<AS_stm *> &as_list, L_stm *cmp_stm)
{

}
void llvm2asmMov(list<AS_stm *> &as_list, L_stm *mov_stm)
{

}
void llvm2asmCJmp(list<AS_stm *> &as_list, L_stm *cjmp_stm)
{

}

void llvm2asmRet(list<AS_stm *> &as_list, L_stm *ret_stm)
{

}

void llvm2asmGep(list<AS_stm *> &as_list, L_stm *gep_stm)
{

}

void llvm2asmStm(list<AS_stm *> &as_list, L_stm &stm, L_func &func)
{

    if (!alloc_frame && stm.type != L_StmKind::T_LABEL)
    {
        new_frame(as_list, func);
        alloc_frame = true;
    }

    switch (stm.type)
    {
    case L_StmKind::T_BINOP:
    {
        llvm2asmBinop(as_list, &stm);
        break;
    }
    case L_StmKind::T_LOAD:
    {
        llvm2asmLoad(as_list, &stm);
        break;
    }
    case L_StmKind::T_STORE:
    {
        llvm2asmStore(as_list, &stm);
        break;
    }
    case L_StmKind::T_LABEL:
    {
        auto label = new AS_label(stm.u.LABEL->label->name);
        as_list.push_back(AS_Label(label));
        break;
    }
    case L_StmKind::T_JUMP:
    {
        auto label = new AS_label(stm.u.JUMP->jump->name);
        as_list.push_back(AS_B(label));
        break;
    }
    case L_StmKind::T_CMP:
    {
        llvm2asmCmp(as_list, &stm);
        break;
    }
    case L_StmKind::T_CJUMP:
    {
        llvm2asmCJmp(as_list, &stm);
        break;
    }
    case L_StmKind::T_MOVE:
    {
        llvm2asmMov(as_list, &stm);
        break;
    }
    case L_StmKind::T_CALL:
    {
        llvm2asmCall(as_list, &stm);
        break;
    }
    case L_StmKind::T_VOID_CALL:
    {
        llvm2asmVoidCall(as_list, &stm);
        break;
    }
    case L_StmKind::T_RETURN:
    {
        llvm2asmRet(as_list, &stm);
        break;
    }
    case L_StmKind::T_ALLOCA:
    {
        // Do nothing
        break;
    }
    case L_StmKind::T_GEP:
    {

        llvm2asmGep(as_list, &stm);

        break;
    }
    case L_StmKind::T_PHI:
    {
        //ToDo: 特殊处理
        break;
    }
    case L_StmKind::T_NULL:
    {
        // Do nothing
        break;
    }
    }
    //
}
int save_register(list<AS_stm *> &as_list)
{
    int sub = 0;
    for (auto it = allocateRegs.begin(); it != allocateRegs.end(); ++it)
    {
        // 获取当前元素
        int first = *it;
        ++it; // 移动到下一个元素

        // 检查是否有下一个元素
        if (it != allocateRegs.end())
        {
            int second = *it;
            as_list.push_back(AS_Stp(new AS_reg(AS_type::Xn, first), new AS_reg(AS_type::Xn, second), sp, -2 * INT_LENGTH));
            sub += 2 * INT_LENGTH;
        }
        else
        {
            // 如果`set`中的元素个数是奇数，最后一个元素将单独处理
            as_list.push_back(AS_Str(new AS_reg(AS_type::Xn, first), sp, -INT_LENGTH));
            sub += INT_LENGTH;
            break;
        }
    }
    as_list.push_back(AS_Stp(new AS_reg(AS_type::Xn, XnFP), new AS_reg(AS_type::Xn, XXnl), sp, -2 * INT_LENGTH));
    sub += 2 * INT_LENGTH;
    return sub;
}
void load_register(list<AS_stm *> &as_list)
{
    //ToDo:从栈中按**顺序**加载保存的寄存器
}
void getCalls(AS_reg *&op_reg, AS_operand *as_operand, list<AS_stm *> &as_list)
{
    //ToDo:一个工具函数，应该实现将局部变量（这里应该只会出现数组、结构体地址）、全局变量、临时变量加载到目标op_reg等待使用
}
void llvm2asmVoidCall(list<AS_stm *> &as_list, L_stm *call)
{

    for (int i = 0; i < 8 && i < call->u.VOID_CALL->args.size(); i++)
    {
        AS_reg *param;
        getCalls(param, call->u.VOID_CALL->args[i], as_list);
        as_list.emplace_back(AS_Mov(param, new AS_reg(AS_type::Xn, paramRegs[i])));
    }
    vector<AS_reg *> abcd;
    for (int i = 8; i < call->u.VOID_CALL->args.size(); i++)
    {
        printf("没有这个测试用例，不用这种情况考虑。");
        assert(0);
    }
    save_register(as_list);
    as_list.push_back(AS_Mov(sp, new AS_reg(AS_type::Xn, XnFP)));
    as_list.emplace_back(AS_Bl(new AS_label(call->u.VOID_CALL->fun)));
    load_register(as_list);
}
void llvm2asmCall(list<AS_stm *> &as_list, L_stm *call)
{

    for (int i = 0; i < 8 && i < call->u.CALL->args.size(); i++)
    {
        AS_reg *param;
        getCalls(param, call->u.CALL->args[i], as_list);

        as_list.emplace_back(AS_Mov(param, new AS_reg(AS_type::Xn, paramRegs[i])));
    }
    if (call->u.CALL->args.size() > 8)
    {
        as_list.push_back(AS_Mov(sp, new AS_reg(AS_type::Xn, XXna)));
        int sub = save_register(as_list);
        as_list.push_back(AS_Mov(new AS_reg(AS_type::Xn, XXna), sp));

        int param_sub = 0;
        for (int i = call->u.CALL->args.size() - 1; i >= 8; i--)
        {
            AS_reg *param;
            getCalls(param, call->u.CALL->args[i], as_list);
            param_sub += INT_LENGTH;
            if (-sub - param_sub < -256)
            {
                auto temp = new AS_reg(AS_type::Xn, XXnb);
                as_list.emplace_back(AS_Mov(new AS_reg(AS_type::IMM, -sub - param_sub), temp));

                as_list.emplace_back(AS_Str(param, new AS_reg(AS_type::ADR, new AS_address(sp, temp))));
            }
            else
            {
                as_list.emplace_back(AS_Str(param, new AS_reg(AS_type::ADR, new AS_address(sp, -sub - param_sub))));
            }
        }
        as_list.emplace_back(AS_Binop(AS_binopkind::SUB_, sp, new AS_reg(AS_type::IMM, sub + param_sub), sp));
    }
    else
    {
        save_register(as_list);
    }
    as_list.push_back(AS_Mov(sp, new AS_reg(AS_type::Xn, XnFP)));

    as_list.emplace_back(AS_Bl(new AS_label(call->u.CALL->fun)));
    if (call->u.CALL->args.size() > 8)
    {
        as_list.emplace_back(AS_Binop(AS_binopkind::ADD_, sp, new AS_reg(AS_type::IMM, (call->u.CALL->args.size() - 8) * INT_LENGTH), sp));
    }
    load_register(as_list);
    as_list.emplace_back(AS_Mov(new AS_reg(AS_type::Xn, XXnret), new AS_reg(AS_type::Xn, call->u.CALL->res->u.TEMP->num)));
}

void allocReg(list<AS_stm *> &as_list, L_func &func)
{
    list<InstructionNode *> liveness;

    forwardLivenessAnalysis(liveness, as_list);

    livenessAnalysis(liveness, as_list);
}
struct BLOCKPHI
{
    string label;
    L_stm *phi;
    BLOCKPHI(string _label, L_stm *_phi) : label(_label), phi(_phi) {}
};

AS_func *llvm2asmFunc(L_func &func)
{
    list<AS_stm *> stms;
    list<BLOCKPHI *> phi;
    unordered_map<string, list<AS_stm *>::iterator> block_map;
    auto p = new AS_func(stms);
    auto func_label = new AS_label(func.name);
    p->stms.push_back(AS_Label(func_label));
    for (auto &x : fpOffset)
    {
        std::ostringstream oss;
        oss << x.first << ":" << printAS_add(x.second).c_str() << endl;
        p->stms.push_back(AS_Llvmir(oss.str()));
    }
    string temp_label = "";
    for (const auto &block : func.blocks)
    {
        for (const auto &instr : block->instrs)
        {
            std::ostringstream oss;
            printL_stm(oss, instr);
            p->stms.push_back(AS_Llvmir(oss.str()));
            llvm2asmStm(p->stms, *instr, func);
            if (instr->type == L_StmKind::T_PHI)
            {
                phi.push_back(new BLOCKPHI(temp_label, instr));
            }
            if (instr->type == L_StmKind::T_LABEL)
            {
                temp_label = instr->u.LABEL->label->name;
            }
            if (temp_label.length() > 0)
            {
                block_map[temp_label] = --p->stms.end();
            }
        }
    }
    //ToDo:处理PHI语句

    allocReg(p->stms, func);
    return p;
}

void llvm2asmDecl(vector<AS_decl *> &decls, L_def &def)
{
    switch (def.kind)
    {
    case L_DefKind::GLOBAL:
    {
        return;
    }
    case L_DefKind::FUNC:
    {
        AS_decl *decl = new AS_decl(def.u.FUNC->name);
        decls.push_back(decl);
        break;
    }
    case L_DefKind::SRT:
    {
        return;
    }
    }
}

void llvm2asmGlobal(vector<AS_global *> &globals, L_def &def)
{
    switch (def.kind)
    {
    case L_DefKind::GLOBAL:
    {
        //ToDo
        break;
    }
    case L_DefKind::FUNC:
    {
        return;
    }
    case L_DefKind::SRT:
    {
        return;
    }
    }
}

AS_prog *llvm2asm(L_prog &prog)
{
    std::vector<AS_global *> globals;
    std::vector<AS_decl *> decls;
    std::vector<AS_func *> func_list;

    auto as_prog = new AS_prog(globals, decls, func_list);

    structLayoutInit(prog.defs);

    // translate function decl
    for (const auto &def : prog.defs)
    {
        llvm2asmDecl(as_prog->decls, *def);
    }

    for (const auto &func : prog.funcs)
    {
        AS_decl *decl = new AS_decl(func->name);
        as_prog->decls.push_back(decl);
    }

    // translate global data
    for (const auto &def : prog.defs)
    {
        llvm2asmGlobal(as_prog->globals, *def);
    }

    // translate each llvm function

    for (const auto &func : prog.funcs)
    {
        alloc_frame = false;

        set_stack(*func);

        as_prog->funcs.push_back(llvm2asmFunc(*func));

        fpOffset.clear();
    }

    return as_prog;
}
