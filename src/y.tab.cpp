/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "parser.yacc"

#include <stdio.h>
#include "TeaplAst.h"

extern A_pos pos;
extern A_program root;

extern int yylex(void);
extern "C"{
extern void yyerror(const char *s); 
extern int  yywrap();
}


#line 86 "y.tab.cpp"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "y.tab.hpp"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_ADD = 3,                        /* ADD  */
  YYSYMBOL_SUB = 4,                        /* SUB  */
  YYSYMBOL_MUL = 5,                        /* MUL  */
  YYSYMBOL_DIV = 6,                        /* DIV  */
  YYSYMBOL_SEMICOLON = 7,                  /* SEMICOLON  */
  YYSYMBOL_IF = 8,                         /* IF  */
  YYSYMBOL_ELSE = 9,                       /* ELSE  */
  YYSYMBOL_WHILE = 10,                     /* WHILE  */
  YYSYMBOL_BREAK = 11,                     /* BREAK  */
  YYSYMBOL_LET = 12,                       /* LET  */
  YYSYMBOL_FN = 13,                        /* FN  */
  YYSYMBOL_STRUCT = 14,                    /* STRUCT  */
  YYSYMBOL_RET = 15,                       /* RET  */
  YYSYMBOL_CONTINUE = 16,                  /* CONTINUE  */
  YYSYMBOL_COLON = 17,                     /* COLON  */
  YYSYMBOL_INT = 18,                       /* INT  */
  YYSYMBOL_UNUM = 19,                      /* UNUM  */
  YYSYMBOL_ID = 20,                        /* ID  */
  YYSYMBOL_COMMA = 21,                     /* COMMA  */
  YYSYMBOL_ASSIGN = 22,                    /* ASSIGN  */
  YYSYMBOL_LPAREN = 23,                    /* LPAREN  */
  YYSYMBOL_RPAREN = 24,                    /* RPAREN  */
  YYSYMBOL_LBRACE = 25,                    /* LBRACE  */
  YYSYMBOL_RBRACE = 26,                    /* RBRACE  */
  YYSYMBOL_LBRACKET = 27,                  /* LBRACKET  */
  YYSYMBOL_RBRACKET = 28,                  /* RBRACKET  */
  YYSYMBOL_DOT = 29,                       /* DOT  */
  YYSYMBOL_LT = 30,                        /* LT  */
  YYSYMBOL_GT = 31,                        /* GT  */
  YYSYMBOL_LE = 32,                        /* LE  */
  YYSYMBOL_GE = 33,                        /* GE  */
  YYSYMBOL_EQ = 34,                        /* EQ  */
  YYSYMBOL_NEQ = 35,                       /* NEQ  */
  YYSYMBOL_AND = 36,                       /* AND  */
  YYSYMBOL_OR = 37,                        /* OR  */
  YYSYMBOL_NOT = 38,                       /* NOT  */
  YYSYMBOL_POINT = 39,                     /* POINT  */
  YYSYMBOL_YYACCEPT = 40,                  /* $accept  */
  YYSYMBOL_Program = 41,                   /* Program  */
  YYSYMBOL_ProgramElementList = 42,        /* ProgramElementList  */
  YYSYMBOL_ProgramElement = 43,            /* ProgramElement  */
  YYSYMBOL_Num = 44,                       /* Num  */
  YYSYMBOL_FnDef = 45,                     /* FnDef  */
  YYSYMBOL_CodeBlockStmtList = 46,         /* CodeBlockStmtList  */
  YYSYMBOL_CodeBlockStmt = 47,             /* CodeBlockStmt  */
  YYSYMBOL_ReturnStmt = 48,                /* ReturnStmt  */
  YYSYMBOL_WhileStmt = 49,                 /* WhileStmt  */
  YYSYMBOL_AssignStmt = 50,                /* AssignStmt  */
  YYSYMBOL_LeftVal = 51,                   /* LeftVal  */
  YYSYMBOL_MemberExpr = 52,                /* MemberExpr  */
  YYSYMBOL_ArrExpr = 53,                   /* ArrExpr  */
  YYSYMBOL_IndexExpr = 54,                 /* IndexExpr  */
  YYSYMBOL_CallStmt = 55,                  /* CallStmt  */
  YYSYMBOL_FnCall = 56,                    /* FnCall  */
  YYSYMBOL_IfStmt = 57,                    /* IfStmt  */
  YYSYMBOL_BoolUnit = 58,                  /* BoolUnit  */
  YYSYMBOL_BoolUOpExpr = 59,               /* BoolUOpExpr  */
  YYSYMBOL_BoolUOp = 60,                   /* BoolUOp  */
  YYSYMBOL_BoolExpr = 61,                  /* BoolExpr  */
  YYSYMBOL_BoolBiOpExpr = 62,              /* BoolBiOpExpr  */
  YYSYMBOL_ComExpr = 63,                   /* ComExpr  */
  YYSYMBOL_ComOp = 64,                     /* ComOp  */
  YYSYMBOL_ExprUnit = 65,                  /* ExprUnit  */
  YYSYMBOL_ArithUExpr = 66,                /* ArithUExpr  */
  YYSYMBOL_ArithUOp = 67,                  /* ArithUOp  */
  YYSYMBOL_FnDeclStmt = 68,                /* FnDeclStmt  */
  YYSYMBOL_FnDecl = 69,                    /* FnDecl  */
  YYSYMBOL_ParamDecl = 70,                 /* ParamDecl  */
  YYSYMBOL_StructDef = 71,                 /* StructDef  */
  YYSYMBOL_VarDecls = 72,                  /* VarDecls  */
  YYSYMBOL_VarDeclStmt = 73,               /* VarDeclStmt  */
  YYSYMBOL_VarDecl = 74,                   /* VarDecl  */
  YYSYMBOL_VarDeclScalar = 75,             /* VarDeclScalar  */
  YYSYMBOL_VarDeclArray = 76,              /* VarDeclArray  */
  YYSYMBOL_VarDef = 77,                    /* VarDef  */
  YYSYMBOL_VarDefScalar = 78,              /* VarDefScalar  */
  YYSYMBOL_VarDefArray = 79,               /* VarDefArray  */
  YYSYMBOL_Type = 80,                      /* Type  */
  YYSYMBOL_RightValList = 81,              /* RightValList  */
  YYSYMBOL_RightVal = 82,                  /* RightVal  */
  YYSYMBOL_ArithExpr = 83                  /* ArithExpr  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  22
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   178

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  40
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  44
/* YYNRULES -- Number of rules.  */
#define YYNRULES  96
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  177

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   294


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   158,   158,   165,   170,   175,   179,   183,   187,   191,
     197,   201,   206,   212,   216,   222,   226,   230,   234,   238,
     242,   246,   250,   254,   260,   264,   270,   276,   282,   286,
     290,   296,   302,   308,   312,   318,   324,   330,   334,   341,
     345,   349,   355,   361,   367,   371,   377,   381,   387,   393,
     397,   401,   405,   409,   413,   419,   423,   427,   431,   435,
     439,   443,   449,   455,   460,   466,   470,   476,   482,   488,
     492,   497,   502,   506,   512,   516,   521,   525,   531,   535,
     541,   545,   551,   555,   561,   565,   571,   575,   581,   585,
     590,   596,   602,   606,   610,   614,   618
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "ADD", "SUB", "MUL",
  "DIV", "SEMICOLON", "IF", "ELSE", "WHILE", "BREAK", "LET", "FN",
  "STRUCT", "RET", "CONTINUE", "COLON", "INT", "UNUM", "ID", "COMMA",
  "ASSIGN", "LPAREN", "RPAREN", "LBRACE", "RBRACE", "LBRACKET", "RBRACKET",
  "DOT", "LT", "GT", "LE", "GE", "EQ", "NEQ", "AND", "OR", "NOT", "POINT",
  "$accept", "Program", "ProgramElementList", "ProgramElement", "Num",
  "FnDef", "CodeBlockStmtList", "CodeBlockStmt", "ReturnStmt", "WhileStmt",
  "AssignStmt", "LeftVal", "MemberExpr", "ArrExpr", "IndexExpr",
  "CallStmt", "FnCall", "IfStmt", "BoolUnit", "BoolUOpExpr", "BoolUOp",
  "BoolExpr", "BoolBiOpExpr", "ComExpr", "ComOp", "ExprUnit", "ArithUExpr",
  "ArithUOp", "FnDeclStmt", "FnDecl", "ParamDecl", "StructDef", "VarDecls",
  "VarDeclStmt", "VarDecl", "VarDeclScalar", "VarDeclArray", "VarDef",
  "VarDefScalar", "VarDefArray", "Type", "RightValList", "RightVal",
  "ArithExpr", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-119)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-31)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      99,  -119,    46,    55,    82,   107,  -119,    99,  -119,  -119,
      29,  -119,  -119,    81,    28,  -119,  -119,   103,  -119,  -119,
     106,   110,  -119,  -119,  -119,    89,     1,    10,    51,  -119,
    -119,   111,   111,  -119,   113,   113,   130,    33,   131,   116,
     114,    89,  -119,  -119,  -119,    36,  -119,  -119,  -119,   134,
    -119,  -119,  -119,  -119,   120,   124,  -119,    57,    10,  -119,
      97,    98,   101,  -119,  -119,  -119,    10,  -119,   117,   124,
     118,    15,   121,  -119,   123,   122,     8,   125,   127,  -119,
    -119,   147,  -119,    10,  -119,  -119,    10,    41,   135,  -119,
      10,  -119,    20,  -119,    10,    10,    10,    10,    45,     1,
      51,   119,   111,  -119,     8,  -119,  -119,   132,   113,    35,
    -119,   133,    84,    89,    89,  -119,   136,   138,   154,  -119,
    -119,   137,  -119,  -119,  -119,    73,    73,  -119,  -119,     1,
     139,  -119,   140,     1,  -119,    84,  -119,  -119,  -119,   113,
     113,  -119,  -119,  -119,  -119,  -119,  -119,  -119,    10,   141,
     143,  -119,    10,  -119,  -119,   144,    10,   145,  -119,  -119,
    -119,  -119,   161,  -119,  -119,   146,   148,     1,   150,    10,
    -119,  -119,    89,   151,   152,  -119,  -119
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       4,     9,     0,     0,     0,     0,     2,     4,     8,     7,
       0,     6,     5,    77,     0,    74,    75,     0,    80,    81,
       0,     0,     1,     3,    64,     0,     0,     0,     0,    72,
      73,    71,    71,    23,     0,     0,     0,     0,     0,    28,
       0,    14,    20,    19,    16,     0,    30,    29,    17,     0,
      18,    15,    86,    87,    76,    63,    10,    56,     0,    55,
       0,    60,    59,    58,    96,    61,     0,    83,    91,     0,
       0,    77,     0,    67,    70,     0,     0,     0,     0,    22,
      25,     0,    21,    90,    12,    13,     0,     0,     0,    35,
       0,    11,     0,    62,     0,     0,     0,     0,    79,     0,
       0,    66,    71,    68,     0,    43,    45,     0,     0,     0,
      44,     0,     0,     0,     0,    24,     0,    89,     0,    33,
      34,     0,    31,    82,    57,    92,    93,    94,    95,     0,
       0,    76,     0,     0,    69,    96,    41,    42,    40,     0,
       0,    39,    49,    51,    50,    52,    53,    54,     0,     0,
       0,    36,    90,    27,    32,    78,    90,    79,    65,    46,
      47,    48,    38,    26,    88,     0,     0,     0,     0,    90,
      85,    78,     0,     0,     0,    84,    37
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -119,  -119,   156,  -119,   -18,  -119,   -40,  -119,  -119,  -119,
    -119,   -25,   -23,   -21,  -119,  -119,   -19,  -119,   -27,  -119,
    -119,    -6,  -119,  -119,  -119,   -63,  -119,  -119,  -119,  -119,
    -119,  -119,   -15,    76,   170,  -119,  -119,  -119,  -119,  -119,
     -90,  -118,   -22,   -47
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,     5,     6,     7,    59,     8,    40,    41,    42,    43,
      44,    60,    61,    62,   121,    48,    63,    50,   106,   107,
     108,   109,   110,   111,   148,    64,    65,    66,     9,    10,
      72,    11,    73,    51,    74,    15,    16,    17,    18,    19,
      54,   116,   117,    68
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      45,    85,    46,    93,    47,    67,    49,    77,    78,   131,
      70,    92,    55,   112,    55,    81,    45,    75,    46,    52,
      47,    53,    49,    94,    95,    96,    97,    56,    57,    56,
      57,   104,    99,    58,   164,    29,    24,    55,   166,   155,
      80,   135,   100,   158,   124,    69,   105,   125,   126,   127,
     128,   173,    56,    57,    25,    69,    58,    92,    86,   138,
      56,   119,   129,    87,   118,    88,    13,   130,   123,   120,
      56,   139,   140,   149,   150,    20,    12,   171,    96,    97,
      83,   137,   132,    12,   -28,   161,   -28,   134,    45,    45,
      46,    46,    47,    47,    49,    49,    33,    34,    26,    35,
      36,     2,    21,    27,    37,    38,     1,    22,    28,    39,
      30,     2,     3,     4,   142,   143,   144,   145,   146,   147,
      94,    95,    96,    97,    87,   -30,    88,   -30,   -29,    31,
     -29,    71,   174,   159,   160,    32,    76,    79,    82,    83,
      84,    89,    90,    91,   102,   101,    98,    45,   103,    46,
     113,    47,   114,    49,   115,   122,   136,   141,   133,   152,
     151,   153,   167,    23,   156,   154,   165,   162,   157,   163,
     168,   169,    14,     0,   170,   172,     0,   175,   176
};

