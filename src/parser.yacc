%{
#include <stdio.h>
#include "TeaplAst.h"

extern A_pos pos;
extern A_program root;

extern int yylex(void);
extern "C"{
extern void yyerror(const char *s); 
extern int  yywrap();
}

%}

%left ADD SUB 
%left MUL DIV
%left AND OR
%left UNUM
// TODO:
// your parser

%union {
  A_pos pos;
  A_tokenId tokenId;
  A_tokenNum tokenNum;
  A_type type;
  A_program program;
  A_programElementList programElementList;
  A_programElement programElement;
  A_arithExpr arithExpr;
  A_exprUnit exprUnit;
  A_structDef structDef;
  A_varDef varDef;
  A_varDefArray varDefArray;
  A_varDefScalar varDefScalar;
  A_varDecl varDecl;
  A_varDeclList varDecls;
  A_varDeclArray varDeclArray;
  A_varDeclScalar varDeclScalar;
  A_leftVal leftVal;
  A_rightVal rightVal;
  A_rightValList rightValList;
  A_varDeclStmt varDeclStmt;
  A_assignStmt assignStmt;
  A_callStmt callStmt;
  A_ifStmt ifStmt;
  A_whileStmt whileStmt;
  A_returnStmt returnStmt;
  A_fnDeclStmt fnDeclStmt;
  A_fnDecl fnDecl;
  A_paramDecl paramDecl;
  A_fnDef fnDef;
  A_codeBlockStmtList codeBlockStmtList;
  A_codeBlockStmt codeBlockStmt;
  A_arrayExpr arrayExpr;
  A_memberExpr memberExpr;
  A_indexExpr indexExpr;
  A_fnCall fnCall;
  A_boolUnit boolUnit;
  A_comExpr comExpr;
  A_comOp comOp;
  A_boolExpr boolExpr;
  A_boolUOpExpr boolUOpExpr;
  A_arithUExpr arithUExpr;
  A_arithUOp arithUOp;
  A_boolBiOpExpr boolBiOpExpr;
  A_boolUOp boolUOp;
}

%token <pos> ADD
%token <pos> SUB
%token <pos> MUL
%token <pos> DIV
%token <pos> SEMICOLON // ";" 
%token <pos> IF
%token <pos> ELSE
%token <pos> WHILE
%token <pos> BREAK
%token <pos> LET
%token <pos> FN
%token <pos> STRUCT
%token <pos> RET
%token <pos> CONTINUE 
%token <pos> COLON // ":"
%token <type> INT
%token <tokenNum> UNUM
%token <tokenId> ID
%token <pos> COMMA // ","
%token <pos> ASSIGN // "="
%token <pos> LPAREN // "("
%token <pos> RPAREN // ")"
%token <pos> LBRACE // "{"
%token <pos> RBRACE // "}"
%token <pos> LBRACKET // "["
%token <pos> RBRACKET // "]"
%token <pos> DOT // "."
%token <pos> LT // "<"
%token <pos> GT // ">"
%token <pos> LE // "<="
%token <pos> GE // ">="
%token <pos> EQ // "=="
%token <pos> NEQ // "!="
%token <pos> AND // "&&"
%token <pos> OR  // "||"
%token <pos> NOT // "!"
%token <pos> POINT // "->"

%type <program> Program
%type <arithExpr> ArithExpr
%type <programElementList> ProgramElementList
%type <programElement> ProgramElement
%type <exprUnit> ExprUnit
%type <structDef> StructDef
%type <varDeclStmt> VarDeclStmt
%type <assignStmt> AssignStmt
%type <callStmt> CallStmt
%type <ifStmt> IfStmt
%type <whileStmt> WhileStmt
%type <returnStmt> ReturnStmt
%type <varDef> VarDef
%type <varDecl> VarDecl
%type <varDecls> VarDecls
%type <varDeclArray> VarDeclArray
%type <varDeclScalar> VarDeclScalar
%type <varDefScalar> VarDefScalar
%type <varDefArray> VarDefArray
%type <leftVal> LeftVal
%type <rightVal> RightVal
%type <rightValList> RightValList
%type <fnDeclStmt> FnDeclStmt
%type <fnDecl> FnDecl
%type <paramDecl> ParamDecl
%type <fnDef> FnDef
%type <codeBlockStmtList> CodeBlockStmtList
%type <codeBlockStmt> CodeBlockStmt
%type <arrayExpr> ArrExpr
%type <memberExpr> MemberExpr
%type <indexExpr> IndexExpr
%type <fnCall> FnCall
%type <type> Type
%type <boolUnit> BoolUnit
%type <comExpr> ComExpr
%type <comOp> ComOp
%type <boolExpr> BoolExpr
%type <boolUOpExpr> BoolUOpExpr
%type <arithUExpr> ArithUExpr
%type <arithUOp> ArithUOp
%type <boolBiOpExpr> BoolBiOpExpr
%type <boolUOp> BoolUOp
%type <tokenNum> Num


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

