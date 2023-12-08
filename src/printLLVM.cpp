#include "printLLVM.h"
#include "llvm_ir.h"
#include <iostream>
#include <cassert>

using namespace std;
using namespace LLVMIR;

void LLVMIR::printL_def(ostream &os,L_def *def)
{
    switch (def->kind)
    {
    case L_DefKind::SRT:
    {
        os << "%" << def->u.SRT->name << " = type {";
        bool first = true;
        for(const auto &m : def->u.SRT->members)
        {
            if(first)
            {
                os << " ";
                first = false;
            }
            else
            {
                os << ", ";
            }
            switch (m.kind)
            {
            case TempType::INT_TEMP:
            {
                os << "i32";
                break;
            }
            case TempType::INT_PTR:
            {
                if(m.len <= 0)
                {
                    assert(0);
                }
                os << "[" << m.len << " x " << "i32 ]";
                break;
            }
            case TempType::STRUCT_TEMP:
            {
                os << "%" << m.structname;
                break;
            }
            case TempType::STRUCT_PTR:
            {
                if(m.len <= 0)
                {
                    assert(0);
                }
                os << "[" << m.len << " x " << "%" << m.structname << " ]";
                break;
            }
            default:
                assert(0);
                break;
            }
        }
        os << " }";
        break;
    }
    case L_DefKind::GLOBAL:
    {
        os << "@" << def->u.GLOBAL->name << " = global ";
        switch (def->u.GLOBAL->def.kind)
        {
        case TempType::INT_TEMP:
        {
            os << "i32 ";
            if(def->u.GLOBAL->init.size() == 1)
            {
                os << def->u.GLOBAL->init[0];
            }
            else
            {
                os << "0";
            }
            break;
        }
        case TempType::INT_PTR:
        {
            os << "[ " << def->u.GLOBAL->def.len << " x i32 ]";
            if(def->u.GLOBAL->init.size() == 0)
            {
                os << " zeroinitializer";
            }
            else
            {
                os << " [";
                for(int i = 0;i < def->u.GLOBAL->init.size();++i)
                {
                    if(i == 0)
                    {
                        os << " ";
                    }
                    else
                    {
                        os << ", ";
                    }
                    os << "i32 " << def->u.GLOBAL->init[i];
                }
                for(int i = 0;i < def->u.GLOBAL->def.len - def->u.GLOBAL->init.size();++i)
                {
                    os << ", i32 0";
                }
                os << " ]";
            }
            break;    
        }
        case TempType::STRUCT_TEMP:
        {
            os << "%" << def->u.GLOBAL->def.structname << " zeroinitializer";
            break;   
        }
        case TempType::STRUCT_PTR:
        {
            os << "[ "<< def->u.GLOBAL->def.len << " x %" << def->u.GLOBAL->def.structname << " ] zeroinitializer";
            break;  
        }
        default:
            break;
        }
        break;
    }
    case L_DefKind::FUNC:
    {
        os << "declare ";
        switch (def->u.FUNC->ret.type)
        {
        case ReturnType::VOID_TYPE:
        {
            os << "void ";
            break;
        }
        case ReturnType::INT_TYPE:
        {
            os << "i32 ";
            break;
        }
        case ReturnType::STRUCT_TYPE:
        {
            os << "%" << def->u.FUNC->ret.structname << " ";
            break;
        }
        default:
            break;
        }
        os << "@" << def->u.FUNC->name << "(";
        bool first = true;
        for(const auto &v : def->u.FUNC->args)
        {
            if(first)
            {
                first = false;
                os << " ";
            }
            else
            {
                os << ", ";
            }
            switch (v.kind)
            {
            case TempType::INT_TEMP:
            {
                os << "i32";
                break;
            }
            case TempType::INT_PTR:
            {
                os << "i32*";
                break;
            }
            case TempType::STRUCT_TEMP:
            {
                os << "%" << v.structname;
                break;
            }
            case TempType::STRUCT_PTR:
            {
                os << "%" << v.structname << "*";
                break;
            }
            default:
                break;
            }
        }
        os << " )";
        break;
    }
    default:
        break;
    }
    os << "\n";
}