static const yytype_int16 yycheck[] =
{
      25,    41,    25,    66,    25,    27,    25,    34,    35,    99,
      28,    58,     4,    76,     4,    37,    41,    32,    41,    18,
      41,    20,    41,     3,     4,     5,     6,    19,    20,    19,
      20,    23,    17,    23,   152,     7,     7,     4,   156,   129,
       7,   104,    27,   133,    24,     4,    38,    94,    95,    96,
      97,   169,    19,    20,    25,     4,    23,   104,    22,    24,
      19,    20,    17,    27,    86,    29,    20,    22,    90,    87,
      19,    36,    37,   113,   114,    20,     0,   167,     5,     6,
      23,   108,   100,     7,    27,   148,    29,   102,   113,   114,
     113,   114,   113,   114,   113,   114,     7,     8,    17,    10,
      11,    12,    20,    22,    15,    16,     7,     0,    27,    20,
       7,    12,    13,    14,    30,    31,    32,    33,    34,    35,
       3,     4,     5,     6,    27,    27,    29,    29,    27,    23,
      29,    20,   172,   139,   140,    25,    23,     7,     7,    23,
      26,     7,    22,    19,    21,    24,    28,   172,    26,   172,
      25,   172,    25,   172,     7,    20,    24,    24,    39,    21,
      24,     7,    17,     7,    25,    28,    22,    26,    28,    26,
       9,    25,     2,    -1,    26,    25,    -1,    26,    26
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     7,    12,    13,    14,    41,    42,    43,    45,    68,
      69,    71,    73,    20,    74,    75,    76,    77,    78,    79,
      20,    20,     0,    42,     7,    25,    17,    22,    27,     7,
       7,    23,    25,     7,     8,    10,    11,    15,    16,    20,
      46,    47,    48,    49,    50,    51,    52,    53,    55,    56,
      57,    73,    18,    20,    80,     4,    19,    20,    23,    44,
      51,    52,    53,    56,    65,    66,    67,    82,    83,     4,
      44,    20,    70,    72,    74,    72,    23,    58,    58,     7,
       7,    82,     7,    23,    26,    46,    22,    27,    29,     7,
      22,    19,    83,    65,     3,     4,     5,     6,    28,    17,
      27,    24,    21,    26,    23,    38,    58,    59,    60,    61,
      62,    63,    65,    25,    25,     7,    81,    82,    82,    20,
      44,    54,    20,    82,    24,    83,    83,    83,    83,    17,
      22,    80,    44,    39,    72,    65,    24,    58,    24,    36,
      37,    24,    30,    31,    32,    33,    34,    35,    64,    46,
      46,    24,    21,     7,    28,    80,    25,    28,    80,    61,
      61,    65,    26,    26,    81,    22,    81,    17,     9,    25,
      26,    80,    25,    81,    46,    26,    26
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    40,    41,    42,    42,    43,    43,    43,    43,    43,
      44,    44,    45,    46,    46,    47,    47,    47,    47,    47,
      47,    47,    47,    47,    48,    48,    49,    50,    51,    51,
      51,    52,    53,    54,    54,    55,    56,    57,    57,    58,
      58,    58,    59,    60,    61,    61,    62,    62,    63,    64,
      64,    64,    64,    64,    64,    65,    65,    65,    65,    65,
      65,    65,    66,    67,    68,    69,    69,    70,    71,    72,
      72,    72,    73,    73,    74,    74,    75,    75,    76,    76,
      77,    77,    78,    78,    79,    79,    80,    80,    81,    81,
      81,    82,    83,    83,    83,    83,    83
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     0,     1,     1,     1,     1,     1,
       1,     2,     4,     2,     1,     1,     1,     1,     1,     1,
       1,     2,     2,     1,     3,     2,     5,     4,     1,     1,
       1,     3,     4,     1,     1,     2,     4,     9,     5,     3,
       3,     3,     2,     1,     1,     1,     3,     3,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     3,     1,     1,
       1,     1,     2,     1,     2,     7,     5,     1,     5,     3,
       1,     0,     3,     3,     1,     1,     3,     1,     6,     4,
       1,     1,     5,     3,    10,     8,     1,     1,     3,     1,
       0,     1,     3,     3,     3,     3,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* Program: ProgramElementList  */
#line 159 "parser.yacc"
{  
  root = A_Program((yyvsp[0].programElementList));
  (yyval.program) = A_Program((yyvsp[0].programElementList));
}
#line 1281 "y.tab.cpp"
    break;

  case 3: /* ProgramElementList: ProgramElement ProgramElementList  */
#line 166 "parser.yacc"
{
  (yyval.programElementList) = A_ProgramElementList((yyvsp[-1].programElement), (yyvsp[0].programElementList));
}
#line 1289 "y.tab.cpp"
    break;

  case 4: /* ProgramElementList: %empty  */
#line 170 "parser.yacc"
{
  (yyval.programElementList) = nullptr;
}
#line 1297 "y.tab.cpp"
    break;

  case 5: /* ProgramElement: VarDeclStmt  */
#line 176 "parser.yacc"
{
  (yyval.programElement) = A_ProgramVarDeclStmt((yyvsp[0].varDeclStmt)->pos, (yyvsp[0].varDeclStmt));
}
#line 1305 "y.tab.cpp"
    break;

  case 6: /* ProgramElement: StructDef  */
#line 180 "parser.yacc"
{
  (yyval.programElement) = A_ProgramStructDef((yyvsp[0].structDef)->pos, (yyvsp[0].structDef));
}
#line 1313 "y.tab.cpp"
    break;

  case 7: /* ProgramElement: FnDeclStmt  */
#line 184 "parser.yacc"
{
  (yyval.programElement) = A_ProgramFnDeclStmt((yyvsp[0].fnDeclStmt)->pos, (yyvsp[0].fnDeclStmt));
}
#line 1321 "y.tab.cpp"
    break;

  case 8: /* ProgramElement: FnDef  */
#line 188 "parser.yacc"
{
  (yyval.programElement) = A_ProgramFnDef((yyvsp[0].fnDef)->pos, (yyvsp[0].fnDef));
}
#line 1329 "y.tab.cpp"
    break;

  case 9: /* ProgramElement: SEMICOLON  */
#line 192 "parser.yacc"
{
  (yyval.programElement) = A_ProgramNullStmt((yyvsp[0].pos));
}
#line 1337 "y.tab.cpp"
    break;

  case 10: /* Num: UNUM  */
#line 198 "parser.yacc"
{
  (yyval.tokenNum) = (yyvsp[0].tokenNum);
}
#line 1345 "y.tab.cpp"
    break;

  case 11: /* Num: SUB UNUM  */
#line 202 "parser.yacc"
{
  (yyval.tokenNum)->num = 0 - (yyvsp[0].tokenNum)->num; 
}
#line 1353 "y.tab.cpp"
    break;

  case 12: /* FnDef: FnDecl LBRACE CodeBlockStmtList RBRACE  */
#line 207 "parser.yacc"
{
  (yyval.fnDef) = A_FnDef((yyvsp[-3].fnDecl)->pos, (yyvsp[-3].fnDecl), (yyvsp[-1].codeBlockStmtList));
}
#line 1361 "y.tab.cpp"
    break;

  case 13: /* CodeBlockStmtList: CodeBlockStmt CodeBlockStmtList  */
#line 213 "parser.yacc"
{
  (yyval.codeBlockStmtList) = A_CodeBlockStmtList((yyvsp[-1].codeBlockStmt), (yyvsp[0].codeBlockStmtList));
}
#line 1369 "y.tab.cpp"
    break;

  case 14: /* CodeBlockStmtList: CodeBlockStmt  */
#line 217 "parser.yacc"
{
  (yyval.codeBlockStmtList) = A_CodeBlockStmtList((yyvsp[0].codeBlockStmt), nullptr);
}
#line 1377 "y.tab.cpp"
    break;

  case 15: /* CodeBlockStmt: VarDeclStmt  */
#line 223 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockVarDeclStmt((yyvsp[0].varDeclStmt)->pos, (yyvsp[0].varDeclStmt));
}
#line 1385 "y.tab.cpp"
    break;

  case 16: /* CodeBlockStmt: AssignStmt  */
