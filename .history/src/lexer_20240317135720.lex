%{
#include <stdio.h>
#include <string.h>
#include "TeaplAst.h"
#include "y.tab.hpp"
extern int line, col;
extern char* id; 
extern int num; 
int c;
int calc(char *s, int len);
%}
%s COMMENT1
%s COMMENT2


%%
<INITIAL> {
"//" {BEGIN COMMENT1; }
"/*" {BEGIN COMMENT2; }

"ret" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return RET; }
"let" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return LET; }
"fn" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return FN; }
"if" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return IF; }
"else" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return ELSE; }
"while" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return WHILE; }
"break" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return BREAK; }
"continue" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return CONTINUE; }
"int" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return INT; }
"struct" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return STRUCT; }

[\n\r] {line++; col=0; }
"+" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return ADD; }
"-" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return SUB; }
"*" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return MUL; }
"/" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return DIV; }

">=" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return GE; }
">" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return GT; }
"<=" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return LE; }
"<" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return LT; }
"==" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return EQ; }
"!=" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return NE; }
"=" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return ASSIGN; }

"&&" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return AND; }
"||" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return OR; }
"!" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return NOT; }

"->" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return ARROW; }

"(" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return LPa; }
")" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return RPa; }
"{" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return OPENCURLYBRACKET; }
"}" {yylval.pos=A_Pos(line, col); col+=strlen(yytext); return CLOSECURLYBRACKET; }


<INITIAL>"\t" { col+=4; }
<INITIAL>[1-9][0-9]* {
    yylval.tokenNum = A_TokenNum(A_Pos(line, col), calc(yytext, yyleng));
    col+=yyleng;
    return NUM;
}
<INITIAL>0 {
    yylval.tokenNum = A_TokenNum(A_Pos(line, col), 0);
    ++col;
    return NUM;
}
}
<COMMENT1> {
[\n\r] {
    BEGIN INITIAL;
    ++line;
    col = 0;
    .{ /* ignore comment */ }
}
}

<COMMENT2> {
"*/" {BEGIN INITIAL; }
[\n\r] {
    ++line;
    col = 0;
    .{ /* ignore comment */ }
}
}
%%

// This function takes a string of digits and its length as input, and returns the integer value of the string.
int calc(char *s, int len) {
    int ret = 0;
    for(int i = 0; i < len; i++)
        ret = ret * 10 + (s[i] - '0');
    return ret;
}