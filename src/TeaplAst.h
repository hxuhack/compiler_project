#pragma once

typedef struct A_pos_* A_pos; //position information
typedef struct A_type_* A_type;
typedef struct A_varDecl_* A_varDecl;
typedef struct A_varDef_* A_varDef;
typedef struct A_rightVal_* A_rightVal;
typedef struct A_arithExpr_* A_arithExpr;
typedef struct A_boolExpr_* A_boolExpr;
typedef struct A_arithBiOpExpr_* A_arithBiOpExpr;
typedef struct A_arithUExpr_* A_arithUExpr;
typedef struct A_exprUnit_* A_exprUnit;
typedef struct A_fnCall_* A_fnCall;
typedef struct A_indexExpr_* A_indexExpr;
typedef struct A_arrayExpr_* A_arrayExpr;
typedef struct A_memberExpr_* A_memberExpr;
typedef struct A_boolUnit_* A_boolUnit;
typedef struct A_boolBiOpExpr_* A_boolBiOpExpr;
typedef struct A_boolUOpExpr_* A_boolUOpExpr;
typedef struct A_comExpr_* A_comExpr;
typedef struct A_rightVal_* A_rightVal;
typedef struct A_leftVal_* A_leftVal;
typedef struct A_assignStmt_* A_assignStmt;
typedef struct A_rightValList_* A_rightValList;
typedef struct A_varDefScalar_* A_varDefScalar;
typedef struct A_varDefArray_* A_varDefArray;
typedef struct A_varDeclScalar_* A_varDeclScalar;
typedef struct A_varDeclArray_* A_varDeclArray;
typedef struct A_varDecl_* A_varDecl;
typedef struct A_varDef_* A_varDef;
typedef struct A_varDeclStmt_* A_varDeclStmt;
typedef struct A_varDeclList_* A_varDeclList;
typedef struct A_structDef_* A_structDef;
typedef struct A_paramDecl_* A_paramDecl;
typedef struct A_fnDecl_* A_fnDecl;
typedef struct A_fnDef_* A_fnDef;
typedef struct A_codeBlockStmt_* A_codeBlockStmt;
typedef struct A_ifStmt_* A_ifStmt;
typedef struct A_whileStmt_* A_whileStmt;
typedef struct A_fnDeclStmt_* A_fnDeclStmt;
typedef struct A_callStmt_* A_callStmt;
typedef struct A_returnStmt_* A_returnStmt;
typedef struct A_programElement_* A_programElement;
typedef struct A_codeBlockStmtList_* A_codeBlockStmtList;
typedef struct A_programElementList_* A_programElementList;
typedef struct A_program_* A_program;
typedef struct A_tokenId_* A_tokenId;
typedef struct A_tokenNum_* A_tokenNum;

struct A_pos_ {
    int line, col;
};

typedef enum {
    A_nativeTypeKind,
    A_structTypeKind
} A_dataType;

typedef enum {
    A_intTypeKind
} A_nativeType;

struct A_type_ {
    A_pos pos;
    A_dataType type;
    union {
        A_nativeType nativeType;
        char* structType;
    } u;
};

struct A_rightValList_ {
    A_rightVal head;
    A_rightValList tail;
};

struct A_fnCall_ {
    A_pos pos;
    char* fn;
    A_rightValList vals;
};

typedef enum {
    A_numIndexKind,
    A_idIndexKind
} A_indexExprKind;

// [id|num]
struct A_indexExpr_ {
    A_pos pos;
    A_indexExprKind kind;
    union {
        int num;
        char* id;
    } u;
};

// arr[idx]
struct A_arrayExpr_ {
    A_pos pos;
    A_leftVal arr;
    A_indexExpr idx;
};

// structId.memberId
struct A_memberExpr_ {
    A_pos pos;
    A_leftVal structId;
    char* memberId;
};

typedef enum {
    A_numExprKind,
    A_idExprKind,
    A_arithExprKind,
    A_fnCallKind,
    A_arrayExprKind,
    A_memberExprKind,
    A_arithUExprKind
} A_exprUnitType;

struct A_exprUnit_ {
    A_pos pos;
    A_exprUnitType kind;
    union {
        int num;
        char* id;
        A_arithExpr arithExpr;
        A_fnCall callExpr;
        A_arrayExpr arrayExpr;
        A_memberExpr memberExpr;
        A_arithUExpr arithUExpr;
    } u;
};

typedef enum {
    A_neg
} A_arithUOp;

typedef enum {
    A_add,
    A_sub,
    A_mul,
    A_div
} A_arithBiOp;

typedef enum {
    A_not
} A_boolUOp;

typedef enum {
    A_and,
    A_or
} A_boolBiOp;