#line 227 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockAssignStmt((yyvsp[0].assignStmt)->pos, (yyvsp[0].assignStmt));
}
#line 1393 "y.tab.cpp"
    break;

  case 17: /* CodeBlockStmt: CallStmt  */
#line 231 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockCallStmt((yyvsp[0].callStmt)->pos, (yyvsp[0].callStmt));
}
#line 1401 "y.tab.cpp"
    break;

  case 18: /* CodeBlockStmt: IfStmt  */
#line 235 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockIfStmt((yyvsp[0].ifStmt)->pos, (yyvsp[0].ifStmt));
}
#line 1409 "y.tab.cpp"
    break;

  case 19: /* CodeBlockStmt: WhileStmt  */
#line 239 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockWhileStmt((yyvsp[0].whileStmt)->pos, (yyvsp[0].whileStmt));
}
#line 1417 "y.tab.cpp"
    break;

  case 20: /* CodeBlockStmt: ReturnStmt  */
#line 243 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockReturnStmt((yyvsp[0].returnStmt)->pos, (yyvsp[0].returnStmt));
}
#line 1425 "y.tab.cpp"
    break;

  case 21: /* CodeBlockStmt: CONTINUE SEMICOLON  */
#line 247 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockContinueStmt((yyvsp[-1].pos));
}
#line 1433 "y.tab.cpp"
    break;

  case 22: /* CodeBlockStmt: BREAK SEMICOLON  */
