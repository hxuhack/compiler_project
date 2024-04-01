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
    LET = 258,                     /* LET  */
    STRUCT = 259,                  /* STRUCT  */
    FN = 260,                      /* FN  */
    CONTINUE = 261,                /* CONTINUE  */
    BREAK = 262,                   /* BREAK  */
    RETURN = 263,                  /* RETURN  */
    WHILE = 264,                   /* WHILE  */
    IF = 265,                      /* IF  */
    ELSE = 266,                    /* ELSE  */
    NUM = 267,                     /* NUM  */
    ID = 268,                      /* ID  */
    INT = 269,                     /* INT  */
    ADD = 270,                     /* ADD  */
    SUB = 271,                     /* SUB  */
    MUL = 272,                     /* MUL  */
    DIV = 273,                     /* DIV  */
    SEMICOLON = 274,               /* SEMICOLON  */
    COLON = 275,                   /* COLON  */
    LEFT_SQUARE_BRACKET = 276,     /* LEFT_SQUARE_BRACKET  */
    RIGHT_SQUARE_BRACKET = 277,    /* RIGHT_SQUARE_BRACKET  */
    EQUAL = 278,                   /* EQUAL  */
    OPEN_BRACE = 279,              /* OPEN_BRACE  */
    CLOSED_BRACE = 280,            /* CLOSED_BRACE  */
    LEFT_PARENTHESIS = 281,        /* LEFT_PARENTHESIS  */
    RIGHT_PARENTHESIS = 282,       /* RIGHT_PARENTHESIS  */
    RIGHT_ARROW = 283,             /* RIGHT_ARROW  */
    DOT = 284,                     /* DOT  */
    COMMA = 285,                   /* COMMA  */
    AND = 286,                     /* AND  */
    OR = 287,                      /* OR  */
    NOT = 288,                     /* NOT  */
    LESS = 289,                    /* LESS  */
    MORE = 290,                    /* MORE  */
    LESS_EQUAL = 291,              /* LESS_EQUAL  */
    MORE_EQUAL = 292,              /* MORE_EQUAL  */
    IS = 293,                      /* IS  */
    IS_NOT = 294                   /* IS_NOT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define LET 258
#define STRUCT 259
#define FN 260
#define CONTINUE 261
#define BREAK 262
#define RETURN 263
#define WHILE 264
#define IF 265
#define ELSE 266
#define NUM 267
#define ID 268
#define INT 269
#define ADD 270
#define SUB 271
#define MUL 272
#define DIV 273
#define SEMICOLON 274
#define COLON 275
#define LEFT_SQUARE_BRACKET 276
#define RIGHT_SQUARE_BRACKET 277
#define EQUAL 278
#define OPEN_BRACE 279
#define CLOSED_BRACE 280
#define LEFT_PARENTHESIS 281
#define RIGHT_PARENTHESIS 282
#define RIGHT_ARROW 283
#define DOT 284
#define COMMA 285
#define AND 286
#define OR 287
#define NOT 288
#define LESS 289
#define MORE 290
#define LESS_EQUAL 291
#define MORE_EQUAL 292
#define IS 293
#define IS_NOT 294

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 19 "parser.yacc"


  A_tokenId tokenId;
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

#line 195 "y.tab.hpp"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_HPP_INCLUDED  */