typedef enum {
    A_lt, // less than
    A_le, // less equal
    A_gt,
    A_ge,
    A_eq,
    A_ne
} A_comOp;

typedef enum {
    A_arithBiOpExprKind,
    A_exprUnitKind
} A_arithExprType;

typedef enum {
    A_boolBiOpExprKind,
    A_boolUnitKind
} A_boolExprType;

typedef enum {
    A_comOpExprKind,
    A_boolExprKind,
    A_boolUOpExprKind
} A_boolUnitType;

typedef enum {
    A_arithExprValKind,
    A_boolExprValKind
} A_rightValType;

typedef enum {
    A_varValKind,
    A_arrValKind,
    A_memberValKind
} A_leftValType;

typedef enum {
    A_varDeclKind,
    A_varDefKind
} A_varDeclStmtType;

typedef enum {
    A_varDeclScalarKind,
    A_varDeclArrayKind
} A_varDeclType;

typedef enum {
    A_varDefScalarKind,
    A_varDefArrayKind
} A_varDefType;

typedef enum {
    A_programNullStmtKind,
    A_programVarDeclStmtKind,
    A_programStructDefKind,
    A_programFnDeclStmtKind,
    A_programFnDefKind
} A_programElementType;

// left op right (eg: 1+2)
struct A_arithBiOpExpr_ {
    A_pos pos;
    A_arithBiOp op;
    A_arithExpr left, right;
};

// op expr (eg: -1)
struct A_arithUExpr_ {
    A_pos pos;
    A_arithUOp op;
    A_exprUnit expr;
};

struct A_arithExpr_ {
    A_pos pos;
    A_arithExprType kind;
    union {
        A_arithBiOpExpr arithBiOpExpr;
        A_exprUnit exprUnit;
    } u;
};

// left op right (eg: a && b)
struct A_boolBiOpExpr_ {
    A_pos pos;
    A_boolBiOp op;
    A_boolExpr left;
    A_boolExpr right;
};

// op cond (eg: !a)
struct A_boolUOpExpr_ {
    A_pos pos;
    A_boolUOp op;
    A_boolUnit cond;
};

struct A_boolExpr_ {
    A_pos pos;
    A_boolExprType kind;
    union {
        A_boolBiOpExpr boolBiOpExpr;
        A_boolUnit boolUnit;
    } u;
};

// left op right (eg: 1 < 2)
struct A_comExpr_ {
    A_pos pos;
    A_comOp op;
    A_exprUnit left, right;
};

struct A_boolUnit_ {
    A_pos pos;
    A_boolUnitType kind;
    union {
        A_comExpr comExpr;
        A_boolExpr boolExpr;
        A_boolUOpExpr boolUOpExpr;
    } u;
};

struct A_rightVal_ {
    A_pos pos;
    A_rightValType kind;
    union {
        A_arithExpr arithExpr;
        A_boolExpr boolExpr;
    } u;
};

struct A_leftVal_ {
    A_pos pos;
    A_leftValType kind;
    union {
        char* id;
        A_arrayExpr arrExpr;
        A_memberExpr memberExpr;
    } u;
};

struct A_assignStmt_ {
    A_pos pos;
    A_leftVal leftVal;
    A_rightVal rightVal;
};

// id:type (eg: a:int)
struct A_varDeclScalar_ {
    A_pos pos;
    char* id;
    A_type type;
};

// id[len]:type (eg: a[10]:int)
struct A_varDeclArray_ {
    A_pos pos;
    char* id;
    int len;
    A_type type;
};

struct A_varDecl_ {
    A_pos pos;
    A_varDeclType kind;
    union {
        A_varDeclScalar declScalar;
        A_varDeclArray declArray;
    } u;
};

// id:type = val (eg: a:int = 10)
struct A_varDefScalar_ {
    A_pos pos;
    char* id;
    A_type type;
    A_rightVal val;
};

// id[len]:type = {vals} (eg: a[10]:int = {1, 2})
struct A_varDefArray_ {
    A_pos pos;
    char* id;
    int len;
    A_type type;
    A_rightValList vals;
};

struct A_varDef_ {
    A_pos pos;
    A_varDefType kind;
    union {
        A_varDefScalar defScalar;
        A_varDefArray defArray;
    } u;
};

struct A_varDeclStmt_ {
    A_pos pos;
    A_varDeclStmtType kind;
    union {
        A_varDecl varDecl;
        A_varDef varDef;
    } u;
};

struct A_varDeclList_ {
    A_varDecl head;
    A_varDeclList tail;
};

struct A_structDef_ {
    A_pos pos;
    char* id;
    A_varDeclList varDecls;
};

struct A_fnDecl_ {
    A_pos pos;
    char* id;
    A_paramDecl paramDecl;
    A_type type;
};

struct A_paramDecl_ {
    A_varDeclList varDecls;
};

