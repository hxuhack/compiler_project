%{
#include <stdio.h>
#include "TeaplAst.h"

extern A_pos pos;
extern A_program root;

extern int yylex(void);
extern "C"{
extern void yyerror(char *s); 
extern int  yywrap();
// extern int yydebug=1;
}

%}

// TODO:
// your parser

%union {
  //step1：对应TeaplAst.h中的类型补充
  A_pos pos;  //1
  A_type type;  //2
  A_varDecl varDecl;  //3
  A_varDef varDef;  //4
  A_rightVal rightVal;  //5
  A_arithExpr arithExpr;  //6
  A_boolExpr boolExpr;  //7
  A_arithBiOpExpr arithBiOpExpr;  //8
  A_arithUExpr arithUExpr;//9
  A_exprUnit exprUnit;  //10
  A_fnCall fnCall;  //11
  A_indexExpr indexExpr;  //12
  A_arrayExpr arrayExpr;  //13
  A_memberExpr memberExpr;  //14
  A_boolUnit boolUnit;  //15
  A_boolBiOpExpr boolBiOpExpr;  //16
  A_boolUOpExpr boolUOpExpr;  //17
  A_comExpr comExpr;  //18
  A_leftVal leftVal;  //19
  A_assignStmt assignStmt;  //20
  A_rightValList rightValList;  //21
  A_varDefScalar varDefScalar;  //22
  A_varDefArray varDefArray;  //23
  A_varDeclScalar varDeclScalar;  //24
  A_varDeclArray varDeclArray;  //25
  A_varDeclStmt varDeclStmt;  //26
  A_varDeclList varDeclList;  //27
  A_structDef structDef;  //28
  A_paramDecl paramDecl;  //29
  A_fnDecl fnDecl;  //30
  A_fnDef fnDef;  //31
  A_codeBlockStmt codeBlockStmt;  //32
  A_ifStmt ifStmt;  //33
  A_whileStmt whileStmt;  //34
  A_fnDeclStmt fnDeclStmt;  //35
  A_callStmt callStmt;  //36
  A_returnStmt returnStmt;  //37
  A_programElement programElement;  //38
  A_codeBlockStmtList codeBlockStmtList;  //39
  A_programElementList programElementList;  //40
  A_program program;  //41
  A_tokenId tokenId;  //42
  A_tokenNum tokenNum;  //43
}

//step2:定义对应的token
%token <pos> ADD  //加+
%token <pos> SUB  //减-
%token <pos> MUL  //乘*
%token <pos> DIV  //除/
%token <pos> SEMICOLON //分号;
%token <pos> LPAREN //左括号 (
%token <pos> RPAREN //右括号 )
%token <pos> LEFT_BRACKET  //左方括号 [
%token <pos> RIGHT_BRACKET //右方括号 ]
%token <pos> LBRACE //左大括号 {
%token <pos> RBRACE //右大括号 }
%token <pos> ASSIGN //赋值符号 =
%token <pos> EQ //等于 ==
%token <pos> NEQ //不等于 !=
%token <pos> LT //小于 <
%token <pos> GT //大于 >
%token <pos> LE //小于等于 <=
%token <pos> GE //大于等于 >=
%token <pos> NOT// 逻辑非操作符 !
%token <pos> IF //if
%token <pos> ELSE //else
%token <pos> WHILE //while
%token <pos> FOR //for
%token <pos> RETURN //return
%token <pos> BREAK //break
%token <pos> LET //let
%token <pos> COLON //冒号 :
%token <pos> ARROW //箭头 ->
%token <pos> COMMA //逗号,
%token <pos> FN //fn
%token <pos> CONT //continue
%token <pos> AND // 逻辑与 &&
%token <pos> OR // 逻辑或 ||
%token <pos> INT // int 关键字
%token <pos> STRUCT // struct 关键字
%token <pos> DOT // 点操作符 .
%token <tokenId> ID //标识符
%token <tokenNum> NUM //数字

