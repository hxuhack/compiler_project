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

  A_tokenId tokenId;
  // A_nativeType nativeType;
  A_type type;
  A_tokenNum tokenNum;
  A_rightVal rightVal;
  A_rightValList rightValList;

  A_pos pos;
  A_program program;
  A_programElementList programElementList;
  A_programElement programElement;

  A_arithUExpr arithUExpr;
  A_arithExpr arithExpr;
  A_exprUnit exprUnit;

  A_varDeclList varDeclList;
  A_structDef structDef;

  
  A_varDecl varDecl;
  A_varDef varDef;
  A_varDeclStmt varDeclStmt;

  A_paramDecl paramDecl;
  A_fnDecl fnDecl;
  A_fnDeclStmt fnDeclStmt;

  A_memberExpr memberExpr;
  A_arrayExpr arrayExpr;
  A_leftVal leftVal;
  A_assignStmt assignStmt;

  A_returnStmt returnStmt;
  A_whileStmt whileStmt;

  
  // A_boolUOp boolUOp;
  A_comOp comOp;
  A_boolUnit boolUnit;
  A_boolBiOp boolBiOp;
  A_boolExpr boolExpr;
  A_ifStmt ifStmt;

  A_callStmt callStmt;
  A_fnCall fnCall;

  A_codeBlockStmt codeBlockStmt;
  A_codeBlockStmtList codeBlockStmtList;
  A_fnDef fnDef;
}


%token <pos> LET
%token <pos> STRUCT
%token <pos> FN
%token <pos> CONTINUE
%token <pos> BREAK
%token <pos> RETURN
%token <pos> WHILE
%token <pos> IF
%token <pos> ELSE
%token <tokenNum> NUM
%token <tokenId> ID

// %type <nativeType> NativeType
// %type <tokenId> StructType
%type <type> Type
%token <pos> INT

%type <rightVal> RightVal
%type <rightValList> RightValList

%token <pos> ADD
%token <pos> SUB
%token <pos> MUL
%token <pos> DIV
%token <pos> SEMICOLON // ;
%token <pos> COLON // :
%token <pos> LEFT_SQUARE_BRACKET // [
%token <pos> RIGHT_SQUARE_BRACKET // ]
%token <pos> EQUAL // =
%token <pos> OPEN_BRACE // {
%token <pos> CLOSED_BRACE // }
%token <pos> LEFT_PARENTHESIS // (
%token <pos> RIGHT_PARENTHESIS // )
%token <pos> RIGHT_ARROW // ->
%token <pos> DOT // .
%token <pos> COMMA // ,
%token <pos> AND // &&
%token <pos> OR // ||
%token <pos> NOT // !
%token <pos> LESS // <
%token <pos> GREATER // >
%token <pos> LESS_EQUAL // <=
%token <pos> GREATER_EQUAL // >=
%token <pos> IS // ==
%token <pos> IS_NOT // !=


%left OR
%left AND
%left IS IS_NOT
%left ADD SUB
%left MUL DIV

%type <program> Program
%type <arithUExpr> ArithUExpr
%type <arithExpr> ArithExpr
%type <programElementList> ProgramElementList
%type <programElement> ProgramElement
%type <exprUnit> ExprUnit

%type <varDeclList> VarDeclList
%type <structDef> StructDef

%type <varDecl> VarDecl
%type <varDef> VarDef
%type <varDeclStmt> VarDeclStmt

%type <paramDecl> ParamDecl
%type <fnDecl> FnDecl
%type <fnDeclStmt> FnDeclStmt

%type <memberExpr> MemberExpr
%type <arrayExpr> ArrayExpr
%type <leftVal> LeftVal
%type <assignStmt> AssignStmt

%type <returnStmt> ReturnStmt

%type <whileStmt> WhileStmt

// %type <boolUOp> BoolUOp
%type <comOp> ComOp
%type <boolUnit> BoolUnit
%type <boolBiOp> BoolBiOp
%type <boolExpr> BoolExpr
%type <ifStmt> IfStmt

%type <fnCall> FnCall
%type <callStmt> CallStmt

%type <codeBlockStmt> CodeBlockStmt
%type <codeBlockStmtList> CodeBlockStmtList
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
  $$ = NULL;
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

