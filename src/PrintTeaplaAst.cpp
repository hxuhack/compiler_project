#include <iostream>
#include <ostream>
#include <string>
#include "PrintTeaplaAst.h"

using namespace std;

void print_aA_Type(aA_type type, ostream& os){
    if(!type) return;
    switch(type->type){
    case A_nativeTypeKind:{
        switch(type->u.nativeType){
        case A_intTypeKind:{
            os << "int";
            break;
        }
        }
        break;
    }
    case A_structTypeKind:{
        os << *(type->u.structType);
        break;
    }
    }
}

void print_aA_FnCall(aA_fnCall fnCall, ostream& os){
    if(!fnCall) return;
    os << *(fnCall->fn);
    os << "(";
    if(!fnCall->vals.empty()){
        print_aA_RightVal(fnCall->vals[0], os);
        for(int i=1; i<fnCall->vals.size(); ++i){
            os << ", ";
            print_aA_RightVal(fnCall->vals[i], os);
        }
    }
    os << ")";
}

void print_aA_IndexExpr(aA_indexExpr indexExpr, ostream& os){
    if(!indexExpr) return;
    switch(indexExpr->kind){
    case A_numIndexKind:{
        os << indexExpr->u.num;
        break;
    }
    case A_idIndexKind:{
        os << *(indexExpr->u.id);
        break;
    }
    }
}

void print_aA_ArrayExpr(aA_arrayExpr arrayExpr, ostream& os){
    if(!arrayExpr) return;
    os << *(arrayExpr->arr) << "[";
    print_aA_IndexExpr(arrayExpr->idx, os);
    os << "]";
}

void print_aA_MemberExpr(aA_memberExpr memberExpr, ostream& os){
    if(!memberExpr) return;
    os << *(memberExpr->structId) << ".";
    os << *(memberExpr->memberId);
}

void print_aA_ExprUnit(aA_exprUnit exprUnit, ostream& os){
    if(!exprUnit) return;
    switch(exprUnit->kind){
    case A_numExprKind:{
        os << exprUnit->u.num;
        break;
    }
    case A_idExprKind:{
        os << *(exprUnit->u.id);
        break;
    }
    case A_arithExprKind:{
        os << "(";
        print_aA_ArithExpr(exprUnit->u.arithExpr, os);
        os << ")";
        break;
    }
    case A_fnCallKind:{
        print_aA_FnCall(exprUnit->u.callExpr, os);
        break;
    }
    case A_arrayExprKind:{
        print_aA_ArrayExpr(exprUnit->u.arrayExpr, os);
        break;
    }
    case A_memberExprKind:{
        print_aA_MemberExpr(exprUnit->u.memberExpr, os);
        break;
    }
    case A_arithUExprKind:{
        print_aA_ArithUExpr(exprUnit->u.arithUExpr, os);
        break;
    }
    }
}

static const string arithBiOps[] = {"+", "-", "*", "/"};

void print_aA_ArithBiOpExpr(aA_arithBiOpExpr arithBiOpExpr, ostream& os){
    if(!arithBiOpExpr) return;
    print_aA_ArithExpr(arithBiOpExpr->left, os);
    os << arithBiOps[arithBiOpExpr->op];
    print_aA_ArithExpr(arithBiOpExpr->right, os);
}

static const string arithUOps[] = {"-"};

void print_aA_ArithUExpr(aA_arithUExpr arithUExpr, ostream& os){
    if(!arithUExpr) return;
    os << arithUOps[arithUExpr->op];
    print_aA_ExprUnit(arithUExpr->expr, os);
}

void print_aA_ArithExpr(aA_arithExpr arithExpr, ostream& os){
    if(!arithExpr) return;
    switch(arithExpr->kind){
    case A_arithBiOpExprKind:{
        print_aA_ArithBiOpExpr(arithExpr->u.arithBiOpExpr, os);
        break;
    }
    case A_exprUnitKind:{
        print_aA_ExprUnit(arithExpr->u.exprUnit, os);
        break;
    }
    }
}

