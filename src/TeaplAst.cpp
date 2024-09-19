#include <cstdlib>
#include "TeaplAst.h"

A_pos A_Pos(int line, int col){
    A_pos p = (A_pos)malloc(sizeof(*p));
    p->line = line;
    p->col = col;
    return p;
}

A_tokenId A_TokenId(A_pos pos, char* id){
    A_tokenId p = (A_tokenId)malloc(sizeof(*p));
    p->pos = pos;
    p->id = id;
    return p;
}

A_tokenNum A_TokenNum(A_pos pos, int num){
    A_tokenNum p = (A_tokenNum)malloc(sizeof(*p));
    p->pos = pos;
    p->num = num;
    return p;
}

A_type A_NativeType(A_pos pos, A_nativeType ntype){
    A_type p = (A_type)malloc(sizeof(*p));
    p->pos = pos;
    p->type = A_nativeTypeKind;
    p->u.nativeType = ntype;
    return p;
}

A_type A_StructType(A_pos pos, char* stype){
    A_type p = (A_type)malloc(sizeof(*p));
    p->pos = pos;
    p->type = A_structTypeKind;
    p->u.structType = stype;
    return p;
}

A_rightValList A_RightValList(A_rightVal head, A_rightValList tail){
    A_rightValList p = (A_rightValList)malloc(sizeof(*p));
    p->head= head;
    p->tail = tail;
    return p;
}

A_fnCall A_FnCall(A_pos pos, char* fn, A_rightValList vals){
    A_fnCall p = (A_fnCall)malloc(sizeof(*p));
    p->pos= pos;
    p->fn= fn;
    p->vals = vals;
    return p;
}

A_indexExpr A_NumIndexExpr(A_pos pos, int num){
    A_indexExpr p = (A_indexExpr)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_numIndexKind;
    p->u.num = num;
    return p;
}

A_indexExpr A_IdIndexExpr(A_pos pos, char* id){
    A_indexExpr p = (A_indexExpr)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_idIndexKind;
    p->u.id = id;
    return p;
}

A_arrayExpr A_ArrayExpr(A_pos pos, A_leftVal arr, A_indexExpr idx){
    A_arrayExpr p = (A_arrayExpr)malloc(sizeof(*p));
    p->pos = pos;
    p->arr= arr;
    p->idx = idx;
    return p;
}

A_memberExpr A_MemberExpr(A_pos pos, A_leftVal structId, char* memberId){
    A_memberExpr p = (A_memberExpr)malloc(sizeof(*p));
    p->pos = pos;
    p->structId= structId;
    p->memberId = memberId;
    return p;
}

A_exprUnit A_NumExprUnit(A_pos pos, int num){
    A_exprUnit p = (A_exprUnit)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_numExprKind;
    p->u.num = num;
    return p;
}

A_exprUnit A_IdExprUnit(A_pos pos, char* id){
    A_exprUnit p = (A_exprUnit)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_idExprKind;
    p->u.id = id;
    return p;
}

A_exprUnit A_ArithExprUnit(A_pos pos, A_arithExpr arithExpr){
    A_exprUnit p = (A_exprUnit)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_arithExprKind;
    p->u.arithExpr = arithExpr;
    return p;
}

A_exprUnit A_CallExprUnit(A_pos pos, A_fnCall callExpr){
    A_exprUnit p = (A_exprUnit)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_fnCallKind;
    p->u.callExpr = callExpr;
    return p;
}

A_exprUnit A_ArrayExprUnit(A_pos pos, A_arrayExpr arrayExpr){
    A_exprUnit p = (A_exprUnit)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_arrayExprKind;
    p->u.arrayExpr = arrayExpr;
    return p;
}

A_exprUnit A_MemberExprUnit(A_pos pos, A_memberExpr memberExpr){
    A_exprUnit p = (A_exprUnit)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_memberExprKind;
    p->u.memberExpr = memberExpr;
    return p;
}

A_exprUnit A_ArithUExprUnit(A_pos pos, A_arithUExpr arithUExpr){
    A_exprUnit p = (A_exprUnit)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_arithUExprKind;
    p->u.arithUExpr = arithUExpr;
    return p;
}

A_arithBiOpExpr A_ArithBiOpExpr(A_pos pos, A_arithBiOp op, A_arithExpr left, A_arithExpr right){
    A_arithBiOpExpr p = (A_arithBiOpExpr)malloc(sizeof(*p));
    p->pos = pos;
    p->op= op;
    p->left = left;
    p->right = right;
    return p;
}

