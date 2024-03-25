%{
#include <stdio.h>
#include <string.h>
#include "TeaplAst.h"
#include "y.tab.hpp"
extern int line, col;
extern "C" { void yyerror(char*); }
%}

%x COMMENT1
%x COMMENT2

%%

<INITIAL>"//"           {  BEGIN COMMENT1;  }
<COMMENT1>"\n"          {  BEGIN INITIAL;  }
<INITIAL>"/*"           {  BEGIN COMMENT2;  }
<COMMENT2>"*/"          {  BEGIN INITIAL;  }
<COMMENT1>.             { /* ignore comment */ }
<COMMENT2>.             { /* ignore comment */ }

"let"                   { return LET; } 
"struct"                { return STRUCT; }
"fn"                    { return FN; }
"continue"              { return CONTINUE; }
"break"                 { return BREAK; }
"ret"                   { return RETURN; }
"while"                 { return WHILE; }
"if"                    { return IF; }
"else"                  { return ELSE; }
[1-9][0-9]*|0	        { yylval.tokenNum = A_TokenNum(A_Pos(line, col), atoi(yytext)); return NUM; }
[_a-zA-Z][_a-zA-Z0-9]*    { char * temp = (char *)malloc(strlen(yytext) + 1); strcpy(temp, yytext); yylval.tokenId = A_TokenId(A_Pos(line, col), temp); return ID; }

"int"                   { return INT; }
"+"	                    { return ADD; }
"-"	                    { return SUB; }
"*"                     { return MUL; }
"/"                     { return DIV; }
";"                     { return SEMICOLON; }
":"                     { return COLON; }
"["                     { return LEFT_SQUARE_BRACKET; }
"]"                     { return RIGHT_SQUARE_BRACKET; }
"="                     { return EQUAL; }
"{"                     { return OPEN_BRACE; }
"}"                     { return CLOSED_BRACE; }
"("                     { return LEFT_PARENTHESIS; }
")"                     { return RIGHT_PARENTHESIS; }
"->"	                { return RIGHT_ARROW; }
"."                     { return DOT; }
","                     { return COMMA; }
"&&"                    { return AND; }
"||"                    { return OR; }
"!"                     { return NOT; }
"<"                     { return LESS; }
">"                     { return MORE; }
"<="                    { return LESS_EQUAL; }
">="                    { return MORE_EQUAL; }
"=="                    { return IS; }
"!="                    { return IS_NOT; }

[ \t\n\r]                 { /* ignore white space */ }
.	                    { yyerror("Unknown character! \n"); }
%%
