#pragma once

#include <iostream>
#include <ostream>
#include "TeaplaAst.h"

using std::ostream;

void print_aA_Type(aA_type type, ostream& os);
void print_aA_FnCall(aA_fnCall fnCall, ostream& os);
void print_aA_IndexExpr(aA_indexExpr indexExpr, ostream& os);
void print_aA_ArrayExpr(aA_arrayExpr arrayExpr, ostream& os);
void print_aA_MemberExpr(aA_memberExpr memberExpr, ostream& os);
void print_aA_ExprUnit(aA_exprUnit exprUnit, ostream& os);
void print_aA_ArithBiOpExpr(aA_arithBiOpExpr arithBiOpExpr, ostream& os);
void print_aA_ArithUExpr(aA_arithUExpr arithUExpr, ostream& os);
void print_aA_ArithExpr(aA_arithExpr arithExpr, ostream& os);
void print_aA_BoolBiOpExpr(aA_boolBiOpExpr boolBiOpExpr, ostream& os);
void print_aA_BoolUOpExpr(aA_boolUOpExpr boolUOpExpr, ostream& os);
void print_aA_BoolExpr(aA_boolExpr boolExpr, ostream& os);
void print_aA_ComExpr(aA_comExpr comExpr, ostream& os);
void print_aA_BoolUnit(aA_boolUnit boolUnit, ostream& os);
void print_aA_RightVal(aA_rightVal rightVal, ostream& os);
void print_aA_LeftVal(aA_leftVal leftVal, ostream& os);
void print_aA_AssignStmt(aA_assignStmt assignStmt, ostream& os);
void print_aA_VarDeclScalar(aA_varDeclScalar varDeclScalar, ostream& os);
void print_aA_VarDeclArray(aA_varDeclArray varDeclArray, ostream& os);
void print_aA_VarDecl(aA_varDecl varDecl, ostream& os);
void print_aA_VarDefScalar(aA_varDefScalar varDefScalar, ostream& os);
void print_aA_VarDefArray(aA_varDefArray varDefArray, ostream& os);
void print_aA_VarDef(aA_varDef varDef, ostream& os);
void print_aA_VarDeclStmt(aA_varDeclStmt varDeclStmt, ostream& os);
void print_aA_StructDef(aA_structDef structDef, ostream& os);
void print_aA_ParamDecl(aA_paramDecl paramDecl, ostream& os);
void print_aA_FnDecl(aA_fnDecl fnDecl, ostream& os);
void print_aA_FnDef(aA_fnDef fnDef, ostream& os);
void print_aA_IfStmt(aA_ifStmt ifStmt, ostream& os);
void print_aA_WhileStmt(aA_whileStmt whileStmt, ostream& os);
void print_aA_CallStmt(aA_callStmt callStmt, ostream& os);
void print_aA_ReturnStmt(aA_returnStmt returnStmt, ostream& os);
void print_aA_CodeBlockStmt(aA_codeBlockStmt codeBlockStmt, ostream& os);
void print_aA_FnDeclStmt(aA_fnDeclStmt fnDeclStmt, ostream& os);
void print_aA_ProgramElement(aA_programElement programElement, ostream& os);
void print_aA_Program(aA_program program, ostream& os);