RightVal: ArithExpr
{
  $$ = A_ArithExprRVal($1->pos, $1);
}
| BoolExpr
{
  $$ = A_BoolExprRVal($1->pos, $1);
}
;
RightValList: RightVal
{
  $$ = A_RightValList($1, NULL);
}
| RightVal COMMA RightValList
{
  $$ = A_RightValList($1, $3);
}
|
{
  $$ = NULL;
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

ExprUnit: NUM
{
  $$ = A_NumExprUnit($1->pos, $1->num);
}
| ID
{
  $$ = A_IdExprUnit($1->pos, $1->id);
}
| LEFT_PARENTHESIS ArithExpr RIGHT_PARENTHESIS
{
  $$ = A_ArithExprUnit($1, $2);
}
| FnCall
{
  $$ = A_CallExprUnit($1->pos, $1);
}
| ArrayExpr
{
  $$ = A_ArrayExprUnit($1->pos, $1);
}
| MemberExpr
{
  $$ = A_MemberExprUnit($1->pos, $1);
}
| ArithUExpr
{
  $$ = A_ArithUExprUnit($1->pos, $1);
}
;
ArithUExpr: SUB ExprUnit
{
  $$ = A_ArithUExpr($1, A_neg, $2);
}
;


Type: INT
{
  $$ = A_NativeType($1, A_intTypeKind);
}
| ID
{
  $$ = A_StructType($1->pos, $1->id);
}
;


VarDeclStmt: LET VarDecl SEMICOLON
{
  $$ = A_VarDeclStmt($1, $2);
}
| LET VarDef SEMICOLON
{
  $$ = A_VarDefStmt($1, $2);
}
;
VarDecl: ID COLON Type
{
  $$ = A_VarDecl_Scalar($1->pos, A_VarDeclScalar($1->pos, $1->id, $3));
}
| ID LEFT_SQUARE_BRACKET NUM RIGHT_SQUARE_BRACKET COLON Type
{
  $$ = A_VarDecl_Array($1->pos, A_VarDeclArray($1->pos, $1->id, $3->num, $6));
}
| ID
{
   $$ = A_VarDecl_Scalar($1->pos, A_VarDeclScalar($1->pos, $1->id, NULL));
}
| ID LEFT_SQUARE_BRACKET NUM RIGHT_SQUARE_BRACKET
{
  $$ = A_VarDecl_Array($1->pos, A_VarDeclArray($1->pos, $1->id, $3->num, NULL));
}
;
VarDef: ID COLON Type EQUAL RightVal
{
  $$ = A_VarDef_Scalar($1->pos, A_VarDefScalar($1->pos, $1->id, $3, $5));
}
| ID EQUAL RightVal
{
  $$ = A_VarDef_Scalar($1->pos, A_VarDefScalar($1->pos, $1->id, NULL, $3));
}
| ID LEFT_SQUARE_BRACKET NUM RIGHT_SQUARE_BRACKET COLON Type EQUAL OPEN_BRACE RightValList CLOSED_BRACE
{
  $$ = A_VarDef_Array($1->pos, A_VarDefArray($1->pos, $1->id, $3->num, $6, $9));
}
| ID LEFT_SQUARE_BRACKET NUM RIGHT_SQUARE_BRACKET EQUAL OPEN_BRACE RightValList CLOSED_BRACE
{
  $$ = A_VarDef_Array($1->pos, A_VarDefArray($1->pos, $1->id, $3->num, NULL, $7));
}
;

StructDef: STRUCT ID OPEN_BRACE VarDeclList CLOSED_BRACE
{
  $$ = A_StructDef($1, $2->id, $4);
}
;
VarDeclList: VarDecl
{
  $$ = A_VarDeclList($1, NULL); 
}
| VarDecl COMMA VarDeclList
{
  $$ = A_VarDeclList($1, $3); 
}
|
{
  $$ = NULL;
}
;

FnDeclStmt: FnDecl SEMICOLON
{
  $$ = A_FnDeclStmt($1->pos, $1);
}
;
FnDecl: FN ID LEFT_PARENTHESIS ParamDecl RIGHT_PARENTHESIS
{
  $$ = A_FnDecl($1, $2->id, $4, NULL);
}
| FN ID LEFT_PARENTHESIS ParamDecl RIGHT_PARENTHESIS RIGHT_ARROW Type
{
  $$ = A_FnDecl($1, $2->id, $4, $7);
}
;
ParamDecl: VarDeclList
{
  $$ = A_ParamDecl($1);
}
;

FnDef: FnDecl OPEN_BRACE CodeBlockStmtList CLOSED_BRACE
{
  $$ = A_FnDef($1->pos, $1, $3);
}
;
CodeBlockStmtList: CodeBlockStmt
{
  $$ = A_CodeBlockStmtList($1, NULL);
}
| CodeBlockStmt CodeBlockStmtList
{
  $$ = A_CodeBlockStmtList($1, $2);
}
;
CodeBlockStmt: VarDeclStmt
{
  $$ = A_BlockVarDeclStmt($1->pos, $1);
}
| AssignStmt
{
  $$ = A_BlockAssignStmt($1->pos, $1);
}
| CallStmt
{
  $$ = A_BlockCallStmt($1->pos, $1);
}
| IfStmt
{
  $$ = A_BlockIfStmt($1->pos, $1);
}
| WhileStmt
{
  $$ = A_BlockWhileStmt($1->pos, $1);
}
| ReturnStmt
{
  $$ = A_BlockReturnStmt($1->pos, $1);
}
| CONTINUE SEMICOLON
{
  $$ = A_BlockContinueStmt($1);
}
| BREAK SEMICOLON
{
  $$ = A_BlockBreakStmt($1);
}
| SEMICOLON
{
  $$ = A_BlockNullStmt($1);
}
;
AssignStmt: LeftVal EQUAL RightVal SEMICOLON
{
  $$ = A_AssignStmt($1->pos, $1, $3);
}
;
LeftVal: ID
{
  $$ = A_IdExprLVal($1->pos, $1->id);
}
| ArrayExpr
{
  $$ = A_ArrExprLVal($1->pos, $1);
}
| MemberExpr
{
  $$ = A_MemberExprLVal($1->pos, $1);
}
;
ArrayExpr: LeftVal LEFT_SQUARE_BRACKET ID RIGHT_SQUARE_BRACKET
{
  $$ = A_ArrayExpr($1->pos, $1, A_IdIndexExpr($3->pos, $3->id));
}
| LeftVal LEFT_SQUARE_BRACKET NUM RIGHT_SQUARE_BRACKET
{
  $$ = A_ArrayExpr($1->pos, $1, A_NumIndexExpr($3->pos, $3->num));
}
;
MemberExpr: LeftVal DOT ID
{
  $$ = A_MemberExpr($1->pos, $1, $3->id);
}
;
ReturnStmt: RETURN RightVal SEMICOLON
{
  $$ = A_ReturnStmt($1, $2);
}
| RETURN SEMICOLON
{
  $$ = A_ReturnStmt($1, NULL);
}
;
CallStmt: FnCall SEMICOLON
{
  $$ = A_CallStmt($1->pos, $1);
}
;
FnCall: ID LEFT_PARENTHESIS RightValList RIGHT_PARENTHESIS
{
  $$ = A_FnCall($1->pos, $1->id, $3);
}
;

IfStmt: IF LEFT_PARENTHESIS BoolExpr RIGHT_PARENTHESIS OPEN_BRACE CodeBlockStmtList CLOSED_BRACE
{
  $$ = A_IfStmt($1, $3, $6, NULL);
}
| IF LEFT_PARENTHESIS BoolExpr RIGHT_PARENTHESIS OPEN_BRACE CodeBlockStmtList CLOSED_BRACE ELSE OPEN_BRACE CodeBlockStmtList CLOSED_BRACE
{
  $$ = A_IfStmt($1, $3, $6, $10);
}
;
BoolExpr: BoolExpr BoolBiOp BoolUnit
{
  $$ = A_BoolBiOp_Expr($1->pos, A_BoolBiOpExpr($1->pos, $2, $1, A_BoolExpr($3->pos, $3)));
}
| BoolUnit
{
  $$ = A_BoolExpr($1->pos, $1);
}
;
BoolUnit: ExprUnit ComOp ExprUnit
{
  $$ = A_ComExprUnit($1->pos, A_ComExpr($1->pos, $2, $1, $3));
}
| LEFT_PARENTHESIS BoolExpr RIGHT_PARENTHESIS
{
  $$ = A_BoolExprUnit($1, $2);
}
| NOT BoolUnit
{
  $$ = A_BoolUOpExprUnit($1, A_BoolUOpExpr($1, A_not, $2));
}
;
BoolBiOp: AND
{
  $$ = A_and;
}
| OR
{
  $$ = A_or;
}
;
ComOp: GREATER
{
  $$ = A_gt;
}
| LESS
{
  $$ = A_lt;
}
| GREATER_EQUAL
{
  $$ = A_ge;
}
| LESS_EQUAL
{
  $$ = A_le;
}
| IS
{
  $$ = A_eq;
}
| IS_NOT
{
  $$ = A_ne;
}
;

WhileStmt: WHILE LEFT_PARENTHESIS BoolExpr RIGHT_PARENTHESIS OPEN_BRACE CodeBlockStmtList CLOSED_BRACE
{
  $$ = A_WhileStmt($1, $3, $6);
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


