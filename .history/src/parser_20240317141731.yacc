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
%token <pos> OPENCURLYBRACKET  // {
%token <pos> CLOSECURLYBRACKET // }
%token <pos> LPa              // (
%token <pos> RPa              // )
%token <pos> STRUCT
%token <pos> ARROW            // ->
%token <pos> FN
%token <pos> RET
%token <pos> IF
%token <pos> ELSE
%token <pos> WHILE
%token <pos> BREAK
%token <pos> CONTINUE



%type <program> Program
%type <arithExpr> ArithExpr
%type <programElementList> ProgramElementList
%type <programElement> ProgramElement
%type <exprUnit> ExprUnit
%type <structDef> StructDef
%type <varDeclStmt> VarDeclStmt
%type <varDecl> VarDecl
%type <varDeclList> VarDeclList
%type <varDef> VarDef
%type <type> Type
%type <rightVal> RightVal
%type <rightValList> RightValList
%type <boolExpr> BoolExpr
%type <boolUnit> BoolUnit
%type <assignStmt> AssignStmt
%type <leftVal> LeftVal
%type <fnDeclStmt> FnDeclStmt
%type <fnDecl> FnDecl
%type <paramDecl> ParamDecl
%type <fnDef> FnDef
%type <fnCall> FnCall
%type <codeBlockStmtList> CodeBlockStmtList
%type <codeBlockStmt> CodeBlockStmt
%type <returnStmt> ReturnStmt
%type <callStmt> CallStmt
%type <ifStmt> IfStmt
%type <whileStmt> WhileStmt

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

// varDeclStmt := < let > (varDecl | varDef) < ; >
// varDecl := id < : > type | id < [ > num < ] >< : > type | id | id < [ > num < ] >
// varDef := id < : > type < = > rightVal | id < = > rightVal     // permitive type (int)
// | id < [ > num < ] < : > type < = > < { > rightVal ( <, > rightVal)* | epsilon < } > id < [ > num < ] > < = > < { > rightVal (< , > rightVal)* | epsilon < } >   // array type
// type := nativeType | structType
// nativeType := int
// structType := id

VarDeclStmt : LET varDecl SEMICOLON{$$ = A_VarDeclStmt($1, $2); }
| LET VarDef SEMICOLON{$$ = A_VarDefStmt($1, $2); }

VarDecl : ID {$$ = A_VarDecl($1->pos, A_VarDeclId($1->pos, $1->id, NULL)); }
| ID COLON type {$$ = A_VarDecl($1->pos, A_VarDeclId($1->pos, $1->id, $3)); }
| ID OPENBRACKET NUM CLOSEBRACKET {$$ = A_VarDecl($1->pos, A_VarDeclId($1->pos, $1->id, A_VarDeclArray($1->pos, $3))); }
| ID OPENBRACKET NUM CLOSEBRACKET COLON type {$$ = A_VarDecl($1->pos, A_VarDeclId($1->pos, $1->id, A_VarDeclArray($1->pos, $3, $5))); }

type : NType {$$ = A_NativeType($1, A_intTypeKind); }
| ID {$$ = A_StructType($1->pos, $1->id); }




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