Num: UNUM
{
  $$ = $1;
}
| SUB UNUM 
{
  $$->num = 0 - $2->num; 
}

FnDef: FnDecl LBRACE CodeBlockStmtList RBRACE 
{
  $$ = A_FnDef($1->pos, $1, $3);
}
;

CodeBlockStmtList: CodeBlockStmt CodeBlockStmtList 
{
  $$ = A_CodeBlockStmtList($1, $2);
} 
| CodeBlockStmt
{
  $$ = A_CodeBlockStmtList($1, nullptr);
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

ReturnStmt: RET RightVal SEMICOLON
{
  $$ = A_ReturnStmt($1, $2);
}
| RET SEMICOLON
{
  $$ = A_ReturnStmt($1, nullptr);
}
;

WhileStmt: WHILE BoolUnit LBRACE CodeBlockStmtList RBRACE
{
  $$ = A_WhileStmt($1, $2, $4);
}
;

AssignStmt: LeftVal ASSIGN RightVal SEMICOLON
{
  $$ = A_AssignStmt($1->pos, $1, $3);
}
;

LeftVal: ID
{
  $$ = A_IdExprLVal($1->pos, $1->id);
}
| ArrExpr 
{
  $$ = A_ArrExprLVal($1->pos, $1);
}
| MemberExpr
{
  $$ = A_MemberExprLVal($1->pos, $1);
}
;

MemberExpr: LeftVal DOT ID
{
  $$ = A_MemberExpr($1->pos, $1, $3->id);
}
;

ArrExpr: LeftVal LBRACKET IndexExpr RBRACKET
{
  $$ = A_ArrayExpr($1->pos, $1, $3);
}
;

IndexExpr: ID
{
  $$ = A_IdIndexExpr($1->pos, $1->id);
}
| Num
{
  $$ = A_NumIndexExpr($1->pos, $1->num);
}
;

CallStmt: FnCall SEMICOLON
{
  $$ = A_CallStmt($1->pos, $1);
}
;

FnCall: ID LPAREN RightValList RPAREN 
{
  $$ = A_FnCall($1->pos, $1->id, $3);
} 
;

IfStmt: IF BoolUnit LBRACE CodeBlockStmtList RBRACE ELSE LBRACE CodeBlockStmtList RBRACE
{
  $$ = A_IfStmt($1, $2, $4, $8);
}
| IF BoolUnit LBRACE CodeBlockStmtList RBRACE
{
  $$ = A_IfStmt($1, $2, $4, nullptr);
}
;


BoolUnit: LPAREN ComExpr RPAREN
{
  $$ = A_ComExprUnit($2->pos, $2);
}
| LPAREN BoolExpr RPAREN
{ 
  $$ = A_BoolExprUnit($2->pos, $2);
}
| LPAREN BoolUOpExpr RPAREN
{
  $$ = A_BoolUOpExprUnit($2->pos, $2);
}
;

BoolUOpExpr: BoolUOp BoolUnit
{
  $$ = A_BoolUOpExpr($2->pos, $1, $2);
}
;

BoolUOp: NOT
{
  $$ = A_not;
}
;

BoolExpr: BoolBiOpExpr 
{
  $$ = A_BoolBiOp_Expr($1->pos, $1);
}
| BoolUnit
{
  $$ = A_BoolExpr($1->pos, $1);
}
;

BoolBiOpExpr: BoolExpr AND BoolExpr
{
  $$ = A_BoolBiOpExpr($1->pos, A_and, $1, $3);
}
| BoolExpr OR BoolExpr
{
  $$ = A_BoolBiOpExpr($1->pos, A_or, $1, $3);
}
;

ComExpr: ExprUnit ComOp ExprUnit
{
  $$ = A_ComExpr($1->pos, $2, $1, $3);
}
;

ComOp: LT
{
  $$ = A_lt;
}
| LE
{
  $$ = A_le;
}
| GT
{
  $$ = A_gt;
}
| GE
{
  $$ = A_ge;
}
| EQ
{
  $$ = A_eq;
}
| NEQ
{
  $$ = A_ne;
}
;

ExprUnit: Num
{
  $$ = A_NumExprUnit($1->pos, $1->num);
}
| ID
{
  $$ = A_IdExprUnit($1->pos, $1->id);
}
| LPAREN ArithExpr RPAREN
{
  $$ = A_ArithExprUnit($2->pos, $2);
}
| FnCall
{
  $$ = A_CallExprUnit($1->pos, $1);
}
| ArrExpr
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

ArithUExpr: ArithUOp ExprUnit
{
  $$ = A_ArithUExpr($2->pos, $1, $2);
} 
;

ArithUOp: SUB
{
  $$ = A_neg;
}

FnDeclStmt: FnDecl SEMICOLON
{
  $$ = A_FnDeclStmt($1->pos, $1);
}
;

FnDecl: FN ID LPAREN ParamDecl RPAREN POINT Type
{
  $$ = A_FnDecl($1, $2->id, $4, $7);
}
| FN ID LPAREN ParamDecl RPAREN
{
  $$ = A_FnDecl($1, $2->id, $4, nullptr);
}
;

ParamDecl: VarDecls
{
  $$ = A_ParamDecl($1);
}
;

StructDef: STRUCT ID LBRACE VarDecls RBRACE
{
  $$ = A_StructDef($1, $2->id, $4);
}
;

VarDecls: VarDecl COMMA VarDecls
{
  $$ = A_VarDeclList($1, $3);
}
| VarDecl 
{
  $$ = A_VarDeclList($1,nullptr);
}
|
{
  $$ = nullptr;
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

VarDecl: VarDeclScalar
{
  $$ = A_VarDecl_Scalar($1->pos, $1);
}
| VarDeclArray{
  $$ = A_VarDecl_Array($1->pos, $1);
}
;

VarDeclScalar: ID COLON Type
{
  $$ = A_VarDeclScalar($1->pos, $1->id, $3);
}
| ID
{
  $$ = A_VarDeclScalar($1->pos, $1->id, nullptr);
}
;

VarDeclArray: ID LBRACKET Num RBRACKET COLON Type
{
  $$ = A_VarDeclArray($1->pos, $1->id, $3->num, $6);
}
| ID LBRACKET Num RBRACKET
{
  $$ = A_VarDeclArray($1->pos, $1->id, $3->num, nullptr);
}
;

VarDef: VarDefScalar
{
  $$ = A_VarDef_Scalar($1->pos, $1);
}
| VarDefArray
{
  $$ = A_VarDef_Array($1->pos, $1);
}
;

VarDefScalar: ID COLON Type ASSIGN RightVal
{
  $$ = A_VarDefScalar($1->pos, $1->id, $3, $5);
}
| ID ASSIGN RightVal
{
  $$ = A_VarDefScalar($1->pos, $1->id, nullptr, $3);
}
;

VarDefArray: ID LBRACKET Num RBRACKET COLON Type ASSIGN LBRACE RightValList RBRACE
{
  $$ = A_VarDefArray($1->pos, $1->id, $3->num, $6, $9);
}
| ID LBRACKET Num RBRACKET ASSIGN LBRACE RightValList RBRACE
{
  $$ = A_VarDefArray($1->pos, $1->id, $3->num, nullptr, $7);
}
;

Type: INT 
{
  $$ = A_NativeType($1->pos, A_intTypeKind);
}
| ID
{
  $$ = A_StructType($1->pos, $1->id);
}
;

RightValList: RightVal COMMA RightValList
{
  $$ = A_RightValList($1, $3);
}
|RightVal
{
  $$ = A_RightValList($1, nullptr);
}
|
{
  $$ = nullptr;
}
;


RightVal: ArithExpr
{
  $$ = A_ArithExprRVal($1->pos, $1);
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
void yyerror(const char * s)
{
  fprintf(stderr, "%s\n",s);
}
int yywrap()
{
  return(1);
}
}


