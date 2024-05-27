#ifndef __ALLOC_REG
#define __ALLOC_REG
#include <set>
#include <vector>
#include <algorithm>
#include "asm_arm.h"
#include <unordered_map>
#include "graph.hpp"
struct RegInfo
{
    int regNum;    // 虚拟寄存器
    int color;     // 物理寄存器
    bool is_spill; // 是否spill
    bool bit_map;  // 是否在栈中
    int degree;    // Simplify时，减少对应边的度数即可，所有前驱和后继关系在原图中不会更改。
};
struct InstructionNode
{
    ASM::AS_stm *raw;
    std::set<int> use;
    std::set<int> def;
    std::set<int> in;
    std::set<int> out;
    std::set<int> previous_in;
    std::set<int> previous_out;
    std::set<InstructionNode *> sucessor;
    InstructionNode(ASM::AS_stm *raw, const std::set<int> &use, const std::set<int> &def,
                    const std::set<int> &in, const std::set<int> &out)
        : raw(raw), use(use), def(def), in(in), out(out), sucessor({}), previous_out({}), previous_in({}) {}
};
void getDefReg(ASM::AS_reg *reg, std::vector<ASM::AS_reg *> &defs);
void getUseReg(ASM::AS_reg *reg, std::vector<ASM::AS_reg *> &uses);
void forwardLivenessAnalysis(std::list<InstructionNode *> &liveness, std::list<ASM::AS_stm *> &as_list);
void setControlFlowDiagram(std::list<InstructionNode *> &nodes, std::unordered_map<std::string, InstructionNode *> &blocks);
void livenessAnalysis(std::list<InstructionNode *> &nodes, std::list<ASM::AS_stm *> &as_list);
#endif