//step3：根据union中的类，其中pos，tokenid，tokennum已定义，所以减去
%type <type> Type //2
%type <varDecl> VarDecl //3
%type <varDef> VarDef //4
%type <rightVal> RightVal //5
%type <arithExpr> ArithExpr //6
%type <boolExpr> BoolExpr //7
%type <arithBiOpExpr> ArithBiOpExpr //8
%type <arithUExpr> ArithUExpr //9
%type <exprUnit> ExprUnit //10
%type <fnCall> FnCall //11
%type <indexExpr> IndexExpr //12
%type <arrayExpr> ArrayExpr //13
%type <memberExpr> MemberExpr //14
%type <boolUnit> BoolUnit //15
%type <boolBiOpExpr> BoolBiOpExpr //16
%type <boolUOpExpr> BoolUOpExpr //17
%type <comExpr> ComExpr //18
%type <leftVal> LeftVal //19
%type <assignStmt> AssignStmt //20
%type <rightValList> RightValList //21
%type <varDefScalar> VarDefScalar //22
%type <varDefArray> VarDefArray //23
%type <varDeclScalar> VarDeclScalar //24
%type <varDeclArray> VarDeclArray //25
%type <varDeclStmt> VarDeclStmt //26
%type <varDeclList> VarDeclList //27
%type <structDef> StructDef //28
%type <paramDecl> ParamDecl //29
%type <fnDecl> FnDecl //30
%type <fnDef> FnDef //31
%type <codeBlockStmt> CodeBlockStmt //32
%type <ifStmt> IfStmt //33
%type <whileStmt> WhileStmt //34
%type <fnDeclStmt> FnDeclStmt //35
%type <callStmt> CallStmt //36
%type <returnStmt> ReturnStmt //37
%type <programElement> ProgramElement //38
%type <codeBlockStmtList> CodeBlockStmtList //39
%type <programElementList> ProgramElementList //40
%type <program> Program //41

%left ADD SUB
%left MUL DIV
%left OR
%left AND
%start Program

// step5：编写yacc规则,大类型下有对应的小类型，最后的小类型可以转换为终结符的连接
%%                   /* beginning of rules section */
//  teaplast.h中的所有类型

//2
Type: INT
{
  $$ = A_NativeType($1,A_intTypeKind);
}
|
ID
{
  $$ = A_StructType($1->pos,$1->id);
}

//3
VarDecl:VarDeclScalar
{
  $$ = A_VarDecl_Scalar($1->pos,$1);
}
|
VarDeclArray{
  $$ = A_VarDecl_Array($1->pos,$1);
};


//4
VarDef:
VarDefScalar{
  $$ = A_VarDef_Scalar($1->pos,$1);
}
|
VarDefArray{
  $$ = A_VarDef_Array($1->pos,$1);
};

//5
RightVal:
ArithExpr{
  $$ = A_ArithExprRVal($1->pos,$1);
}
|
BoolExpr{
  $$ = A_BoolExprRVal($1->pos,$1);
};

//6
ArithExpr:
ArithBiOpExpr{
  $$ = A_ArithBiOp_Expr($1->pos,$1);
}
|
ExprUnit{
  $$ = A_ExprUnit($1->pos,$1);
};


//7
BoolExpr:
BoolBiOpExpr{
  $$ = A_BoolBiOp_Expr($1->pos,$1);
}
|
BoolUnit{
  $$ = A_BoolExpr($1->pos,$1);
};


//8
ArithBiOpExpr:
ArithExpr ADD ArithExpr{
  $$ = A_ArithBiOpExpr($1->pos,A_add,$1,$3);
}
|
ArithExpr SUB ArithExpr{
  $$ = A_ArithBiOpExpr($1->pos,A_sub,$1,$3);
}
|
ArithExpr MUL ArithExpr{
  $$ = A_ArithBiOpExpr($1->pos,A_mul,$1,$3);
}
|
ArithExpr DIV ArithExpr{
  $$ = A_ArithBiOpExpr($1->pos,A_div,$1,$3);
};

//9
ArithUExpr:
SUB ExprUnit{
  $$ = A_ArithUExpr($1,A_neg,$2);
};

//10
ExprUnit:
NUM{
  $$ = A_NumExprUnit($1->pos,$1->num);
}
|
ID{
  $$ = A_IdExprUnit($1->pos,$1->id);
}
|
LPAREN ArithExpr RPAREN { 
  $$ = A_ArithExprUnit($1,$2); 
}
|
FnCall{
  $$ = A_CallExprUnit($1->pos,$1);
}
|
ArrayExpr{
  $$ = A_ArrayExprUnit($1->pos,$1);
}
|
MemberExpr{
  $$ = A_MemberExprUnit($1->pos,$1);
}
|
ArithUExpr{
  $$ = A_ArithUExprUnit($1->pos,$1);
};

//11
// fnCall → id '(' ((rightVal (, rightVal)*))? ')'
FnCall:
ID LPAREN RightValList RPAREN{
  $$ = A_FnCall($1->pos,$1->id,$3);
};

//12
IndexExpr:
NUM{
  $$ = A_NumIndexExpr($1->pos,$1->num);
}
|
ID{
  $$ = A_IdIndexExpr($1->pos,$1->id);
};

//13 
ArrayExpr:
LeftVal LEFT_BRACKET IndexExpr RIGHT_BRACKET{
  $$ = A_ArrayExpr($1->pos,$1,$3);
};