void LLVMIR::printL_stm(std::ostream &os,LLVMIR::L_stm *stm)
{
    switch (stm->type)
    {
    case L_StmKind::T_ALLOCA:
    {
        if(stm->u.ALLOCA->dst->kind == OperandKind::TEMP)
        {
            os << "  ";
            printL_oper(os,stm->u.ALLOCA->dst);
            os << " = alloca ";
            switch (stm->u.ALLOCA->dst->u.TEMP->type)
            {
            case TempType::INT_TEMP:
            {
                assert(0);
                break;
            }
            case TempType::INT_PTR:
            {
                if(stm->u.ALLOCA->dst->u.TEMP->len == 0)
                    os << "i32";
                else
                    os << "[ " << stm->u.ALLOCA->dst->u.TEMP->len << " x i32 ]";
                break;
            }
            case TempType::STRUCT_TEMP:
            {
                assert(0);
                break;
            }
            case TempType::STRUCT_PTR:
            {
                if(stm->u.ALLOCA->dst->u.TEMP->len == 0)
                    os << "%" << stm->u.ALLOCA->dst->u.TEMP->structname;
                else
                    os << "[ " << stm->u.ALLOCA->dst->u.TEMP->len << " x %" << stm->u.ALLOCA->dst->u.TEMP->structname << " ]";
                break;
            }
            default:
                break;
            }
        }
        else
        {
            assert(0);
        }
        break;
    }
    case L_StmKind::T_BINOP:
    {
        if(stm->u.BINOP->dst->kind != OperandKind::TEMP)
        {
            assert(0);
        }
        os << "  ";
        printL_oper(os,stm->u.BINOP->dst);
        os << " = ";
        switch (stm->u.BINOP->op)
        {
        case L_binopKind::T_plus:
        {
            os << "add";
            break;
        }
        case L_binopKind::T_minus:
        {
            os << "sub";
            break;
        }
        case L_binopKind::T_mul:
        {
            os << "mul";
            break;
        }
        case L_binopKind::T_div:
        {
            os << "sdiv";
            break;
        }
        default:
            break;
        }
        os << " i32 ";
        printL_oper(os,stm->u.BINOP->left);
        os << ", ";
        printL_oper(os,stm->u.BINOP->right);
        break;
    }
    case L_StmKind::T_CALL:
    {
        os << "  ";
        printL_oper(os,stm->u.CALL->res);
        os << " = call i32 @" << stm->u.CALL->fun << "(";
        bool first = true;
        for(const auto &v : stm->u.CALL->args)
        {
            if(first)
            {
                first = false;
            }
            else
            {
                os << ", ";
            }
            if(v->kind == OperandKind::TEMP)
            {
                if(v->u.TEMP->type == TempType::INT_TEMP)
                {
                    os << "i32 ";
                }
                else if(v->u.TEMP->type == TempType::INT_PTR)
                {
                    os << "i32* ";
                }
                else if(v->u.TEMP->type == TempType::STRUCT_TEMP)
                {
                    os << "%" << v->u.TEMP->structname << " ";
                }
                else
                {
                    os << "%" << v->u.TEMP->structname << "* ";
                }
            }
            else if(v->kind == OperandKind::ICONST)
            {
                os << "i32 ";
            }
            else
            {
                if(v->u.NAME->type == TempType::INT_PTR)
                {
                    os << "i32* ";
                }
                else if(v->u.NAME->type == TempType::STRUCT_TEMP)
                {
                    os << "%" << v->u.NAME->structname << "* ";
                }
                else if(v->u.NAME->type == TempType::STRUCT_PTR)
                {
                    os << "%" << v->u.NAME->structname << "* ";
                }
                else
                {
                    assert(0);
                }
            }
            printL_oper(os,v);
        }
        os << ")";
        break;
    }
    case L_StmKind::T_CJUMP:
    {
        os << "  br i1 ";
        printL_oper(os,stm->u.CJUMP->dst);
        os << ", label %" << stm->u.CJUMP->true_label->name << ", label %" << stm->u.CJUMP->false_label->name << "\n";
        break;
    }
    case L_StmKind::T_CMP:
    {
        os << "  ";
        printL_oper(os,stm->u.CMP->dst);
        os << " = icmp ";
        switch (stm->u.CMP->op)
        {
        case L_relopKind::T_lt:
        {
            os << "slt ";
            break;
        }
        case L_relopKind::T_le:
        {
            os << "sle ";
            break;
        }
        case L_relopKind::T_gt:
        {
            os << "sgt ";
            break;
        }
        case L_relopKind::T_ge:
        {
            os << "sge ";
            break;
        }
        case L_relopKind::T_eq:
        {
            os << "eq ";
            break;
        }
        case L_relopKind::T_ne:
        {
            os << "ne ";
            break;
        }
        default:
            break;
        }
        os << "i32 ";
        printL_oper(os,stm->u.CMP->left);
        os << ", ";
        printL_oper(os,stm->u.CMP->right);
        break;
    }
    case L_StmKind::T_GEP:
    {
        os << "  ";
        printL_oper(os,stm->u.GEP->new_ptr);
        os << " = getelementptr ";
        if(stm->u.GEP->base_ptr->kind == OperandKind::TEMP)
        {
            switch (stm->u.GEP->base_ptr->u.TEMP->type)
            {
            case TempType::INT_TEMP:
            {
                assert(0);
                break;
            }
            case TempType::INT_PTR:
            {
                if(stm->u.GEP->base_ptr->u.TEMP->len == -1 || stm->u.GEP->base_ptr->u.TEMP->len == 0)
                {
                    os << "i32, i32* ";
                    printL_oper(os,stm->u.GEP->base_ptr);
                }
                else
                {
                    os << "[" << stm->u.GEP->base_ptr->u.TEMP->len << " x i32 ], ";
                    os << "[" << stm->u.GEP->base_ptr->u.TEMP->len << " x i32 ]* ";
                    printL_oper(os,stm->u.GEP->base_ptr);
                    os << ", i32 0";
                }
                break;
            }
            case TempType::STRUCT_TEMP:
            {
                assert(0);
                break;
            }
            case TempType::STRUCT_PTR:
            {
                if(stm->u.GEP->base_ptr->u.TEMP->len == 0)
                {
                    os << "%" << stm->u.GEP->base_ptr->u.TEMP->structname << ", %" << stm->u.GEP->base_ptr->u.TEMP->structname << "* ";
                    printL_oper(os,stm->u.GEP->base_ptr);
                    os << ", i32 0";
                }
                else if(stm->u.GEP->base_ptr->u.TEMP->len == -1)
                {
                    os << "%" << stm->u.GEP->base_ptr->u.TEMP->structname << ", %" << stm->u.GEP->base_ptr->u.TEMP->structname << "* ";
                    printL_oper(os,stm->u.GEP->base_ptr);
                }
                else
                {
                    os << "[" << stm->u.GEP->base_ptr->u.TEMP->len << " x " << "%" << stm->u.GEP->base_ptr->u.TEMP->structname << " ], ";
                    os << "[" << stm->u.GEP->base_ptr->u.TEMP->len << " x " << "%" << stm->u.GEP->base_ptr->u.TEMP->structname << " ]* ";
                    printL_oper(os,stm->u.GEP->base_ptr);
                    os << ", i32 0";
                }
                break;
            }
            default:
                break;
            }
            os << ", i32 ";
            printL_oper(os,stm->u.GEP->index);
        }
        else if(stm->u.GEP->base_ptr->kind == OperandKind::NAME)
        {
            switch (stm->u.GEP->base_ptr->u.NAME->type)
            {
            case TempType::INT_TEMP:
            {
                assert(0);
                break;
            }
            case TempType::INT_PTR:
            {
                if(stm->u.GEP->base_ptr->u.NAME->len == -1 || stm->u.GEP->base_ptr->u.NAME->len == 0)
                {
                    os << "i32, i32* ";
                    printL_oper(os,stm->u.GEP->base_ptr);
                }
                else
                {
                    os << "[" << stm->u.GEP->base_ptr->u.NAME->len << " x i32 ], ";
                    os << "[" << stm->u.GEP->base_ptr->u.NAME->len << " x i32 ]* ";
                    printL_oper(os,stm->u.GEP->base_ptr);
                    os << ", i32 0";
                }
                break;
            }
            case TempType::STRUCT_TEMP:
            {
                os << "%" << stm->u.GEP->base_ptr->u.NAME->structname << ", %" << stm->u.GEP->base_ptr->u.NAME->structname << "* ";
                printL_oper(os,stm->u.GEP->base_ptr);
                os << ", i32 0";
                break;
            }
            case TempType::STRUCT_PTR:
            {
                if(stm->u.GEP->base_ptr->u.NAME->len == -1 || stm->u.GEP->base_ptr->u.NAME->len == 0)
                {
                    os << "%" << stm->u.GEP->base_ptr->u.NAME->structname << ", %" << stm->u.GEP->base_ptr->u.NAME->structname << "* ";
                    printL_oper(os,stm->u.GEP->base_ptr);
                    os << ", i32 0";
                }
                else
                {
                    os << "[" << stm->u.GEP->base_ptr->u.NAME->len << " x " << "%" << stm->u.GEP->base_ptr->u.NAME->structname << " ], ";
                    os << "[" << stm->u.GEP->base_ptr->u.NAME->len << " x " << "%" << stm->u.GEP->base_ptr->u.NAME->structname << " ]* ";
                    printL_oper(os,stm->u.GEP->base_ptr);
                    os << ", i32 0";
                }
                break;
            }
            default:
                break;
            }
            os << ", i32 ";
            printL_oper(os,stm->u.GEP->index);
        }
        else
        {
            assert(0);
        }
        break;
    }
    case L_StmKind::T_JUMP:
    {
        os << "  br label %" << stm->u.JUMP->jump->name << "\n";
        break;
    }
    case L_StmKind::T_LABEL:
    {
        os << stm->u.LABEL->label->name << ":";
        break;
    }
    case L_StmKind::T_LOAD:
    {
        os << "  ";
        printL_oper(os,stm->u.LOAD->dst);
        os << " = load i32, i32* ";
        printL_oper(os,stm->u.LOAD->ptr);
        break;
    }
    case L_StmKind::T_MOVE:
    {
        os << "  ";
        printL_oper(os,stm->u.MOVE->dst);
        os << " = add i32 ";
        printL_oper(os,stm->u.MOVE->src);
        os << ", 0";
        break;
    }
    case L_StmKind::T_NULL:
    {
        break;
    }
    case L_StmKind::T_PHI:
    {
        os << "  ";
        printL_oper(os,stm->u.PHI->dst);
        os << " = phi i32";
        bool first = true;
        for(const auto &p : stm->u.PHI->phis)
        {
            if(first)
            {
                first = false;
                os << " [ ";
            }
            else
            {
                os << ", [ ";
            }
            printL_oper(os,p.first);
            os << ", %" << p.second->name << " ]";
        }
        break;
    }
    case L_StmKind::T_RETURN:
    {
        if(stm->u.RET->ret == nullptr)
        {
            os << "  ret void";
        }
        else
        {
            os << "  ret i32 ";
            printL_oper(os,stm->u.RET->ret);
        }
        break;
    }
    case L_StmKind::T_STORE:
    {
        os << "  store i32 ";
        printL_oper(os,stm->u.STORE->src);
        os << ", i32* ";
        printL_oper(os,stm->u.STORE->ptr);
        break;
    }
    case L_StmKind::T_VOID_CALL:
    {
        os << "  call void @" << stm->u.VOID_CALL->fun << "(";
        bool first = true;
        for(const auto &v : stm->u.VOID_CALL->args)
        {
            if(first)
            {
                first = false;
            }
            else
            {
                os << ", ";
            }
            if(v->kind == OperandKind::TEMP)
            {
                if(v->u.TEMP->type == TempType::INT_TEMP)
                {
                    os << "i32 ";
                }
                else if(v->u.TEMP->type == TempType::INT_PTR)
                {
                    os << "i32* ";
                }
                else if(v->u.TEMP->type == TempType::STRUCT_TEMP)
                {
                    os << "%" << v->u.TEMP->structname << " ";
                }
                else
                {
                    os << "%" << v->u.TEMP->structname << "* ";
                }
            }
            else if(v->kind == OperandKind::ICONST)
            {
                os << "i32 ";
            }
            else
            {
                if(v->u.NAME->type == TempType::INT_PTR)
                {
                    os << "i32* ";
                }
                else if(v->u.NAME->type == TempType::STRUCT_TEMP)
                {
                    os << "%" << v->u.NAME->structname << "* ";
                }
                else if(v->u.NAME->type == TempType::STRUCT_PTR)
                {
                    os << "%" << v->u.NAME->structname << "* ";
                }
                else
                {
                    assert(0);
                }
            }
            printL_oper(os,v);
        }
        os << ")";
        break;
        break;
    }
    default:
        break;
    }
    os << "\n";
}