static const string boolBiOps[] = {"&&", "||"};

void print_aA_BoolBiOpExpr(aA_boolBiOpExpr boolBiOpExpr, ostream& os){
    if(!boolBiOpExpr) return;
    print_aA_BoolExpr(boolBiOpExpr->left, os);
    os << boolBiOps[boolBiOpExpr->op];
    print_aA_BoolUnit(boolBiOpExpr->right, os);
}

static const string boolUOps[] = {"!"};

void print_aA_BoolUOpExpr(aA_boolUOpExpr boolUOpExpr, ostream& os){
    if(!boolUOpExpr) return;
    os << boolUOps[boolUOpExpr->op];
    print_aA_BoolUnit(boolUOpExpr->cond, os);
}

void print_aA_BoolExpr(aA_boolExpr boolExpr, ostream& os){
    if(!boolExpr) return;
    switch(boolExpr->kind){
    case A_boolBiOpExprKind:{
        print_aA_BoolBiOpExpr(boolExpr->u.boolBiOpExpr, os);
        break;
    }
    case A_boolUnitKind:{
        print_aA_BoolUnit(boolExpr->u.boolUnit, os);
        break;
    }
    }
}

static const string comOps[] = {"<", "<=", ">", ">=", "==", "!="};

void print_aA_ComExpr(aA_comExpr comExpr, ostream& os){
    if(!comExpr) return;
    print_aA_ExprUnit(comExpr->left, os);
    os << comOps[comExpr->op];
    print_aA_ExprUnit(comExpr->right, os);
}

void print_aA_BoolUnit(aA_boolUnit boolUnit, ostream& os){
    if(!boolUnit) return;
    switch(boolUnit->kind){
    case A_comOpExprKind:{
        os << "(";
        print_aA_ComExpr(boolUnit->u.comExpr, os);
        os << ")";
        break;
    }
    case A_boolExprKind:{
        os << "(";
        print_aA_BoolExpr(boolUnit->u.boolExpr, os);
        os << ")";
        break;
    }
    case A_boolUOpExprKind:{
        print_aA_BoolUOpExpr(boolUnit->u.boolUOpExpr, os);
        break;
    }
    }
}

void print_aA_RightVal(aA_rightVal rightVal, ostream& os){
    if(!rightVal) return;
    switch(rightVal->kind){
    case A_arithExprValKind:{
        print_aA_ArithExpr(rightVal->u.arithExpr, os);
        break;
    }
    case A_boolExprValKind:{
        print_aA_BoolExpr(rightVal->u.boolExpr, os);
        break;
    }
    }
}

void print_aA_LeftVal(aA_leftVal leftVal, ostream& os){
    if(!leftVal) return;
    switch(leftVal->kind){
    case A_varValKind:{
        os << *(leftVal->u.id);
        break;
    }
    case A_arrValKind:{
        print_aA_ArrayExpr(leftVal->u.arrExpr, os);
        break;
    }
    case A_memberValKind:{
        print_aA_MemberExpr(leftVal->u.memberExpr, os);
        break;
    }
    }
}

void print_aA_AssignStmt(aA_assignStmt assignStmt, ostream& os){
    if(!assignStmt) return;
    print_aA_LeftVal(assignStmt->leftVal, os);
    os << " = ";
    print_aA_RightVal(assignStmt->rightVal, os);
    os << ";";
}

void print_aA_VarDeclScalar(aA_varDeclScalar varDeclScalar, ostream& os){
    if(!varDeclScalar) return;
    os << *(varDeclScalar->id) << ":";
    print_aA_Type(varDeclScalar->type, os);
}

void print_aA_VarDeclArray(aA_varDeclArray varDeclArray, ostream& os){
    if(!varDeclArray) return;
    os << *(varDeclArray->id) << "[";
    os << varDeclArray->len << "]:";
    print_aA_Type(varDeclArray->type, os);
}