A_arithUExpr A_ArithUExpr(A_pos pos, A_arithUOp op, A_exprUnit expr){
    A_arithUExpr p = (A_arithUExpr)malloc(sizeof(*p));
    p->pos = pos;
    p->op= op;
    p->expr = expr;
    return p;
}

A_arithExpr A_ArithBiOp_Expr(A_pos pos, A_arithBiOpExpr arithBiOpExpr){
    A_arithExpr p = (A_arithExpr)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_arithBiOpExprKind;
    p->u.arithBiOpExpr = arithBiOpExpr;
    return p;
}

A_arithExpr A_ExprUnit(A_pos pos, A_exprUnit exprUnit){
    A_arithExpr p = (A_arithExpr)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_exprUnitKind;
    p->u.exprUnit = exprUnit;
    return p;
}

A_boolBiOpExpr A_BoolBiOpExpr(A_pos pos, A_boolBiOp op, A_boolExpr left, A_boolExpr right){
    A_boolBiOpExpr p = (A_boolBiOpExpr)malloc(sizeof(*p));
    p->pos = pos;
    p->op= op;
    p->left = left;
    p->right = right;
    return p;
}

A_boolUOpExpr A_BoolUOpExpr(A_pos pos, A_boolUOp op, A_boolUnit cond){
    A_boolUOpExpr p = (A_boolUOpExpr)malloc(sizeof(*p));
    p->pos = pos;
    p->op= op;
    p->cond = cond;
    return p;
}

A_boolExpr A_BoolBiOp_Expr(A_pos pos, A_boolBiOpExpr boolBiOpExpr){
    A_boolExpr p = (A_boolExpr)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_boolBiOpExprKind;
    p->u.boolBiOpExpr = boolBiOpExpr;
    return p;
}

A_boolExpr A_BoolExpr(A_pos pos, A_boolUnit boolUnit){
    A_boolExpr p = (A_boolExpr)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_boolUnitKind;
    p->u.boolUnit = boolUnit;
    return p;
}

A_comExpr A_ComExpr(A_pos pos, A_comOp op, A_exprUnit left, A_exprUnit right){
    A_comExpr p = (A_comExpr)malloc(sizeof(*p));
    p->pos= pos;
    p->op = op;
    p->left = left;
    p->right = right;
    return p;
}

A_boolUnit A_ComExprUnit(A_pos pos, A_comExpr comExpr){
    A_boolUnit p = (A_boolUnit)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_comOpExprKind;
    p->u.comExpr = comExpr;
    return p;
}

A_boolUnit A_BoolExprUnit(A_pos pos, A_boolExpr boolExpr){
    A_boolUnit p = (A_boolUnit)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_boolExprKind;
    p->u.boolExpr = boolExpr;
    return p;
}

A_boolUnit A_BoolUOpExprUnit(A_pos pos, A_boolUOpExpr boolUOpExpr){
    A_boolUnit p = (A_boolUnit)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_boolUOpExprKind;
    p->u.boolUOpExpr = boolUOpExpr;
    return p;
}

A_rightVal A_ArithExprRVal(A_pos pos, A_arithExpr arithExpr){
    A_rightVal p = (A_rightVal)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_arithExprValKind;
    p->u.arithExpr = arithExpr;
    return p;
}

A_rightVal A_BoolExprRVal(A_pos pos, A_boolExpr boolExpr){
    A_rightVal p = (A_rightVal)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_boolExprValKind;
    p->u.boolExpr = boolExpr;
    return p;
}

A_leftVal A_IdExprLVal(A_pos pos, char* id){
    A_leftVal p = (A_leftVal)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_varValKind;
    p->u.id = id;
    return p;
}

A_leftVal A_ArrExprLVal(A_pos pos, A_arrayExpr arrExpr){
    A_leftVal p = (A_leftVal)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_arrValKind;
    p->u.arrExpr = arrExpr;
    return p;
}

A_leftVal A_MemberExprLVal(A_pos pos, A_memberExpr memberExpr){
    A_leftVal p = (A_leftVal)malloc(sizeof(*p));
    p->pos = pos;
    p->kind= A_memberValKind;
    p->u.memberExpr = memberExpr;
    return p;
}

A_assignStmt A_AssignStmt(A_pos pos, A_leftVal leftVal, A_rightVal rightVal){
    A_assignStmt p = (A_assignStmt)malloc(sizeof(*p));
    p->pos = pos;
    p->leftVal= leftVal;
    p->rightVal = rightVal;
    return p;
}

A_varDeclScalar A_VarDeclScalar(A_pos pos, char* id, A_type type){
    A_varDeclScalar p = (A_varDeclScalar)malloc(sizeof(*p));
    p->pos = pos;
    p->id= id;
    p->type = type;
    return p;
}