//14 
//A_memberExpr A_MemberExpr(A_pos pos, A_leftVal structId, char* memberId);
MemberExpr:
LeftVal DOT ID{
  $$ = A_MemberExpr($1->pos,$1,$3->id);
};

//15
//A_boolUnit A_ComExprUnit(A_pos pos, A_comExpr comExpr);
//A_boolUnit A_BoolExprUnit(A_pos pos, A_boolExpr boolExpr);
//A_boolUnit A_BoolUOpExprUnit(A_pos pos, A_boolUOpExpr boolUOpExpr);
BoolUnit:
ComExpr{
  $$ = A_ComExprUnit($1->pos,$1);
}
|
LPAREN BoolExpr RPAREN{
  $$ = A_BoolExprUnit($1,$2);
}
|
BoolUOpExpr{
  $$ = A_BoolUOpExprUnit($1->pos,$1);
};

//16
//A_boolBiOpExpr A_BoolBiOpExpr(A_pos pos, A_boolBiOp op, A_boolExpr left, A_boolUnit right);
BoolBiOpExpr:
BoolExpr OR BoolExpr{
  $$ = A_BoolBiOpExpr($1->pos,A_or,$1,$3);
}
|
BoolExpr AND BoolExpr{
  $$ = A_BoolBiOpExpr($1->pos,A_and,$1,$3);
};

//17
//A_boolUOpExpr A_BoolUOpExpr(A_pos pos, A_boolUOp op, A_boolUnit cond);
//BoolUOpExpr -> NOT_OPERATOR BoolExpr
BoolUOpExpr:
NOT BoolUnit{
  $$ = A_BoolUOpExpr($1,A_not,$2);
};

//18 
//A_comExpr A_ComExpr(A_pos pos, A_comOp op, A_exprUnit left, A_exprUnit right);
// ComExpr -> ExprUnit EQ ExprUnit
//             | ExprUnit NEQ ExprUnit
ComExpr:
ExprUnit GT ExprUnit{
  $$ = A_ComExpr($1->pos,A_gt,$1,$3);
}
|
ExprUnit LE ExprUnit{
  $$ = A_ComExpr($1->pos,A_le,$1,$3);
}
|
ExprUnit LT ExprUnit{
  $$ = A_ComExpr($1->pos,A_lt,$1,$3);
}
|
ExprUnit GE ExprUnit{
  $$ = A_ComExpr($1->pos,A_ge,$1,$3);
}
|
ExprUnit NEQ ExprUnit{
  $$ = A_ComExpr($1->pos,A_ne,$1,$3);
}
|
ExprUnit EQ ExprUnit{
  $$ = A_ComExpr($1->pos,A_eq,$1,$3);
};



//19
LeftVal:
//LeftVal -> IDENTIFIER | IndexExpr | MemberExpr
ArrayExpr{
  $$ = A_ArrExprLVal($1->pos,$1);
}
|
MemberExpr{
  $$ = A_MemberExprLVal($1->pos,$1);
}
|
ID{
  $$ = A_IdExprLVal($1->pos,$1->id);
};


//20 
AssignStmt:
//AssignStmt -> LeftVal ASSIGN RightVal SEMICOLON
LeftVal ASSIGN RightVal SEMICOLON{
 $$ = A_AssignStmt($1->pos,$1,$3);
};

//21 
//RightValList -> RightVal COMMA RightValList| RightVal
RightValList:
RightVal COMMA RightValList{
  $$ = A_RightValList($1,$3);
}
|
RightVal{
  $$ = A_RightValList($1,NULL);
}
|
{
  $$ = NULL;
};

//22 
//VarDefScalar -> id (':' type)? '=' rightVal
VarDefScalar:
ID COLON Type ASSIGN RightVal{
  $$ = A_VarDefScalar($1->pos,$1->id,$3,$5);
};

//23 形如qaq[1]:int = {0}
// id '[' (id | num) ']' (':' type)? '=' '{' num '}
VarDefArray:
ID LEFT_BRACKET NUM RIGHT_BRACKET COLON Type ASSIGN LBRACE RightValList RPAREN{
  $$ = A_VarDefArray($1->pos,$1->id,$3->num,$6,$9);
};

//24 声明，形如qaq:int
// id (':' type)?
VarDeclScalar:
ID COLON Type{
  $$ = A_VarDeclScalar($1->pos,$1->id,$3);
};

//25 形如qaq[1]:int
//id '[' (id | num) ']' (':' type)?
VarDeclArray:
ID LEFT_BRACKET NUM RIGHT_BRACKET COLON Type{
  $$ = A_VarDeclArray($1->pos,$1->id,$3->num,$6);
}

