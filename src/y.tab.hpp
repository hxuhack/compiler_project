/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_HPP_INCLUDED
# define YY_YY_Y_TAB_HPP_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    ADD = 258,                     /* ADD  */
    SUB = 259,                     /* SUB  */
    MUL = 260,                     /* MUL  */
    DIV = 261,                     /* DIV  */
    SEMICOLON = 262,               /* SEMICOLON  */
    IF = 263,                      /* IF  */
    ELSE = 264,                    /* ELSE  */
    WHILE = 265,                   /* WHILE  */
    BREAK = 266,                   /* BREAK  */
    LET = 267,                     /* LET  */
    FN = 268,                      /* FN  */
    STRUCT = 269,                  /* STRUCT  */
    RET = 270,                     /* RET  */
    CONTINUE = 271,                /* CONTINUE  */
    COLON = 272,                   /* COLON  */
    INT = 273,                     /* INT  */
    UNUM = 274,                    /* UNUM  */
    ID = 275,                      /* ID  */
    COMMA = 276,                   /* COMMA  */
    ASSIGN = 277,                  /* ASSIGN  */
    LPAREN = 278,                  /* LPAREN  */
    RPAREN = 279,                  /* RPAREN  */
    LBRACE = 280,                  /* LBRACE  */
    RBRACE = 281,                  /* RBRACE  */
    LBRACKET = 282,                /* LBRACKET  */
    RBRACKET = 283,                /* RBRACKET  */
    DOT = 284,                     /* DOT  */
    LT = 285,                      /* LT  */
    GT = 286,                      /* GT  */
    LE = 287,                      /* LE  */
    GE = 288,                      /* GE  */
    EQ = 289,                      /* EQ  */
    NEQ = 290,                     /* NEQ  */
    AND = 291,                     /* AND  */
    OR = 292,                      /* OR  */
    NOT = 293,                     /* NOT  */
    POINT = 294                    /* POINT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define ADD 258
#define SUB 259
#define MUL 260
#define DIV 261
#define SEMICOLON 262
#define IF 263
#define ELSE 264
#define WHILE 265
#define BREAK 266
#define LET 267
#define FN 268
#define STRUCT 269
#define RET 270
#define CONTINUE 271
#define COLON 272
#define INT 273
#define UNUM 274
#define ID 275
#define COMMA 276
#define ASSIGN 277
#define LPAREN 278
#define RPAREN 279
#define LBRACE 280
#define RBRACE 281
#define LBRACKET 282
#define RBRACKET 283
#define DOT 284
#define LT 285
#define GT 286
#define LE 287
#define GE 288
#define EQ 289
#define NEQ 290
#define AND 291
#define OR 292
#define NOT 293
#define POINT 294

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 23 "parser.yacc"

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

#line 193 "y.tab.hpp"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_HPP_INCLUDED  */
