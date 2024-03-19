/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ADD = 258,
     SUB = 259,
     MUL = 260,
     DIV = 261,
     SEMICOLON = 262,
     DOT = 263,
     LET = 264,
     COLON = 265,
     COMMA = 266,
     OPENBRACKET = 267,
     CLOSEBRACKET = 268,
     ID = 269,
     NUM = 270,
     NType = 271,
     AND = 272,
     OR = 273,
     NOT = 274,
     EQ = 275,
     NE = 276,
     LT = 277,
     LE = 278,
     GT = 279,
     GE = 280,
     ASSIGN = 281,
     OPENCURLYBRACKET = 282,
     CLOSECURLYBRACKET = 283,
     LPa = 284,
     RPa = 285,
     STRUCT = 286,
     ARROW = 287,
     FN = 288,
     RET = 289,
     IF = 290,
     ELSE = 291,
     WHILE = 292,
     BREAK = 293,
     CONTINUE = 294
   };
#endif
/* Tokens.  */
#define ADD 258
#define SUB 259
#define MUL 260
#define DIV 261
#define SEMICOLON 262
#define DOT 263
#define LET 264
#define COLON 265
#define COMMA 266
#define OPENBRACKET 267
#define CLOSEBRACKET 268
#define ID 269
#define NUM 270
#define NType 271
#define AND 272
#define OR 273
#define NOT 274
#define EQ 275
#define NE 276
#define LT 277
#define LE 278
#define GT 279
#define GE 280
#define ASSIGN 281
#define OPENCURLYBRACKET 282
#define CLOSECURLYBRACKET 283
#define LPa 284
#define RPa 285
#define STRUCT 286
#define ARROW 287
#define FN 288
#define RET 289
#define IF 290
#define ELSE 291
#define WHILE 292
#define BREAK 293
#define CONTINUE 294




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 20 "parser.yacc"
{
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
/* Line 1529 of yacc.c.  */
#line 165 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

