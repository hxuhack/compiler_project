%{
#include <stdio.h>
#include <string.h>
#include "TeaplAst.h"
#include "y.tab.hpp"
extern int line, col;
int c;
int calc(char *s, int len);
%}

/* // TODO:
// your lexer */

%start COMMENT1 COMMENT2

/* step4:根据yacc中的token编写对应的lexer规则 */
%%
<INITIAL>{
"+" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return ADD;}
"-" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return SUB;}
"*" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return MUL;}
"/" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return DIV;}
";" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return SEMICOLON;}
"(" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return LPAREN;}
")" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return RPAREN;}
"{" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return LBRACE;}
"}" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return RBRACE;}
"==" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return EQ;}
"[" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return LEFT_BRACKET;}
"]" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return RIGHT_BRACKET;}
"!=" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return NEQ;}
"<" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return LT;}
">" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return GT;}
"<=" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return LE;}
">=" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return GE;}
"=" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return ASSIGN;}
"if" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return IF;}
"else" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return ELSE;}
"while" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return WHILE;}
"for" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return FOR;}
"ret" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return RETURN;}
"break" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return BREAK;}
"let" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return LET;}
":" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return COLON;}
"," {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return COMMA;}
"->" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return ARROW;}
"fn" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return FN;}
"continue" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return CONT;}
"&&" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return AND;}
"||" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return OR;}
"int" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return INT;}
"struct" {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return STRUCT;}
"." {yylval.pos=A_Pos(line,col);col+=strlen(yytext);return DOT;}

"//" {BEGIN COMMENT1;}
"/*" {BEGIN COMMENT2;} /* 注释 */
[\n\r] {line=line+1;col=1;}/* // \n \t \r 等占位符 */
" " {col+=1;}
"\t" {col+=4;}

[1-9]+[0-9]* {
    yylval.tokenNum = A_TokenNum(A_Pos(line, col), calc(yytext, yyleng));
    col+=yyleng;
    return NUM;
}

0 {
    yylval.tokenNum = A_TokenNum(A_Pos(line, col), 0);
    ++col;
    return NUM;
}

[a-zA-Z_]+[a-zA-Z0-9_]* {
   yylval.tokenId =  A_TokenId(A_Pos(line, col),strdup(yytext));
   col+=yyleng;
   return ID;
}

. {
    printf("Illegal input \"%c\"\n", yytext[0]);
}
}
<COMMENT1>. { /* 忽略单行注释内的所有内容 */ }
<COMMENT1>[\n\r] { BEGIN(INITIAL); line=line+1; col=0;} /* 遇到换行符，返回初始状态 */
<COMMENT2>. { /* 忽略多行注释内的所有内容 */ }
<COMMENT2>"*/" { BEGIN(INITIAL); } /* 遇到结束标记，返回初始状态 */
<COMMENT2>[\n\r] {  line=line+1; col=0;}
%%

// This function takes a string of digits and its length as input, and returns the integer value of the string.
int calc(char *s, int len) {
    int ret = 0;
    for(int i = 0; i < len; i++)
        ret = ret * 10 + (s[i] - '0');
    return ret;
}