A_varDeclArray A_VarDeclArray(A_pos pos, char* id, int len, A_type type){
    A_varDeclArray p = (A_varDeclArray)malloc(sizeof(*p));
    p->pos = pos;
    p->id= id;
    p->len = len;
    p->type = type;
    return p;
}

A_varDecl A_VarDecl_Scalar(A_pos pos, A_varDeclScalar declScalar){
    A_varDecl p = (A_varDecl)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_varDeclScalarKind;
    p->u.declScalar = declScalar;
    return p;
}

A_varDecl A_VarDecl_Array(A_pos pos, A_varDeclArray declArray){
    A_varDecl p = (A_varDecl)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_varDeclArrayKind;
    p->u.declArray = declArray;
    return p;
}

A_varDefScalar A_VarDefScalar(A_pos pos, char* id, A_type type, A_rightVal val){
    A_varDefScalar p = (A_varDefScalar)malloc(sizeof(*p));
    p->pos = pos;
    p->id= id;
    p->type = type;
    p->val = val;
    return p;
}

A_varDefArray A_VarDefArray(A_pos pos, char* id, int len, A_type type, A_rightValList vals){
    A_varDefArray p = (A_varDefArray)malloc(sizeof(*p));
    p->pos = pos;
    p->id= id;
    p->len = len;
    p->type = type;
    p->vals = vals;
    return p;
}

A_varDef A_VarDef_Scalar(A_pos pos, A_varDefScalar defScalar){
    A_varDef p = (A_varDef)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_varDefScalarKind;
    p->u.defScalar = defScalar;
    return p;
}

A_varDef A_VarDef_Array(A_pos pos, A_varDefArray defArray){
    A_varDef p = (A_varDef)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_varDefArrayKind;
    p->u.defArray = defArray;
    return p;
}

A_varDeclStmt A_VarDeclStmt(A_pos pos, A_varDecl varDecl){
    A_varDeclStmt p = (A_varDeclStmt)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_varDeclKind;
    p->u.varDecl = varDecl;
    return p;

}

A_varDeclStmt A_VarDefStmt(A_pos pos, A_varDef varDef){
    A_varDeclStmt p = (A_varDeclStmt)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_varDefKind;
    p->u.varDef = varDef;
    return p;
}

A_varDeclList A_VarDeclList(A_varDecl head, A_varDeclList tail){
    A_varDeclList p = (A_varDeclList)malloc(sizeof(*p));
    p->head = head;
    p->tail = tail;
    return p;
}

A_structDef A_StructDef(A_pos pos, char* id, A_varDeclList varDecls){
    A_structDef p = (A_structDef)malloc(sizeof(*p));
    p->pos = pos;
    p->id = id;
    p->varDecls = varDecls;
    return p;
}

A_fnDecl A_FnDecl(A_pos pos, char* id, A_paramDecl paramDecl, A_type type){
    A_fnDecl p = (A_fnDecl)malloc(sizeof(*p));
    p->pos = pos;
    p->id = id;
    p->paramDecl = paramDecl;
    p->type = type;
    return p;
}

A_paramDecl A_ParamDecl(A_varDeclList varDecls){
    A_paramDecl p = (A_paramDecl)malloc(sizeof(*p));
    p->varDecls = varDecls;
    return p;
}

A_codeBlockStmtList A_CodeBlockStmtList(A_codeBlockStmt head, A_codeBlockStmtList tail){
    A_codeBlockStmtList p = (A_codeBlockStmtList)malloc(sizeof(*p));
    p->head = head;
    p->tail = tail;
    return p;
}

A_fnDef A_FnDef(A_pos pos, A_fnDecl fnDecl, A_codeBlockStmtList stmts){
    A_fnDef p = (A_fnDef)malloc(sizeof(*p));
    p->pos = pos;
    p->fnDecl = fnDecl;
    p->stmts = stmts;
    return p;
}

A_ifStmt A_IfStmt(A_pos pos, A_boolUnit boolUnit, A_codeBlockStmtList ifStmts, A_codeBlockStmtList elseStmts){
    A_ifStmt p = (A_ifStmt)malloc(sizeof(*p));
    p->pos = pos;
    p->boolUnit = boolUnit;
    p->ifStmts = ifStmts;
    p->elseStmts = elseStmts;
    return p;
}

A_whileStmt A_WhileStmt(A_pos pos, A_boolUnit boolUnit, A_codeBlockStmtList whileStmts){
    A_whileStmt p = (A_whileStmt)malloc(sizeof(*p));
    p->pos = pos;
    p->boolUnit = boolUnit;
    p->whileStmts = whileStmts;
    return p;
}