#line 251 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockBreakStmt((yyvsp[-1].pos));
}
#line 1441 "y.tab.cpp"
    break;

  case 23: /* CodeBlockStmt: SEMICOLON  */
#line 255 "parser.yacc"
{
  (yyval.codeBlockStmt) = A_BlockNullStmt((yyvsp[0].pos));
}
#line 1449 "y.tab.cpp"
    break;

  case 24: /* ReturnStmt: RET RightVal SEMICOLON  */
#line 261 "parser.yacc"
{
  (yyval.returnStmt) = A_ReturnStmt((yyvsp[-2].pos), (yyvsp[-1].rightVal));
}
#line 1457 "y.tab.cpp"
    break;

  case 25: /* ReturnStmt: RET SEMICOLON  */
#line 265 "parser.yacc"
{
  (yyval.returnStmt) = A_ReturnStmt((yyvsp[-1].pos), nullptr);
}
#line 1465 "y.tab.cpp"
    break;

  case 26: /* WhileStmt: WHILE BoolUnit LBRACE CodeBlockStmtList RBRACE  */
#line 271 "parser.yacc"
{
  (yyval.whileStmt) = A_WhileStmt((yyvsp[-4].pos), (yyvsp[-3].boolUnit), (yyvsp[-1].codeBlockStmtList));
}
#line 1473 "y.tab.cpp"
    break;

  case 27: /* AssignStmt: LeftVal ASSIGN RightVal SEMICOLON  */
