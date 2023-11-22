#ifndef __BG_LLVM
#define __BG_LLVM

#include <unordered_map>
#include "graph.hpp"
#include "llvm_ir.h"
#include "temp.h"
/* Block graph */

GRAPH::Graph<LLVMIR::L_block*>& Create_bg(std::list<LLVMIR::L_block*>& bl); /* create bg from blocklist */
GRAPH::Graph<LLVMIR::L_block*>& Bg_graph();                                 /* get the block graph */
std::unordered_map<Temp_label*, LLVMIR::L_block*>& Bg_block_env();          /* get the bg_block_env */
void SingleSourceGraph(GRAPH::Node<LLVMIR::L_block*>* r, GRAPH::Graph<LLVMIR::L_block*>& bg,LLVMIR::L_func*fun);
void Show_graph(FILE* out,GRAPH::Graph<LLVMIR::L_block*>&bg);
#endif