void print_aA_VarDecl(aA_varDecl varDecl, ostream& os){
    if(!varDecl) return;
    switch(varDecl->kind){
    case A_varDeclScalarKind:{
        print_aA_VarDeclScalar(varDecl->u.declScalar, os);
        break;
    }
    case A_varDeclArrayKind:{
        print_aA_VarDeclArray(varDecl->u.declArray, os);
        break;
    }
    }
}

void print_aA_VarDefScalar(aA_varDefScalar varDefScalar, ostream& os){
    if(!varDefScalar) return;
    os << *(varDefScalar->id) << ":";
    print_aA_Type(varDefScalar->type, os);
    os << " = ";
    print_aA_RightVal(varDefScalar->val, os);
}

void print_aA_VarDefArray(aA_varDefArray varDefArray, ostream& os){
    if(!varDefArray) return;
    os << *(varDefArray->id) << "[";
    os << varDefArray->len << "]:";
    print_aA_Type(varDefArray->type, os);
    os << " = {";
    if(!varDefArray->vals.empty()){
        print_aA_RightVal(varDefArray->vals[0], os);
        for(int i=1; i<varDefArray->vals.size(); ++i){
            os << ", ";
            print_aA_RightVal(varDefArray->vals[i], os);
        }
    }
    os << "}";
}

void print_aA_VarDef(aA_varDef varDef, ostream& os){
    if(!varDef) return;
    switch(varDef->kind){
    case A_varDefScalarKind:{
        print_aA_VarDefScalar(varDef->u.defScalar, os);
        break;
    }
    case A_varDefArrayKind:{
        print_aA_VarDefArray(varDef->u.defArray, os);
        break;
    }
    }
}

void print_aA_VarDeclStmt(aA_varDeclStmt varDeclStmt, ostream& os){
    if(!varDeclStmt) return;
    os << "let ";
    switch(varDeclStmt->kind){
    case A_varDeclKind:{
        print_aA_VarDecl(varDeclStmt->u.varDecl, os);
        break;
    }
    case A_varDefKind:{
        print_aA_VarDef(varDeclStmt->u.varDef, os);
        break;
    }
    }
    os << ";";
}

void print_aA_StructDef(aA_structDef structDef, ostream& os){
    if(!structDef) return;
    os << "struct " << *(structDef->id) << " {";
    if(!structDef->varDecls.empty()){
        os << "\n";
        print_aA_VarDecl(structDef->varDecls[0], os);
        for(int i=1; i<structDef->varDecls.size(); ++i){
            os << ",\n";
            print_aA_VarDecl(structDef->varDecls[i], os);
        }
    }
    os << "\n}";
}

void print_aA_ParamDecl(aA_paramDecl paramDecl, ostream& os){
    if(!paramDecl) return;
    if(!paramDecl->varDecls.empty()){
        print_aA_VarDecl(paramDecl->varDecls[0], os);
        for(int i=1; i<paramDecl->varDecls.size(); ++i){
            os << ", ";
            print_aA_VarDecl(paramDecl->varDecls[i], os);
        }
    }
}

void print_aA_FnDecl(aA_fnDecl fnDecl, ostream& os){
    if(!fnDecl) return;
    os << "fn " << *(fnDecl->id) << "(";
    print_aA_ParamDecl(fnDecl->paramDecl, os);
    os << ")";
    if(fnDecl->type){
        os << "->";
        print_aA_Type(fnDecl->type, os);
    }
}

void print_aA_FnDef(aA_fnDef fnDef, ostream& os){
    if(!fnDef) return;
    print_aA_FnDecl(fnDef->fnDecl, os);
    os << "{";
    for(auto &stmt : fnDef->stmts){
        os << "\n";
        print_aA_CodeBlockStmt(stmt, os);
    }
    os << "\n}";
}