#line 277 "parser.yacc"
{
  (yyval.assignStmt) = A_AssignStmt((yyvsp[-3].leftVal)->pos, (yyvsp[-3].leftVal), (yyvsp[-1].rightVal));
}
#line 1481 "y.tab.cpp"
    break;

  case 28: /* LeftVal: ID  */
#line 283 "parser.yacc"
{
  (yyval.leftVal) = A_IdExprLVal((yyvsp[0].tokenId)->pos, (yyvsp[0].tokenId)->id);
}
#line 1489 "y.tab.cpp"
    break;

  case 29: /* LeftVal: ArrExpr  */
#line 287 "parser.yacc"
{
  (yyval.leftVal) = A_ArrExprLVal((yyvsp[0].arrayExpr)->pos, (yyvsp[0].arrayExpr));
}
#line 1497 "y.tab.cpp"
    break;

  case 30: /* LeftVal: MemberExpr  */
#line 291 "parser.yacc"
{
  (yyval.leftVal) = A_MemberExprLVal((yyvsp[0].memberExpr)->pos, (yyvsp[0].memberExpr));
}
#line 1505 "y.tab.cpp"
    break;

  case 31: /* MemberExpr: LeftVal DOT ID  */
#line 297 "parser.yacc"
{
  (yyval.memberExpr) = A_MemberExpr((yyvsp[-2].leftVal)->pos, (yyvsp[-2].leftVal), (yyvsp[0].tokenId)->id);
}
#line 1513 "y.tab.cpp"
    break;

  case 32: /* ArrExpr: LeftVal LBRACKET IndexExpr RBRACKET  */
#line 303 "parser.yacc"
{
  (yyval.arrayExpr) = A_ArrayExpr((yyvsp[-3].leftVal)->pos, (yyvsp[-3].leftVal), (yyvsp[-1].indexExpr));
}
#line 1521 "y.tab.cpp"
    break;

  case 33: /* IndexExpr: ID  */
#line 309 "parser.yacc"
{
  (yyval.indexExpr) = A_IdIndexExpr((yyvsp[0].tokenId)->pos, (yyvsp[0].tokenId)->id);
}
#line 1529 "y.tab.cpp"
    break;

  case 34: /* IndexExpr: Num  */
#line 313 "parser.yacc"
{
  (yyval.indexExpr) = A_NumIndexExpr((yyvsp[0].tokenNum)->pos, (yyvsp[0].tokenNum)->num);
}
#line 1537 "y.tab.cpp"
    break;

  case 35: /* CallStmt: FnCall SEMICOLON  */
#line 319 "parser.yacc"
{
  (yyval.callStmt) = A_CallStmt((yyvsp[-1].fnCall)->pos, (yyvsp[-1].fnCall));
}
#line 1545 "y.tab.cpp"
    break;

  case 36: /* FnCall: ID LPAREN RightValList RPAREN  */
#line 325 "parser.yacc"
{
  (yyval.fnCall) = A_FnCall((yyvsp[-3].tokenId)->pos, (yyvsp[-3].tokenId)->id, (yyvsp[-1].rightValList));
}
#line 1553 "y.tab.cpp"
    break;

  case 37: /* IfStmt: IF BoolUnit LBRACE CodeBlockStmtList RBRACE ELSE LBRACE CodeBlockStmtList RBRACE  */
#line 331 "parser.yacc"
{
  (yyval.ifStmt) = A_IfStmt((yyvsp[-8].pos), (yyvsp[-7].boolUnit), (yyvsp[-5].codeBlockStmtList), (yyvsp[-1].codeBlockStmtList));
}
#line 1561 "y.tab.cpp"
    break;

  case 38: /* IfStmt: IF BoolUnit LBRACE CodeBlockStmtList RBRACE  */
#line 335 "parser.yacc"
{
  (yyval.ifStmt) = A_IfStmt((yyvsp[-4].pos), (yyvsp[-3].boolUnit), (yyvsp[-1].codeBlockStmtList), nullptr);
}
#line 1569 "y.tab.cpp"
    break;

  case 39: /* BoolUnit: LPAREN ComExpr RPAREN  */
#line 342 "parser.yacc"
{
  (yyval.boolUnit) = A_ComExprUnit((yyvsp[-1].comExpr)->pos, (yyvsp[-1].comExpr));
}
#line 1577 "y.tab.cpp"
    break;

  case 40: /* BoolUnit: LPAREN BoolExpr RPAREN  */
#line 346 "parser.yacc"
{ 
  (yyval.boolUnit) = A_BoolExprUnit((yyvsp[-1].boolExpr)->pos, (yyvsp[-1].boolExpr));
}
#line 1585 "y.tab.cpp"
    break;

  case 41: /* BoolUnit: LPAREN BoolUOpExpr RPAREN  */