A_callStmt A_CallStmt(A_pos pos, A_fnCall fnCall){
    A_callStmt p = (A_callStmt)malloc(sizeof(*p));
    p->pos = pos;
    p->fnCall = fnCall;
    return p;
}

A_returnStmt A_ReturnStmt(A_pos pos, A_rightVal retVal){
    A_returnStmt p = (A_returnStmt)malloc(sizeof(*p));
    p->pos = pos;
    p->retVal = retVal;
    return p;
}

A_codeBlockStmt A_BlockNullStmt(A_pos pos){
    A_codeBlockStmt p = (A_codeBlockStmt)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_nullStmtKind;
    return p;
}

A_codeBlockStmt A_BlockVarDeclStmt(A_pos pos, A_varDeclStmt varDeclStmt){
    A_codeBlockStmt p = (A_codeBlockStmt)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_varDeclStmtKind;
    p->u.varDeclStmt = varDeclStmt;
    return p;
}

A_codeBlockStmt A_BlockAssignStmt(A_pos pos, A_assignStmt assignStmt){
    A_codeBlockStmt p = (A_codeBlockStmt)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_assignStmtKind;
    p->u.assignStmt = assignStmt;
    return p;
}

A_codeBlockStmt A_BlockCallStmt(A_pos pos, A_callStmt callStmt){
    A_codeBlockStmt p = (A_codeBlockStmt)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_callStmtKind;
    p->u.callStmt = callStmt;
    return p;
}

A_codeBlockStmt A_BlockIfStmt(A_pos pos, A_ifStmt ifStmt){
    A_codeBlockStmt p = (A_codeBlockStmt)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_ifStmtKind;
    p->u.ifStmt = ifStmt;
    return p;
}

A_codeBlockStmt A_BlockWhileStmt(A_pos pos, A_whileStmt whileStmt){
    A_codeBlockStmt p = (A_codeBlockStmt)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_whileStmtKind;
    p->u.whileStmt = whileStmt;
    return p;
}

A_codeBlockStmt A_BlockReturnStmt(A_pos pos, A_returnStmt returnStmt){
    A_codeBlockStmt p = (A_codeBlockStmt)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_returnStmtKind;
    p->u.returnStmt = returnStmt;
    return p;
}

A_codeBlockStmt A_BlockContinueStmt(A_pos pos){
    A_codeBlockStmt p = (A_codeBlockStmt)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_continueStmtKind;
    return p;
}

A_codeBlockStmt A_BlockBreakStmt(A_pos pos){
    A_codeBlockStmt p = (A_codeBlockStmt)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_breakStmtKind;
    return p;
}

A_fnDeclStmt A_FnDeclStmt(A_pos pos, A_fnDecl fnDecl){
    A_fnDeclStmt p = (A_fnDeclStmt)malloc(sizeof(*p));
    p->pos = pos;
    p->fnDecl = fnDecl;
    return p;
}

A_programElement A_ProgramNullStmt(A_pos pos){
    A_programElement p = (A_programElement)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_programNullStmtKind;
    return p;
}

A_programElement A_ProgramVarDeclStmt(A_pos pos, A_varDeclStmt varDeclStmt){
    A_programElement p = (A_programElement)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_programVarDeclStmtKind;
    p->u.varDeclStmt = varDeclStmt;
    return p;
}

A_programElement A_ProgramStructDef(A_pos pos, A_structDef structDef){
    A_programElement p = (A_programElement)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_programStructDefKind;
    p->u.structDef = structDef;
    return p;
}

A_programElement A_ProgramFnDeclStmt(A_pos pos, A_fnDeclStmt fnDeclStmt){
    A_programElement p = (A_programElement)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_programFnDeclStmtKind;
    p->u.fnDeclStmt = fnDeclStmt;
    return p;
}

A_programElement A_ProgramFnDef(A_pos pos, A_fnDef fnDef){
    A_programElement p = (A_programElement)malloc(sizeof(*p));
    p->pos = pos;
    p->kind = A_programFnDefKind;
    p->u.fnDef = fnDef;
    return p;
}

A_programElementList A_ProgramElementList(A_programElement head, A_programElementList tail){
    A_programElementList p = (A_programElementList)malloc(sizeof(*p));
    p->head = head;
    p->tail = tail;
    return p;
}

A_program A_Program(A_programElementList programElements){
    A_program p = (A_program)malloc(sizeof(*p));
    p->programElements = programElements;
    return p;
}