void print_aA_IfStmt(aA_ifStmt ifStmt, ostream& os){
    if(!ifStmt) return;
    os << "if(";
    print_aA_BoolExpr(ifStmt->boolExpr, os);
    os << "){";
    for(auto &stmt : ifStmt->ifStmts){
        os << "\n";
        print_aA_CodeBlockStmt(stmt, os);
    }
    os << "\n}";
    if(!ifStmt->elseStmts.empty()){
        os << "else{";
        for(auto &stmt : ifStmt->elseStmts){
            os << "\n";
            print_aA_CodeBlockStmt(stmt, os);
        }
        os << "\n}";
    }
}

void print_aA_WhileStmt(aA_whileStmt whileStmt, ostream& os){
    if(!whileStmt) return;
    os << "while(";
    print_aA_BoolExpr(whileStmt->boolExpr, os);
    os << "){";
    for(auto &stmt : whileStmt->whileStmts){
        os << "\n";
        print_aA_CodeBlockStmt(stmt, os);
    }
    os << "\n}";
}

void print_aA_CallStmt(aA_callStmt callStmt, ostream& os){
    if(!callStmt) return;
    print_aA_FnCall(callStmt->fnCall, os);
    os << ";";
}

void print_aA_ReturnStmt(aA_returnStmt returnStmt, ostream& os){
    if(!returnStmt) return;
    os << "ret ";
    print_aA_RightVal(returnStmt->retVal, os);
    os << ";";
}

void print_aA_CodeBlockStmt(aA_codeBlockStmt codeBlockStmt, ostream& os){
    if(!codeBlockStmt) return;
    switch(codeBlockStmt->kind){
    case A_nullStmtKind:{
        os << ";";
        break;
    }
    case A_varDeclStmtKind:{
        print_aA_VarDeclStmt(codeBlockStmt->u.varDeclStmt, os);
        break;
    }
    case A_assignStmtKind:{
        print_aA_AssignStmt(codeBlockStmt->u.assignStmt, os);
        break;
    }
    case A_callStmtKind:{
        print_aA_CallStmt(codeBlockStmt->u.callStmt, os);
        break;
    }
    case A_ifStmtKind:{
        print_aA_IfStmt(codeBlockStmt->u.ifStmt, os);
        break;
    }
    case A_whileStmtKind:{
        print_aA_WhileStmt(codeBlockStmt->u.whileStmt, os);
        break;
    }
    case A_returnStmtKind:{
        print_aA_ReturnStmt(codeBlockStmt->u.returnStmt, os);
        break;
    }
    case A_continueStmtKind:{
        os << "continue;";
        break;
    }
    case A_breakStmtKind:{
        os << "break;";
        break;
    }
    }
}

void print_aA_FnDeclStmt(aA_fnDeclStmt fnDeclStmt, ostream& os){
    if(!fnDeclStmt) return;
    print_aA_FnDecl(fnDeclStmt->fnDecl, os);
    os << ";";
}

void print_aA_ProgramElement(aA_programElement programElement, ostream& os){
    if(!programElement) return;
    switch(programElement->kind){
    case A_programNullStmtKind:{
        os << ";";
        break;
    }
    case A_programVarDeclStmtKind:{
        print_aA_VarDeclStmt(programElement->u.varDeclStmt, os);
        break;
    }
    case A_programStructDefKind:{
        print_aA_StructDef(programElement->u.structDef, os);
        break;
    }
    case A_programFnDeclStmtKind:{
        print_aA_FnDeclStmt(programElement->u.fnDeclStmt, os);
        break;
    }
    case A_programFnDefKind:{
        print_aA_FnDef(programElement->u.fnDef, os);
        break;
    }
    }
}

void print_aA_Program(aA_program program, ostream& os){
    if(!program) return;
    for(auto &programElement : program->programElements){
        print_aA_ProgramElement(programElement, os);
        os << "\n\n";
    }
}