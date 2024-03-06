#pragma once

#include "TeaplAst.h"
#include <string>
#include <vector>

using std::string;
using std::vector;

typedef struct aA_type_* aA_type;
typedef struct aA_varDecl_* aA_varDecl;
typedef struct aA_varDef_* aA_varDef;
typedef struct aA_rightVal_* aA_rightVal;
typedef struct aA_arithExpr_* aA_arithExpr;
typedef struct aA_boolExpr_* aA_boolExpr;
typedef struct aA_arithBiOpExpr_* aA_arithBiOpExpr;
typedef struct aA_arithUExpr_* aA_arithUExpr;
typedef struct aA_exprUnit_* aA_exprUnit;
typedef struct aA_fnCall_* aA_fnCall;
typedef struct aA_indexExpr_* aA_indexExpr;
typedef struct aA_arrayExpr_* aA_arrayExpr;
typedef struct aA_memberExpr_* aA_memberExpr;
typedef struct aA_boolUnit_* aA_boolUnit;
typedef struct aA_boolBiOpExpr_* aA_boolBiOpExpr;
typedef struct aA_boolUOpExpr_* aA_boolUOpExpr;
typedef struct aA_comExpr_* aA_comExpr;
typedef struct aA_rightVal_* aA_rightVal;
typedef struct aA_leftVal_* aA_leftVal;
typedef struct aA_assignStmt_* aA_assignStmt;
typedef struct aA_varDefScalar_* aA_varDefScalar;
typedef struct aA_varDefArray_* aA_varDefArray;
typedef struct aA_varDeclScalar_* aA_varDeclScalar;
typedef struct aA_varDeclArray_* aA_varDeclArray;
typedef struct aA_varDecl_* aA_varDecl;
typedef struct aA_varDef_* aA_varDef;
typedef struct aA_varDeclStmt_* aA_varDeclStmt;
typedef struct aA_structDef_* aA_structDef;
typedef struct aA_paramDecl_* aA_paramDecl;
typedef struct aA_fnDecl_* aA_fnDecl;
typedef struct aA_fnDef_* aA_fnDef;
typedef struct aA_codeBlockStmt_* aA_codeBlockStmt;
typedef struct aA_ifStmt_* aA_ifStmt;
typedef struct aA_whileStmt_* aA_whileStmt;
typedef struct aA_fnDeclStmt_* aA_fnDeclStmt;
typedef struct aA_callStmt_* aA_callStmt;
typedef struct aA_returnStmt_* aA_returnStmt;
typedef struct aA_programElement_* aA_programElement;
typedef struct aA_program_* aA_program;

struct aA_type_ {
    A_pos pos;
    A_dataType type;
    union {
        A_nativeType nativeType;
        string* structType;
    } u;
};

struct aA_fnCall_ {
    A_pos pos;
    string* fn;
    vector<aA_rightVal> vals;
};

struct aA_indexExpr_ {
    A_pos pos;
    A_indexExprKind kind;
    union {
        int num;
        string* id;
    } u;
};

struct aA_arrayExpr_ {
    A_pos pos;
    aA_leftVal arr;
    aA_indexExpr idx;
};

struct aA_memberExpr_ {
    A_pos pos;
    aA_leftVal structId;
    string* memberId;
};

struct aA_exprUnit_ {
    A_pos pos;
    A_exprUnitType kind;
    union {
        int num;
        string* id;
        aA_arithExpr arithExpr;
        aA_fnCall callExpr;
        aA_arrayExpr arrayExpr;
        aA_memberExpr memberExpr;
        aA_arithUExpr arithUExpr;
    } u;
};

struct aA_arithBiOpExpr_ {
    A_pos pos;
    A_arithBiOp op;
    aA_arithExpr left, right;
};

struct aA_arithUExpr_ {
    A_pos pos;
    A_arithUOp op;
    aA_exprUnit expr;
};

struct aA_arithExpr_ {
    A_pos pos;
    A_arithExprType kind;
    union {
        aA_arithBiOpExpr arithBiOpExpr;
        aA_exprUnit exprUnit;
    } u;
};

struct aA_boolBiOpExpr_ {
    A_pos pos;
    A_boolBiOp op;
    aA_boolExpr left;
    aA_boolExpr right;
};

struct aA_boolUOpExpr_ {
    A_pos pos;
    A_boolUOp op;
    aA_boolUnit cond;
};

struct aA_boolExpr_ {
    A_pos pos;
    A_boolExprType kind;
    union {
        aA_boolBiOpExpr boolBiOpExpr;
        aA_boolUnit boolUnit;
    } u;
};

struct aA_comExpr_ {
    A_pos pos;
    A_comOp op;
    aA_exprUnit left, right;
};

struct aA_boolUnit_ {
    A_pos pos;
    A_boolUnitType kind;
    union {
        aA_comExpr comExpr;
        aA_boolExpr boolExpr;
        aA_boolUOpExpr boolUOpExpr;
    } u;
};

struct aA_rightVal_ {
    A_pos pos;
    A_rightValType kind;
    union {
        aA_arithExpr arithExpr;
        aA_boolExpr boolExpr;
    } u;
};

struct aA_leftVal_ {
    A_pos pos;
    A_leftValType kind;
    union {
        string* id;
        aA_arrayExpr arrExpr;
        aA_memberExpr memberExpr;
    } u;
};

struct aA_assignStmt_ {
    A_pos pos;
    aA_leftVal leftVal;
    aA_rightVal rightVal;
};

struct aA_varDeclScalar_ {
    A_pos pos;
    string* id;
    aA_type type;
};

struct aA_varDeclArray_ {
    A_pos pos;
    string* id;
    int len;
    aA_type type;
};

