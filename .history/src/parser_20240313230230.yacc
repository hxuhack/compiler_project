%{
#include <stdio.h>
#include "TeaplAst.h"

extern A_pos pos;
extern A_program root;

extern int yylex(void);
extern "C"{
extern void yyerror(char *s); 
extern int  yywrap();
}

%}

// TODO:
// your parser

%union {
  A_pos pos;
  A_program program;
  A_programElementList programElementList;
  A_programElement programElement;
  A_arithExpr arithExpr;
  A_exprUnit exprUnit;
  A_structDef structDef;
  A_varDeclStmt varDeclStmt;
  A_varDecl varDecl;
  A_varDeclList varDeclList;
  A_type type; 
  A_nativeType nativeType;
  A_varDef varDef;
  A_rightVal rightVal;
  A_rightValList rightValList; 
  A_boolExpr boolExpr;
  A_boolUnit boolUnit;
  A_assignStmt assignStmt;
  A_leftVal leftVal; 
  A_fnDeclStmt fnDeclStmt;
  A_fnDecl fnDecl;
  A_paramDecl paramDecl;
  char* structType; 
  A_fnDef fnDef;
  A_fnCall fnCall; 
  A_tokenId tokenId; 
  A_tokenNum tokenNum; 
  A_codeBlockStmt codeBlockStmt;
  A_codeBlockStmtList codeBlockStmtList; 
  A_returnStmt returnStmt;
  A_codeBlockStmtType codeBlockStmtType;
  A_codeBlockStmtType breakStmt; 
  A_callStmt callStmt;
  A_ifStmt ifStmt;
  A_whileStmt whileStmt;
}

%token <pos> ADD
%token <pos> SUB
%token <pos> MUL
%token <pos> DIV
%token <pos> SEMICOLON      // ;
%token <pos> DOT            // .
%token <pos> LET            // let, for variable definition
%token <pos> COLON          // :
%token <pos> COMMA          // ,
%token <pos> OPENBRACKET    // [
%token <pos> CLOSEBRACKET   // ]
%token <tokenId> ID         // ]
%token <tokenNum> NUM       // ]
%token <pos> NType          // int
%token <pos> AND
%token <pos> OR
%token <pos> NOT
%token <pos> EQ
%token <pos> NE
%token <pos> LT
%token <pos> LE
%token <pos> GT
%token <pos> GE
%token <pos> ASSIGN
%token <pos> OPENCURLYBUCKET  // {
%token <pos> CLOSECURLYBUCKET // }
%token <pos> LPa
%token <pos> RPa
%token <pos> STRUCT
%token <pos> FN
%token <pos> RET
%token <pos> IF
%token <pos> ELSE
%token <pos> WHILE
%token <pos> BREAK
%token <pos> CONTINUE


%

%type <program> Program
%type <arithExpr> ArithExpr
%type <programElementList> ProgramElementList
%type <programElement> ProgramElement
%type <exprUnit> ExprUnit
%type <structDef> StructDef
%type <varDeclStmt> VarDeclStmt
%type <fnDeclStmt> FnDeclStmt
%type <fnDef> FnDef

%start Program

%%                   /* beginning of rules section */

Program: ProgramElementList 
{  
  root = A_Program($1);
  $$ = A_Program($1);
}
;

ProgramElementList: ProgramElement ProgramElementList
{
  $$ = A_ProgramElementList($1, $2);
}
|
{
  $$ = nullptr;
}
;

ProgramElement: VarDeclStmt
{
  $$ = A_ProgramVarDeclStmt($1->pos, $1);
}
| StructDef
{
  $$ = A_ProgramStructDef($1->pos, $1);
}
| FnDeclStmt
{
  $$ = A_ProgramFnDeclStmt($1->pos, $1);
}
| FnDef
{
  $$ = A_ProgramFnDef($1->pos, $1);
}
| SEMICOLON
{
  $$ = A_ProgramNullStmt($1);
}
;


ArithExpr: ArithExpr ADD ArithExpr
{
  $$ = A_ArithBiOp_Expr($1->pos, A_ArithBiOpExpr($1->pos, A_add, $1, $3));
}
| ArithExpr SUB ArithExpr
{
  $$ = A_ArithBiOp_Expr($1->pos, A_ArithBiOpExpr($1->pos, A_sub, $1, $3));
}
| ArithExpr MUL ArithExpr
{
  $$ = A_ArithBiOp_Expr($1->pos, A_ArithBiOpExpr($1->pos, A_mul, $1, $3));
}
| ArithExpr DIV ArithExpr
{
  $$ = A_ArithBiOp_Expr($1->pos, A_ArithBiOpExpr($1->pos, A_div, $1, $3));
}
| ExprUnit
{
  $$ = A_ExprUnit($1->pos, $1);
}
;

%%

extern "C"{
void yyerror(char * s)
{
  fprintf(stderr, "%s\n",s);
}
int yywrap()
{
  return(1);
}
}