//26
//let a/a[1]:int
//let a:int = 6
//'let' (varDecl | varDef) ';
VarDeclStmt:
LET VarDecl SEMICOLON{
  $$ = A_VarDeclStmt($1,$2);
}
|
LET VarDef SEMICOLON{
  $$ = A_VarDefStmt($1,$2);
};

//27   a:int,
//a:int,b:int 连续声明
//VarDeclList -> VarDecl COMMA VarDeclList| VarDecl
VarDeclList:
VarDecl COMMA VarDeclList {
  $$ = A_VarDeclList($1,$3);
}
|
VarDecl{
  $$ = A_VarDeclList($1,NULL);
}
|
{
  $$ = NULL; 
};


//28
// 'struct' id '{' varDecl (, varDecl)* '}
StructDef:
STRUCT ID LBRACE VarDeclList RBRACE{
  $$ = A_StructDef($1,$2->id,$4);
};

//29
//参数声明
ParamDecl:
VarDeclList{
  $$ = A_ParamDecl($1);
};

//30
//声明函数 fn f(a:int)或者fn f(a:int)->int
//fnDeclStmt → 'fn' fnSign ';'  fnSign → id '(' params? ')' '->' type?
FnDecl:
FN ID LPAREN ParamDecl RPAREN{
  $$ = A_FnDecl($1,$2->id,$4,NULL);
}
|
FN ID LPAREN ParamDecl RPAREN ARROW Type{
  $$ = A_FnDecl($1,$2->id,$4,$7);
};

//31
// fnDef → fn fnSign codeBlock
FnDef:
FnDecl LBRACE CodeBlockStmtList RBRACE{
  $$ = A_FnDef($1->pos,$1,$3);
};

//32
CodeBlockStmt:
//  codeBlock → '{' stmt* '}'
//  stmt → varDeclStmt | assignStmt | callStmt | retStmt | ifStmt
//  | whileStmt | breakStmt | continueStmt | ';'
VarDeclStmt{
  $$ = A_BlockVarDeclStmt($1->pos,$1);
}
|
AssignStmt{
  $$ = A_BlockAssignStmt($1->pos,$1);
}
|
CallStmt{
  $$ = A_BlockCallStmt($1->pos,$1);
}
|
IfStmt{
  $$ = A_BlockIfStmt($1->pos,$1);
}
|
WhileStmt{
  $$ = A_BlockWhileStmt($1->pos,$1);
}
|
ReturnStmt{
  $$ = A_BlockReturnStmt($1->pos,$1);
}
|
CONT SEMICOLON{
  $$ = A_BlockContinueStmt($1);
}
|
BREAK SEMICOLON{
  $$ = A_BlockBreakStmt($1);
}
|
SEMICOLON{
  $$ = A_BlockNullStmt($1);
};

//33
// ifStmt → 'if' '(' boolExpr ')' codeBlock (else codeBlock)?
IfStmt:
IF LPAREN BoolExpr RPAREN LBRACE CodeBlockStmtList RBRACE{
  $$ = A_IfStmt($1,$3,$6,NULL);
}
|
IF LPAREN BoolExpr RPAREN LBRACE CodeBlockStmtList RBRACE ELSE LBRACE CodeBlockStmtList RBRACE{
  $$ = A_IfStmt($1,$3,$6,$10);
};


//34
// whileStmt → 'while' '(' boolExpr ')' codeBlock
WhileStmt:
WHILE LPAREN BoolExpr RPAREN LBRACE CodeBlockStmtList RBRACE{
  $$ = A_WhileStmt($1,$3,$6);
};

//35
FnDeclStmt:
FnDecl SEMICOLON{
  $$ = A_FnDeclStmt($1->pos,$1);
};

//36
//callStmt → fnCall ';'
CallStmt:
FnCall SEMICOLON{
  $$ = A_CallStmt($1->pos,$1);
};

//37
// retStmt → 'ret' rightVal? ';'
ReturnStmt:
RETURN RightVal SEMICOLON{
  $$ = A_ReturnStmt($1,$2);
}
| RETURN SEMICOLON{
  $$ = A_ReturnStmt($1,NULL);
}
;

//38
//program → (varDeclStmt | fnDeclStmt | fnDef | structDef | comment | ';')*
ProgramElement:
VarDeclStmt
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

//39
CodeBlockStmtList:
CodeBlockStmt CodeBlockStmtList{
  $$ = A_CodeBlockStmtList($1,$2);
}
|
{
  $$ = NULL;
}

//40
ProgramElementList:
ProgramElement ProgramElementList{
  $$ = A_ProgramElementList($1,$2);
}
|
{
  $$ = NULL;
};

//41
Program: ProgramElementList 
{  
  root = A_Program($1);
  $$ = A_Program($1);
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