#line 350 "parser.yacc"
{
  (yyval.boolUnit) = A_BoolUOpExprUnit((yyvsp[-1].boolUOpExpr)->pos, (yyvsp[-1].boolUOpExpr));
}
#line 1593 "y.tab.cpp"
    break;

  case 42: /* BoolUOpExpr: BoolUOp BoolUnit  */
#line 356 "parser.yacc"
{
  (yyval.boolUOpExpr) = A_BoolUOpExpr((yyvsp[0].boolUnit)->pos, (yyvsp[-1].boolUOp), (yyvsp[0].boolUnit));
}
#line 1601 "y.tab.cpp"
    break;

  case 43: /* BoolUOp: NOT  */
#line 362 "parser.yacc"
{
  (yyval.boolUOp) = A_not;
}
#line 1609 "y.tab.cpp"
    break;

  case 44: /* BoolExpr: BoolBiOpExpr  */
#line 368 "parser.yacc"
{
  (yyval.boolExpr) = A_BoolBiOp_Expr((yyvsp[0].boolBiOpExpr)->pos, (yyvsp[0].boolBiOpExpr));
}
#line 1617 "y.tab.cpp"
    break;

  case 45: /* BoolExpr: BoolUnit  */
#line 372 "parser.yacc"
{
  (yyval.boolExpr) = A_BoolExpr((yyvsp[0].boolUnit)->pos, (yyvsp[0].boolUnit));
}
#line 1625 "y.tab.cpp"
    break;

  case 46: /* BoolBiOpExpr: BoolExpr AND BoolExpr  */
#line 378 "parser.yacc"
{
  (yyval.boolBiOpExpr) = A_BoolBiOpExpr((yyvsp[-2].boolExpr)->pos, A_and, (yyvsp[-2].boolExpr), (yyvsp[0].boolExpr));
}
#line 1633 "y.tab.cpp"
    break;

  case 47: /* BoolBiOpExpr: BoolExpr OR BoolExpr  */
#line 382 "parser.yacc"
{
  (yyval.boolBiOpExpr) = A_BoolBiOpExpr((yyvsp[-2].boolExpr)->pos, A_or, (yyvsp[-2].boolExpr), (yyvsp[0].boolExpr));
}
#line 1641 "y.tab.cpp"
    break;

  case 48: /* ComExpr: ExprUnit ComOp ExprUnit  */
#line 388 "parser.yacc"
{
  (yyval.comExpr) = A_ComExpr((yyvsp[-2].exprUnit)->pos, (yyvsp[-1].comOp), (yyvsp[-2].exprUnit), (yyvsp[0].exprUnit));
}
#line 1649 "y.tab.cpp"
    break;

  case 49: /* ComOp: LT  */
#line 394 "parser.yacc"
{
  (yyval.comOp) = A_lt;
}
#line 1657 "y.tab.cpp"
    break;

  case 50: /* ComOp: LE  */
#line 398 "parser.yacc"
{
  (yyval.comOp) = A_le;
}
#line 1665 "y.tab.cpp"
    break;

  case 51: /* ComOp: GT  */
#line 402 "parser.yacc"
{
  (yyval.comOp) = A_gt;
}
#line 1673 "y.tab.cpp"
    break;

  case 52: /* ComOp: GE  */
#line 406 "parser.yacc"
{
  (yyval.comOp) = A_ge;
}
#line 1681 "y.tab.cpp"
    break;

  case 53: /* ComOp: EQ  */
#line 410 "parser.yacc"
{
  (yyval.comOp) = A_eq;
}
#line 1689 "y.tab.cpp"
    break;

  case 54: /* ComOp: NEQ  */
#line 414 "parser.yacc"
{
  (yyval.comOp) = A_ne;
}
#line 1697 "y.tab.cpp"
    break;

  case 55: /* ExprUnit: Num  */
#line 420 "parser.yacc"
{
  (yyval.exprUnit) = A_NumExprUnit((yyvsp[0].tokenNum)->pos, (yyvsp[0].tokenNum)->num);
}
#line 1705 "y.tab.cpp"
    break;

  case 56: /* ExprUnit: ID  */
#line 424 "parser.yacc"
{
  (yyval.exprUnit) = A_IdExprUnit((yyvsp[0].tokenId)->pos, (yyvsp[0].tokenId)->id);
}
#line 1713 "y.tab.cpp"
    break;

  case 57: /* ExprUnit: LPAREN ArithExpr RPAREN  */
#line 428 "parser.yacc"
{
  (yyval.exprUnit) = A_ArithExprUnit((yyvsp[-1].arithExpr)->pos, (yyvsp[-1].arithExpr));
}
#line 1721 "y.tab.cpp"
    break;

  case 58: /* ExprUnit: FnCall  */
#line 432 "parser.yacc"
{
  (yyval.exprUnit) = A_CallExprUnit((yyvsp[0].fnCall)->pos, (yyvsp[0].fnCall));
}
#line 1729 "y.tab.cpp"
    break;

  case 59: /* ExprUnit: ArrExpr  */
#line 436 "parser.yacc"
{
  (yyval.exprUnit) = A_ArrayExprUnit((yyvsp[0].arrayExpr)->pos, (yyvsp[0].arrayExpr));
}
#line 1737 "y.tab.cpp"
    break;

  case 60: /* ExprUnit: MemberExpr  */
#line 440 "parser.yacc"
{
  (yyval.exprUnit) = A_MemberExprUnit((yyvsp[0].memberExpr)->pos, (yyvsp[0].memberExpr));
}
#line 1745 "y.tab.cpp"
    break;

  case 61: /* ExprUnit: ArithUExpr  */
#line 444 "parser.yacc"
{
  (yyval.exprUnit) = A_ArithUExprUnit((yyvsp[0].arithUExpr)->pos, (yyvsp[0].arithUExpr));
}
#line 1753 "y.tab.cpp"
    break;

  case 62: /* ArithUExpr: ArithUOp ExprUnit  */