void LLVMIR::printL_oper(std::ostream &os,AS_operand *oper)
{
    switch (oper->kind)
    {
    case OperandKind::ICONST:
    {
        os << oper->u.ICONST;
        break;
    }
    case OperandKind::TEMP:
    {
        os << "%r" << oper->u.TEMP->num;
        break;
    }
    case OperandKind::NAME:
    {
        os << "@" << oper->u.NAME->name->name;
        break;
    }
    default:
        break;
    }
}

void LLVMIR::printL_prog(std::ostream &os,LLVMIR::L_prog *prog)
{
    for(const auto &def : prog->defs)
    {
        printL_def(os,def);
    }
    for(const auto &func : prog->funcs)
    {
        printL_func(os,func);
    }
}

void LLVMIR::printL_func(std::ostream &os,LLVMIR::L_func *func)
{
    os << "define ";
    switch (func->ret.type)
    {
    case ReturnType::VOID_TYPE:
    {
        os << "void ";
        break;
    }
    case ReturnType::INT_TYPE:
    {
        os << "i32 ";
        break;
    }
    case ReturnType::STRUCT_TYPE:
    {
        os << "%" << func->ret.structname << " ";
        break;
    }
    default:
        break;
    }
    os << "@" << func->name << "(";
    bool first = true;
    for(const auto &v : func->args)
    {
        if(first)
        {
            first = false;
            os << " ";
        }
        else
        {
            os << ", ";
        }
        switch (v->type)
        {
        case TempType::INT_TEMP:
        {
            os << "i32 %r" << v->num; 
            break;
        }
        case TempType::INT_PTR:
        {
            os << "i32* %r" << v->num; 
            break;
        }
        case TempType::STRUCT_TEMP:
        {
            os << "%" << v->structname << " %r" << v->num;
            break;
        }
        case TempType::STRUCT_PTR:
        {
            os << "%" << v->structname << "* %r" << v->num;
            break;
        }
        default:
            break;
        }
    }
    os << " ) {\n";
    for(const auto &b : func->blocks)
    {
        printL_block(os,b);
    }
    os << "}\n\n";
}

void LLVMIR::printL_block(std::ostream &os,LLVMIR::L_block *block)
{
    for(const auto &ir : block->instrs)
    {
        printL_stm(os,ir);
    }
}