struct aA_varDecl_ {
    A_pos pos;
    A_varDeclType kind;
    union {
        aA_varDeclScalar declScalar;
        aA_varDeclArray declArray;
    } u;
};

struct aA_varDefScalar_ {
    A_pos pos;
    string* id;
    aA_type type;
    aA_rightVal val;
};

struct aA_varDefArray_ {
    A_pos pos;
    string* id;
    int len;
    aA_type type;
    vector<aA_rightVal> vals;
};

struct aA_varDef_ {
    A_pos pos;
    A_varDefType kind;
    union {
        aA_varDefScalar defScalar;
        aA_varDefArray defArray;
    } u;
};

struct aA_varDeclStmt_ {
    A_pos pos;
    A_varDeclStmtType kind;
    union {
        aA_varDecl varDecl;
        aA_varDef varDef;
    } u;
};

struct aA_structDef_ {
    A_pos pos;
    string* id;
    vector<aA_varDecl> varDecls;
};

struct aA_fnDecl_ {
    A_pos pos;
    string* id;
    aA_paramDecl paramDecl;
    aA_type type;
};

struct aA_paramDecl_ {
    vector<aA_varDecl> varDecls;
};

struct aA_fnDef_ {
    A_pos pos;
    aA_fnDecl fnDecl;
    vector<aA_codeBlockStmt> stmts;
};

struct aA_ifStmt_ {
    A_pos pos;
    aA_boolExpr boolExpr;
    vector<aA_codeBlockStmt> ifStmts, elseStmts;
};

struct aA_whileStmt_ {
    A_pos pos;
    aA_boolExpr boolExpr;
    vector<aA_codeBlockStmt> whileStmts;
};

struct aA_callStmt_ {
    A_pos pos;
    aA_fnCall fnCall;
};

struct aA_returnStmt_ {
    A_pos pos;
    aA_rightVal retVal;
};

struct aA_codeBlockStmt_ {
    A_pos pos;
    A_codeBlockStmtType kind;
    union {
        aA_varDeclStmt varDeclStmt;
        aA_assignStmt assignStmt;
        aA_callStmt callStmt;
        aA_ifStmt ifStmt;
        aA_whileStmt whileStmt;
        aA_returnStmt returnStmt;
        // continue and break do not need other info
    } u;
};

struct aA_fnDeclStmt_ {
    A_pos pos;
    aA_fnDecl fnDecl;
};

struct aA_programElement_ {
    A_pos pos;
    A_programElementType kind;
    union {
        aA_varDeclStmt varDeclStmt;
        aA_structDef structDef;
        aA_fnDeclStmt fnDeclStmt;
        aA_fnDef fnDef;
    } u;
};

struct aA_program_ {
    vector<aA_programElement> programElements;
};


aA_type aA_Type(A_type type);
aA_fnCall aA_FnCall(A_fnCall fnCall);
aA_indexExpr aA_IndexExpr(A_indexExpr indexExpr);
aA_arrayExpr aA_ArrayExpr(A_arrayExpr arrayExpr);
aA_memberExpr aA_MemberExpr(A_memberExpr memberExpr);
aA_exprUnit aA_ExprUnit(A_exprUnit exprUnit);
aA_arithBiOpExpr aA_ArithBiOpExpr(A_arithBiOpExpr arithBiOpExpr);
aA_arithUExpr aA_ArithUExpr(A_arithUExpr arithUExpr);
aA_arithExpr aA_ArithExpr(A_arithExpr arithExpr);
aA_boolBiOpExpr aA_BoolBiOpExpr(A_boolBiOpExpr boolBiOpExpr);
aA_boolUOpExpr aA_BoolUOpExpr(A_boolUOpExpr boolUOpExpr);
aA_boolExpr aA_BoolExpr(A_boolExpr boolExpr);
aA_comExpr aA_ComExpr(A_comExpr comExpr);
aA_boolUnit aA_BoolUnit(A_boolUnit boolUnit);
aA_rightVal aA_RightVal(A_rightVal rightVal);
aA_leftVal aA_LeftVal(A_leftVal leftVal);
aA_assignStmt aA_AssignStmt(A_assignStmt assignStmt);
aA_varDeclScalar aA_VarDeclScalar(A_varDeclScalar varDeclScalar);
aA_varDeclArray aA_VarDeclArray(A_varDeclArray varDeclArray);
aA_varDecl aA_VarDecl(A_varDecl varDecl);
aA_varDefScalar aA_VarDefScalar(A_varDefScalar varDefScalar);
aA_varDefArray aA_VarDefArray(A_varDefArray varDefArray);
aA_varDef aA_VarDef(A_varDef varDef);
aA_varDeclStmt aA_VarDeclStmt(A_varDeclStmt varDeclStmt);
aA_structDef aA_StructDef(A_structDef structDef);
aA_paramDecl aA_ParamDecl(A_paramDecl paramDecl);
aA_fnDecl aA_FnDecl(A_fnDecl fnDecl);
aA_fnDef aA_FnDef(A_fnDef fnDef);
aA_ifStmt aA_IfStmt(A_ifStmt ifStmt);
aA_whileStmt aA_WhileStmt(A_whileStmt whileStmt);
aA_callStmt aA_CallStmt(A_callStmt callStmt);
aA_returnStmt aA_ReturnStmt(A_returnStmt returnStmt);
aA_codeBlockStmt aA_CodeBlockStmt(A_codeBlockStmt codeBlockStmt);
aA_fnDeclStmt aA_FnDeclStmt(A_fnDeclStmt fnDeclStmt);
aA_programElement aA_ProgramElement(A_programElement programElement);
aA_program aA_Program(A_program program);