#line 450 "parser.yacc"
{
  (yyval.arithUExpr) = A_ArithUExpr((yyvsp[0].exprUnit)->pos, (yyvsp[-1].arithUOp), (yyvsp[0].exprUnit));
}
#line 1761 "y.tab.cpp"
    break;

  case 63: /* ArithUOp: SUB  */
#line 456 "parser.yacc"
{
  (yyval.arithUOp) = A_neg;
}
#line 1769 "y.tab.cpp"
    break;

  case 64: /* FnDeclStmt: FnDecl SEMICOLON  */
#line 461 "parser.yacc"
{
  (yyval.fnDeclStmt) = A_FnDeclStmt((yyvsp[-1].fnDecl)->pos, (yyvsp[-1].fnDecl));
}
#line 1777 "y.tab.cpp"
    break;

  case 65: /* FnDecl: FN ID LPAREN ParamDecl RPAREN POINT Type  */
#line 467 "parser.yacc"
{
  (yyval.fnDecl) = A_FnDecl((yyvsp[-6].pos), (yyvsp[-5].tokenId)->id, (yyvsp[-3].paramDecl), (yyvsp[0].type));
}
#line 1785 "y.tab.cpp"
    break;

  case 66: /* FnDecl: FN ID LPAREN ParamDecl RPAREN  */
#line 471 "parser.yacc"
{
  (yyval.fnDecl) = A_FnDecl((yyvsp[-4].pos), (yyvsp[-3].tokenId)->id, (yyvsp[-1].paramDecl), nullptr);
}
#line 1793 "y.tab.cpp"
    break;

  case 67: /* ParamDecl: VarDecls  */
#line 477 "parser.yacc"
{
  (yyval.paramDecl) = A_ParamDecl((yyvsp[0].varDecls));
}
#line 1801 "y.tab.cpp"
    break;

  case 68: /* StructDef: STRUCT ID LBRACE VarDecls RBRACE  */
#line 483 "parser.yacc"
{
  (yyval.structDef) = A_StructDef((yyvsp[-4].pos), (yyvsp[-3].tokenId)->id, (yyvsp[-1].varDecls));
}
#line 1809 "y.tab.cpp"
    break;

  case 69: /* VarDecls: VarDecl COMMA VarDecls  */
#line 489 "parser.yacc"
{
  (yyval.varDecls) = A_VarDeclList((yyvsp[-2].varDecl), (yyvsp[0].varDecls));
}
#line 1817 "y.tab.cpp"
    break;

  case 70: /* VarDecls: VarDecl  */
#line 493 "parser.yacc"
{
  (yyval.varDecls) = A_VarDeclList((yyvsp[0].varDecl),nullptr);
}
#line 1825 "y.tab.cpp"
    break;

  case 71: /* VarDecls: %empty  */
#line 497 "parser.yacc"
{
  (yyval.varDecls) = nullptr;
}
#line 1833 "y.tab.cpp"
    break;

  case 72: /* VarDeclStmt: LET VarDecl SEMICOLON  */
#line 503 "parser.yacc"
{
  (yyval.varDeclStmt) = A_VarDeclStmt((yyvsp[-2].pos), (yyvsp[-1].varDecl));
}
#line 1841 "y.tab.cpp"
    break;

  case 73: /* VarDeclStmt: LET VarDef SEMICOLON  */
#line 507 "parser.yacc"
{
  (yyval.varDeclStmt) = A_VarDefStmt((yyvsp[-2].pos), (yyvsp[-1].varDef));
}
#line 1849 "y.tab.cpp"
    break;

  case 74: /* VarDecl: VarDeclScalar  */
#line 513 "parser.yacc"
{
  (yyval.varDecl) = A_VarDecl_Scalar((yyvsp[0].varDeclScalar)->pos, (yyvsp[0].varDeclScalar));
}
#line 1857 "y.tab.cpp"
    break;

  case 75: /* VarDecl: VarDeclArray  */
#line 516 "parser.yacc"
              {
  (yyval.varDecl) = A_VarDecl_Array((yyvsp[0].varDeclArray)->pos, (yyvsp[0].varDeclArray));
}
#line 1865 "y.tab.cpp"
    break;

  case 76: /* VarDeclScalar: ID COLON Type  */
#line 522 "parser.yacc"
{
  (yyval.varDeclScalar) = A_VarDeclScalar((yyvsp[-2].tokenId)->pos, (yyvsp[-2].tokenId)->id, (yyvsp[0].type));
}
#line 1873 "y.tab.cpp"
    break;

  case 77: /* VarDeclScalar: ID  */
#line 526 "parser.yacc"
{
  (yyval.varDeclScalar) = A_VarDeclScalar((yyvsp[0].tokenId)->pos, (yyvsp[0].tokenId)->id, nullptr);
}
#line 1881 "y.tab.cpp"
    break;

  case 78: /* VarDeclArray: ID LBRACKET Num RBRACKET COLON Type  */
#line 532 "parser.yacc"
{
  (yyval.varDeclArray) = A_VarDeclArray((yyvsp[-5].tokenId)->pos, (yyvsp[-5].tokenId)->id, (yyvsp[-3].tokenNum)->num, (yyvsp[0].type));
}
#line 1889 "y.tab.cpp"
    break;

  case 79: /* VarDeclArray: ID LBRACKET Num RBRACKET  */
#line 536 "parser.yacc"
{
  (yyval.varDeclArray) = A_VarDeclArray((yyvsp[-3].tokenId)->pos, (yyvsp[-3].tokenId)->id, (yyvsp[-1].tokenNum)->num, nullptr);
}
#line 1897 "y.tab.cpp"
    break;

  case 80: /* VarDef: VarDefScalar  */