struct A_fnDef_ {
    A_pos pos;
    A_fnDecl fnDecl;
    A_codeBlockStmtList stmts;
};

// if(boolExpr){
//     ifStmts
// }else{
//     elseStmts
// }
struct A_ifStmt_ {
    A_pos pos;
    A_boolExpr boolExpr;
    A_codeBlockStmtList ifStmts, elseStmts;
};

// while(boolExpr){
//     whileStmts
// }
struct A_whileStmt_ {
    A_pos pos;
    A_boolExpr boolExpr;
    A_codeBlockStmtList whileStmts;
};

struct A_callStmt_ {
    A_pos pos;
    A_fnCall fnCall;
};

struct A_returnStmt_ {
    A_pos pos;
    A_rightVal retVal;
};

typedef enum {
    A_nullStmtKind,
    A_varDeclStmtKind,
    A_assignStmtKind,
    A_callStmtKind,
    A_ifStmtKind,
    A_whileStmtKind,
    A_returnStmtKind,
    A_continueStmtKind,
    A_breakStmtKind
} A_codeBlockStmtType;

struct A_codeBlockStmt_ {
    A_pos pos;
    A_codeBlockStmtType kind;
    union {
        A_varDeclStmt varDeclStmt;
        A_assignStmt assignStmt;
        A_callStmt callStmt;
        A_ifStmt ifStmt;
        A_whileStmt whileStmt;
        A_returnStmt returnStmt;
        // continue and break do not need other info
    } u;
};

struct A_codeBlockStmtList_ {
    A_codeBlockStmt head;
    A_codeBlockStmtList tail;
};

struct A_fnDeclStmt_ {
    A_pos pos;
    A_fnDecl fnDecl;
};

// programElement = varDeclStmt | structDef | fnDeclStmt | fnDef | comment | < ; >
struct A_programElement_ {
    A_pos pos;
    A_programElementType kind;
    union {
        A_varDeclStmt varDeclStmt;
        A_structDef structDef;
        A_fnDeclStmt fnDeclStmt;
        A_fnDef fnDef;
    } u;
};

// programElementList := programElement*
struct A_programElementList_ {
    A_programElement head;
    A_programElementList tail;
};

// program := programElementList
struct A_program_ {
    A_programElementList programElements;
};

struct A_tokenId_ {
    A_pos pos;
    char* id;
};

struct A_tokenNum_ {
    A_pos pos;
    int num;
};