#line 542 "parser.yacc"
{
  (yyval.varDef) = A_VarDef_Scalar((yyvsp[0].varDefScalar)->pos, (yyvsp[0].varDefScalar));
}
#line 1905 "y.tab.cpp"
    break;

  case 81: /* VarDef: VarDefArray  */
#line 546 "parser.yacc"
{
  (yyval.varDef) = A_VarDef_Array((yyvsp[0].varDefArray)->pos, (yyvsp[0].varDefArray));
}
#line 1913 "y.tab.cpp"
    break;

  case 82: /* VarDefScalar: ID COLON Type ASSIGN RightVal  */
#line 552 "parser.yacc"
{
  (yyval.varDefScalar) = A_VarDefScalar((yyvsp[-4].tokenId)->pos, (yyvsp[-4].tokenId)->id, (yyvsp[-2].type), (yyvsp[0].rightVal));
}
#line 1921 "y.tab.cpp"
    break;

  case 83: /* VarDefScalar: ID ASSIGN RightVal  */
#line 556 "parser.yacc"
{
  (yyval.varDefScalar) = A_VarDefScalar((yyvsp[-2].tokenId)->pos, (yyvsp[-2].tokenId)->id, nullptr, (yyvsp[0].rightVal));
}
#line 1929 "y.tab.cpp"
    break;

  case 84: /* VarDefArray: ID LBRACKET Num RBRACKET COLON Type ASSIGN LBRACE RightValList RBRACE  */
#line 562 "parser.yacc"
{
  (yyval.varDefArray) = A_VarDefArray((yyvsp[-9].tokenId)->pos, (yyvsp[-9].tokenId)->id, (yyvsp[-7].tokenNum)->num, (yyvsp[-4].type), (yyvsp[-1].rightValList));
}
#line 1937 "y.tab.cpp"
    break;

  case 85: /* VarDefArray: ID LBRACKET Num RBRACKET ASSIGN LBRACE RightValList RBRACE  */
#line 566 "parser.yacc"
{
  (yyval.varDefArray) = A_VarDefArray((yyvsp[-7].tokenId)->pos, (yyvsp[-7].tokenId)->id, (yyvsp[-5].tokenNum)->num, nullptr, (yyvsp[-1].rightValList));
}
#line 1945 "y.tab.cpp"
    break;

  case 86: /* Type: INT  */
#line 572 "parser.yacc"
{
  (yyval.type) = A_NativeType((yyvsp[0].type)->pos, A_intTypeKind);
}
#line 1953 "y.tab.cpp"
    break;

  case 87: /* Type: ID  */
#line 576 "parser.yacc"
{
  (yyval.type) = A_StructType((yyvsp[0].tokenId)->pos, (yyvsp[0].tokenId)->id);
}
#line 1961 "y.tab.cpp"
    break;

  case 88: /* RightValList: RightVal COMMA RightValList  */
#line 582 "parser.yacc"
{
  (yyval.rightValList) = A_RightValList((yyvsp[-2].rightVal), (yyvsp[0].rightValList));
}
#line 1969 "y.tab.cpp"
    break;

  case 89: /* RightValList: RightVal  */
#line 586 "parser.yacc"
{
  (yyval.rightValList) = A_RightValList((yyvsp[0].rightVal), nullptr);
}
#line 1977 "y.tab.cpp"
    break;

  case 90: /* RightValList: %empty  */
#line 590 "parser.yacc"
{
  (yyval.rightValList) = nullptr;
}
#line 1985 "y.tab.cpp"
    break;

  case 91: /* RightVal: ArithExpr  */
#line 597 "parser.yacc"
{
  (yyval.rightVal) = A_ArithExprRVal((yyvsp[0].arithExpr)->pos, (yyvsp[0].arithExpr));
}
#line 1993 "y.tab.cpp"
    break;

  case 92: /* ArithExpr: ArithExpr ADD ArithExpr  */
#line 603 "parser.yacc"
{
  (yyval.arithExpr) = A_ArithBiOp_Expr((yyvsp[-2].arithExpr)->pos, A_ArithBiOpExpr((yyvsp[-2].arithExpr)->pos, A_add, (yyvsp[-2].arithExpr), (yyvsp[0].arithExpr)));
}
#line 2001 "y.tab.cpp"
    break;

  case 93: /* ArithExpr: ArithExpr SUB ArithExpr  */
#line 607 "parser.yacc"
{
  (yyval.arithExpr) = A_ArithBiOp_Expr((yyvsp[-2].arithExpr)->pos, A_ArithBiOpExpr((yyvsp[-2].arithExpr)->pos, A_sub, (yyvsp[-2].arithExpr), (yyvsp[0].arithExpr)));
}
#line 2009 "y.tab.cpp"
    break;

  case 94: /* ArithExpr: ArithExpr MUL ArithExpr  */
#line 611 "parser.yacc"
{
  (yyval.arithExpr) = A_ArithBiOp_Expr((yyvsp[-2].arithExpr)->pos, A_ArithBiOpExpr((yyvsp[-2].arithExpr)->pos, A_mul, (yyvsp[-2].arithExpr), (yyvsp[0].arithExpr)));
}
#line 2017 "y.tab.cpp"
    break;

  case 95: /* ArithExpr: ArithExpr DIV ArithExpr  */
#line 615 "parser.yacc"
{
  (yyval.arithExpr) = A_ArithBiOp_Expr((yyvsp[-2].arithExpr)->pos, A_ArithBiOpExpr((yyvsp[-2].arithExpr)->pos, A_div, (yyvsp[-2].arithExpr), (yyvsp[0].arithExpr)));
}
#line 2025 "y.tab.cpp"
    break;

  case 96: /* ArithExpr: ExprUnit  */
#line 619 "parser.yacc"
{
  (yyval.arithExpr) = A_ExprUnit((yyvsp[0].exprUnit)->pos, (yyvsp[0].exprUnit));
}
#line 2033 "y.tab.cpp"
    break;


#line 2037 "y.tab.cpp"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 624 "parser.yacc"


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