A_pos A_Pos(int, int);
A_tokenId A_TokenId(A_pos, char*);
A_tokenNum A_TokenNum(A_pos, int);
A_type A_NativeType(A_pos pos, A_nativeType ntype);
A_type A_StructType(A_pos pos, char* stype);
A_rightValList A_RightValList(A_rightVal head, A_rightValList tail);
A_fnCall A_FnCall(A_pos pos, char* fn, A_rightValList vals);
A_indexExpr A_NumIndexExpr(A_pos pos, int num);
A_indexExpr A_IdIndexExpr(A_pos pos, char* id);
A_arrayExpr A_ArrayExpr(A_pos pos, A_leftVal arr, A_indexExpr idx);
A_memberExpr A_MemberExpr(A_pos pos, A_leftVal structId, char* memberId);
A_exprUnit A_NumExprUnit(A_pos pos, int num);
A_exprUnit A_IdExprUnit(A_pos pos, char* id);
A_exprUnit A_ArithExprUnit(A_pos pos, A_arithExpr arithExpr);
A_exprUnit A_CallExprUnit(A_pos pos, A_fnCall callExpr);
A_exprUnit A_ArrayExprUnit(A_pos pos, A_arrayExpr arrayExpr);
A_exprUnit A_MemberExprUnit(A_pos pos, A_memberExpr memberExpr);
A_exprUnit A_ArithUExprUnit(A_pos pos, A_arithUExpr arithUExpr);
A_arithBiOpExpr A_ArithBiOpExpr(A_pos pos, A_arithBiOp op, A_arithExpr left, A_arithExpr right);
A_arithUExpr A_ArithUExpr(A_pos pos, A_arithUOp op, A_exprUnit expr);
A_arithExpr A_ArithBiOp_Expr(A_pos pos, A_arithBiOpExpr arithBiOpExpr);
A_arithExpr A_ExprUnit(A_pos pos, A_exprUnit exprUnit);
A_boolBiOpExpr A_BoolBiOpExpr(A_pos pos, A_boolBiOp op, A_boolExpr left, A_boolExpr right);
A_boolUOpExpr A_BoolUOpExpr(A_pos pos, A_boolUOp op, A_boolUnit cond);
A_boolExpr A_BoolBiOp_Expr(A_pos pos, A_boolBiOpExpr boolBiOpExpr);
A_boolExpr A_BoolExpr(A_pos pos, A_boolUnit boolUnit);
A_comExpr A_ComExpr(A_pos pos, A_comOp op, A_exprUnit left, A_exprUnit right);
A_boolUnit A_ComExprUnit(A_pos pos, A_comExpr comExpr);
A_boolUnit A_BoolExprUnit(A_pos pos, A_boolExpr boolExpr);
A_boolUnit A_BoolUOpExprUnit(A_pos pos, A_boolUOpExpr boolUOpExpr);
A_rightVal A_ArithExprRVal(A_pos pos, A_arithExpr arithExpr);
A_rightVal A_BoolExprRVal(A_pos pos, A_boolExpr boolExpr);
A_leftVal A_IdExprLVal(A_pos pos, char* id);
A_leftVal A_ArrExprLVal(A_pos pos, A_arrayExpr arrExpr);
A_leftVal A_MemberExprLVal(A_pos pos, A_memberExpr memberExpr);
A_assignStmt A_AssignStmt(A_pos pos, A_leftVal leftVal, A_rightVal rightVal);
A_varDeclScalar A_VarDeclScalar(A_pos pos, char* id, A_type type);
A_varDeclArray A_VarDeclArray(A_pos pos, char* id, int len, A_type type);
A_varDecl A_VarDecl_Scalar(A_pos pos, A_varDeclScalar declScalar);
A_varDecl A_VarDecl_Array(A_pos pos, A_varDeclArray declArray);
A_varDefScalar A_VarDefScalar(A_pos pos, char* id, A_type type, A_rightVal val);
A_varDefArray A_VarDefArray(A_pos pos, char* id, int len, A_type type, A_rightValList vals);
A_varDef A_VarDef_Scalar(A_pos pos, A_varDefScalar defScalar);
A_varDef A_VarDef_Array(A_pos pos, A_varDefArray defArray);
A_varDeclStmt A_VarDeclStmt(A_pos pos, A_varDecl varDecl);
A_varDeclStmt A_VarDefStmt(A_pos pos, A_varDef varDef);
A_varDeclList A_VarDeclList(A_varDecl head, A_varDeclList tail);
A_structDef A_StructDef(A_pos pos, char* id, A_varDeclList varDecls);
A_fnDecl A_FnDecl(A_pos pos, char* id, A_paramDecl paramDecl, A_type type);
A_paramDecl A_ParamDecl(A_varDeclList varDecls);
A_codeBlockStmtList A_CodeBlockStmtList(A_codeBlockStmt head, A_codeBlockStmtList tail);
A_fnDef A_FnDef(A_pos pos, A_fnDecl fnDecl, A_codeBlockStmtList stmts);
A_ifStmt A_IfStmt(A_pos pos, A_boolExpr boolExpr, A_codeBlockStmtList ifStmts, A_codeBlockStmtList elseStmts);
A_whileStmt A_WhileStmt(A_pos pos, A_boolExpr boolExpr, A_codeBlockStmtList whileStmts);
A_callStmt A_CallStmt(A_pos pos, A_fnCall fnCall);
A_returnStmt A_ReturnStmt(A_pos pos, A_rightVal retVal);
A_codeBlockStmt A_BlockNullStmt(A_pos pos);
A_codeBlockStmt A_BlockVarDeclStmt(A_pos pos, A_varDeclStmt varDeclStmt);
A_codeBlockStmt A_BlockAssignStmt(A_pos pos, A_assignStmt assignStmt);
A_codeBlockStmt A_BlockCallStmt(A_pos pos, A_callStmt callStmt);
A_codeBlockStmt A_BlockIfStmt(A_pos pos, A_ifStmt ifStmt);
A_codeBlockStmt A_BlockWhileStmt(A_pos pos, A_whileStmt whileStmt);
A_codeBlockStmt A_BlockReturnStmt(A_pos pos, A_returnStmt returnStmt);
A_codeBlockStmt A_BlockContinueStmt(A_pos pos);
A_codeBlockStmt A_BlockBreakStmt(A_pos pos);
A_fnDeclStmt A_FnDeclStmt(A_pos pos, A_fnDecl fnDecl);
A_programElement A_ProgramNullStmt(A_pos pos);
A_programElement A_ProgramVarDeclStmt(A_pos pos, A_varDeclStmt varDeclStmt);
A_programElement A_ProgramStructDef(A_pos pos, A_structDef structDef);
A_programElement A_ProgramFnDeclStmt(A_pos pos, A_fnDeclStmt fnDecl);
A_programElement A_ProgramFnDef(A_pos pos, A_fnDef fnDef);
A_programElementList A_ProgramElementList(A_programElement head, A_programElementList tail);
A_program A_Program(A_programElementList programElements);

