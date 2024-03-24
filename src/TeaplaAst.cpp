#include "TeaplAst.h"
#include "TeaplaAst.h"

aA_type aA_Type(A_type type){
    if(!type) return nullptr;
    aA_type p = new aA_type_;
    p->pos = type->pos;
    p->type = type->type;
    switch(type->type){
    case A_nativeTypeKind:{
        p->u.nativeType = type->u.nativeType;
        break;
    }
    case A_structTypeKind:{
        p->u.structType = new string(type->u.structType);
        break;
    }
    }
    return p;
}

aA_fnCall aA_FnCall(A_fnCall fnCall){
    if(!fnCall) return nullptr;
    aA_fnCall p = new aA_fnCall_;
    p->pos = fnCall->pos;
    p->fn= new string(fnCall->fn);
    for(A_rightValList l=fnCall->vals; l; l=l->tail){
        p->vals.emplace_back(aA_RightVal(l->head));
    }
    return p;
}

aA_indexExpr aA_IndexExpr(A_indexExpr indexExpr){
    if(!indexExpr) return nullptr;
    aA_indexExpr p = new aA_indexExpr_;
    p->pos = indexExpr->pos;
    p->kind= indexExpr->kind;
    switch(indexExpr->kind){
    case A_numIndexKind:{
        p->u.num = indexExpr->u.num;
        break;
    }
    case A_idIndexKind:{
        p->u.id = new string(indexExpr->u.id);
        break;
    }
    }
    return p;
}

aA_arrayExpr aA_ArrayExpr(A_arrayExpr arrayExpr){
    if(!arrayExpr) return nullptr;
    aA_arrayExpr p = new aA_arrayExpr_;
    p->pos = arrayExpr->pos;
    p->arr= aA_LeftVal(arrayExpr->arr);
    p->idx = aA_IndexExpr(arrayExpr->idx);
    return p;
}

aA_memberExpr aA_MemberExpr(A_memberExpr memberExpr){
    if(!memberExpr) return nullptr;
    aA_memberExpr p = new aA_memberExpr_;
    p->pos = memberExpr->pos;
    p->structId= aA_LeftVal(memberExpr->structId);
    p->memberId = new string(memberExpr->memberId);
    return p;
}

aA_exprUnit aA_ExprUnit(A_exprUnit exprUnit){
    if(!exprUnit) return nullptr;
    aA_exprUnit p = new aA_exprUnit_;
    p->pos = exprUnit->pos;
    p->kind= exprUnit->kind;
    switch(exprUnit->kind){
    case A_numExprKind:{
        p->u.num = exprUnit->u.num;
        break;
    }
    case A_idExprKind:{
        p->u.id = new string(exprUnit->u.id);
        break;
    }
    case A_arithExprKind:{
        p->u.arithExpr = aA_ArithExpr(exprUnit->u.arithExpr);
        break;
    }
    case A_fnCallKind:{
        p->u.callExpr = aA_FnCall(exprUnit->u.callExpr);
        break;
    }
    case A_arrayExprKind:{
        p->u.arrayExpr = aA_ArrayExpr(exprUnit->u.arrayExpr);
        break;
    }
    case A_memberExprKind:{
        p->u.memberExpr = aA_MemberExpr(exprUnit->u.memberExpr);
        break;
    }
    case A_arithUExprKind:{
        p->u.arithUExpr = aA_ArithUExpr(exprUnit->u.arithUExpr);
        break;
    }
    }
    return p;
}

aA_arithBiOpExpr aA_ArithBiOpExpr(A_arithBiOpExpr arithBiOpExpr){
    if(!arithBiOpExpr) return nullptr;
    aA_arithBiOpExpr p = new aA_arithBiOpExpr_;
    p->pos = arithBiOpExpr->pos;
    p->op= arithBiOpExpr->op;
    p->left = aA_ArithExpr(arithBiOpExpr->left);
    p->right = aA_ArithExpr(arithBiOpExpr->right);
    return p;
}

aA_arithUExpr aA_ArithUExpr(A_arithUExpr arithUExpr){
    if(!arithUExpr) return nullptr;
    aA_arithUExpr p = new aA_arithUExpr_;
    p->pos = arithUExpr->pos;
    p->op= arithUExpr->op;
    p->expr = aA_ExprUnit(arithUExpr->expr);
    return p;
}

aA_arithExpr aA_ArithExpr(A_arithExpr arithExpr){
    if(!arithExpr) return nullptr;
    aA_arithExpr p = new aA_arithExpr_;
    p->pos = arithExpr->pos;
    p->kind= arithExpr->kind;
    switch(arithExpr->kind){
    case A_arithBiOpExprKind:{
        p->u.arithBiOpExpr = aA_ArithBiOpExpr(arithExpr->u.arithBiOpExpr);
        break;
    }
    case A_exprUnitKind:{
        p->u.exprUnit = aA_ExprUnit(arithExpr->u.exprUnit);
        break;
    }
    }
    return p;
}

aA_boolBiOpExpr aA_BoolBiOpExpr(A_boolBiOpExpr boolBiOpExpr){
    if(!boolBiOpExpr) return nullptr;
    aA_boolBiOpExpr p = new aA_boolBiOpExpr_;
    p->pos = boolBiOpExpr->pos;
    p->op= boolBiOpExpr->op;
    p->left = aA_BoolExpr(boolBiOpExpr->left);
    p->right = aA_BoolExpr(boolBiOpExpr->right);
    return p;
}

aA_boolUOpExpr aA_BoolUOpExpr(A_boolUOpExpr boolUOpExpr){
    if(!boolUOpExpr) return nullptr;
    aA_boolUOpExpr p = new aA_boolUOpExpr_;
    p->pos = boolUOpExpr->pos;
    p->op= boolUOpExpr->op;
    p->cond = aA_BoolUnit(boolUOpExpr->cond);
    return p;
}

aA_boolExpr aA_BoolExpr(A_boolExpr boolExpr){
    if(!boolExpr) return nullptr;
    aA_boolExpr p = new aA_boolExpr_;
    p->pos = boolExpr->pos;
    p->kind= boolExpr->kind;
    switch(boolExpr->kind){
    case A_boolBiOpExprKind:{
        p->u.boolBiOpExpr = aA_BoolBiOpExpr(boolExpr->u.boolBiOpExpr);
        break;
    }
    case A_boolUnitKind:{
        p->u.boolUnit = aA_BoolUnit(boolExpr->u.boolUnit);
        break;
    }
    }
    return p;
}

aA_comExpr aA_ComExpr(A_comExpr comExpr){
    if(!comExpr) return nullptr;
    aA_comExpr p = new aA_comExpr_;
    p->pos= comExpr->pos;
    p->op = comExpr->op;
    p->left = aA_ExprUnit(comExpr->left);
    p->right = aA_ExprUnit(comExpr->right);
    return p;
}

aA_boolUnit aA_BoolUnit(A_boolUnit boolUnit){
    if(!boolUnit) return nullptr;
    aA_boolUnit p = new aA_boolUnit_;
    p->pos = boolUnit->pos;
    p->kind= boolUnit->kind;
    switch(boolUnit->kind){
    case A_comOpExprKind:{
        p->u.comExpr = aA_ComExpr(boolUnit->u.comExpr);
        break;
    }
    case A_boolExprKind:{
        p->u.boolExpr = aA_BoolExpr(boolUnit->u.boolExpr);
        break;
    }
    case A_boolUOpExprKind:{
        p->u.boolUOpExpr = aA_BoolUOpExpr(boolUnit->u.boolUOpExpr);
        break;
    }
    }
    return p;
}

aA_rightVal aA_RightVal(A_rightVal rightVal){
    if(!rightVal) return nullptr;
    aA_rightVal p = new aA_rightVal_;
    p->pos = rightVal->pos;
    p->kind= rightVal->kind;
    switch(rightVal->kind){
    case A_arithExprValKind:{
        p->u.arithExpr = aA_ArithExpr(rightVal->u.arithExpr);
        break;
    }
    case A_boolExprValKind:{
        p->u.boolExpr = aA_BoolExpr(rightVal->u.boolExpr);
        break;
    }
    }
    return p;
}

aA_leftVal aA_LeftVal(A_leftVal leftVal){
    if(!leftVal) return nullptr;
    aA_leftVal p = new aA_leftVal_;
    p->pos = leftVal->pos;
    p->kind= leftVal->kind;
    switch(leftVal->kind){
    case A_varValKind:{
        p->u.id = new string(leftVal->u.id);
        break;
    }
    case A_arrValKind:{
        p->u.arrExpr = aA_ArrayExpr(leftVal->u.arrExpr);
        break;
    }
    case A_memberValKind:{
        p->u.memberExpr = aA_MemberExpr(leftVal->u.memberExpr);
        break;
    }
    }
    return p;
}

aA_assignStmt aA_AssignStmt(A_assignStmt assignStmt){
    if(!assignStmt) return nullptr;
    aA_assignStmt p = new aA_assignStmt_;
    p->pos = assignStmt->pos;
    p->leftVal= aA_LeftVal(assignStmt->leftVal);
    p->rightVal = aA_RightVal(assignStmt->rightVal);
    return p;
}

aA_varDeclScalar aA_VarDeclScalar(A_varDeclScalar varDeclScalar){
    if(!varDeclScalar) return nullptr;
    aA_varDeclScalar p = new aA_varDeclScalar_;
    p->pos = varDeclScalar->pos;
    p->id= new string(varDeclScalar->id);
    p->type = aA_Type(varDeclScalar->type);
    return p;
}

aA_varDeclArray aA_VarDeclArray(A_varDeclArray varDeclArray){
    if(!varDeclArray) return nullptr;
    aA_varDeclArray p = new aA_varDeclArray_;
    p->pos = varDeclArray->pos;
    p->id= new string(varDeclArray->id);
    p->len = varDeclArray->len;
    p->type = aA_Type(varDeclArray->type);
    return p;
}

aA_varDecl aA_VarDecl(A_varDecl varDecl){
    if(!varDecl) return nullptr;
    aA_varDecl p = new aA_varDecl_;
    p->pos = varDecl->pos;
    p->kind = varDecl->kind;
    switch(varDecl->kind){
    case A_varDeclScalarKind:{
        p->u.declScalar = aA_VarDeclScalar(varDecl->u.declScalar);
        break;
    }
    case A_varDeclArrayKind:{
        p->u.declArray = aA_VarDeclArray(varDecl->u.declArray);
        break;
    }
    }
    return p;
}

aA_varDefScalar aA_VarDefScalar(A_varDefScalar varDefScalar){
    if(!varDefScalar) return nullptr;
    aA_varDefScalar p = new aA_varDefScalar_;
    p->pos = varDefScalar->pos;
    p->id= new string(varDefScalar->id);
    p->type = aA_Type(varDefScalar->type);
    p->val = aA_RightVal(varDefScalar->val);
    return p;
}

aA_varDefArray aA_VarDefArray(A_varDefArray varDefArray){
    if(!varDefArray) return nullptr;
    aA_varDefArray p = new aA_varDefArray_;
    p->pos = varDefArray->pos;
    p->id= new string(varDefArray->id);
    p->len = varDefArray->len;
    p->type = aA_Type(varDefArray->type);
    for(A_rightValList l=varDefArray->vals; l; l=l->tail){
        p->vals.emplace_back(aA_RightVal(l->head));
    }
    return p;
}

aA_varDef aA_VarDef(A_varDef varDef){
    if(!varDef) return nullptr;
    aA_varDef p = new aA_varDef_;
    p->pos = varDef->pos;
    p->kind = varDef->kind;
    switch(varDef->kind){
    case A_varDefScalarKind:{
        p->u.defScalar = aA_VarDefScalar(varDef->u.defScalar);
        break;
    }
    case A_varDefArrayKind:{
        p->u.defArray = aA_VarDefArray(varDef->u.defArray);
        break;
    }
    }
    return p;
}

aA_varDeclStmt aA_VarDeclStmt(A_varDeclStmt varDeclStmt){
    if(!varDeclStmt) return nullptr;
    aA_varDeclStmt p = new aA_varDeclStmt_;
    p->pos = varDeclStmt->pos;
    p->kind = varDeclStmt->kind;
    switch(varDeclStmt->kind){
    case A_varDeclKind:{
        p->u.varDecl = aA_VarDecl(varDeclStmt->u.varDecl);
        break;
    }
    case A_varDefKind:{
        p->u.varDef = aA_VarDef(varDeclStmt->u.varDef);
        break;
    }
    }
    return p;

}

aA_structDef aA_StructDef(A_structDef structDef){
    if(!structDef) return nullptr;
    aA_structDef p = new aA_structDef_;
    p->pos = structDef->pos;
    p->id = new string(structDef->id);
    for(A_varDeclList l=structDef->varDecls; l; l=l->tail){
        p->varDecls.emplace_back(aA_VarDecl(l->head));
    }
    return p;
}

aA_paramDecl aA_ParamDecl(A_paramDecl paramDecl){
    if(!paramDecl) return nullptr;
    aA_paramDecl p = new aA_paramDecl_;
    for(A_varDeclList l=paramDecl->varDecls; l; l=l->tail){
        p->varDecls.emplace_back(aA_VarDecl(l->head));
    }
    return p;
}

aA_fnDecl aA_FnDecl(A_fnDecl fnDecl){
    if(!fnDecl) return nullptr;
    aA_fnDecl p = new aA_fnDecl_;
    p->pos = fnDecl->pos;
    p->id = new string(fnDecl->id);
    p->paramDecl = aA_ParamDecl(fnDecl->paramDecl);
    p->type = aA_Type(fnDecl->type);
    return p;
}

aA_fnDef aA_FnDef(A_fnDef fnDef){
    if(!fnDef) return nullptr;
    aA_fnDef p = new aA_fnDef_;
    p->pos = fnDef->pos;
    p->fnDecl = aA_FnDecl(fnDef->fnDecl);
    for(A_codeBlockStmtList l=fnDef->stmts; l; l=l->tail){
        p->stmts.emplace_back(aA_CodeBlockStmt(l->head));
    }
    return p;
}

aA_ifStmt aA_IfStmt(A_ifStmt ifStmt){
    if(!ifStmt) return nullptr;
    aA_ifStmt p = new aA_ifStmt_;
    p->pos = ifStmt->pos;
    p->boolExpr = aA_BoolExpr(ifStmt->boolExpr);
    for(A_codeBlockStmtList l=ifStmt->ifStmts; l; l=l->tail){
        p->ifStmts.emplace_back(aA_CodeBlockStmt(l->head));
    }
    for(A_codeBlockStmtList l=ifStmt->elseStmts; l; l=l->tail){
        p->elseStmts.emplace_back(aA_CodeBlockStmt(l->head));
    }
    return p;
}

aA_whileStmt aA_WhileStmt(A_whileStmt whileStmt){
    if(!whileStmt) return nullptr;
    aA_whileStmt p = new aA_whileStmt_;
    p->pos = whileStmt->pos;
    p->boolExpr = aA_BoolExpr(whileStmt->boolExpr);
    for(A_codeBlockStmtList l=whileStmt->whileStmts; l; l=l->tail){
        p->whileStmts.emplace_back(aA_CodeBlockStmt(l->head));
    }
    return p;
}

aA_callStmt aA_CallStmt(A_callStmt callStmt){
    if(!callStmt) return nullptr;
    aA_callStmt p = new aA_callStmt_;
    p->pos = callStmt->pos;
    p->fnCall = aA_FnCall(callStmt->fnCall);
    return p;
}

aA_returnStmt aA_ReturnStmt(A_returnStmt returnStmt){
    if(!returnStmt) return nullptr;
    aA_returnStmt p = new aA_returnStmt_;
    p->pos = returnStmt->pos;
    p->retVal = aA_RightVal(returnStmt->retVal);
    return p;
}

aA_codeBlockStmt aA_CodeBlockStmt(A_codeBlockStmt codeBlockStmt){
    if(!codeBlockStmt) return nullptr;
    aA_codeBlockStmt p = new aA_codeBlockStmt_;
    p->pos = codeBlockStmt->pos;
    p->kind = codeBlockStmt->kind;
    switch(codeBlockStmt->kind){
    case A_nullStmtKind:{
        break;
    }
    case A_varDeclStmtKind:{
        p->u.varDeclStmt = aA_VarDeclStmt(codeBlockStmt->u.varDeclStmt);
        break;
    }
    case A_assignStmtKind:{
        p->u.assignStmt = aA_AssignStmt(codeBlockStmt->u.assignStmt);
        break;
    }
    case A_callStmtKind:{
        p->u.callStmt = aA_CallStmt(codeBlockStmt->u.callStmt);
        break;
    }
    case A_ifStmtKind:{
        p->u.ifStmt = aA_IfStmt(codeBlockStmt->u.ifStmt);
        break;
    }
    case A_whileStmtKind:{
        p->u.whileStmt = aA_WhileStmt(codeBlockStmt->u.whileStmt);
        break;
    }
    case A_returnStmtKind:{
        p->u.returnStmt = aA_ReturnStmt(codeBlockStmt->u.returnStmt);
        break;
    }
    case A_continueStmtKind:{
        break;
    }
    case A_breakStmtKind:{
        break;
    }
    }
    return p;
}

aA_fnDeclStmt aA_FnDeclStmt(A_fnDeclStmt fnDeclStmt){
    if(!fnDeclStmt) return nullptr;
    aA_fnDeclStmt p = new aA_fnDeclStmt_;
    p->pos = fnDeclStmt->pos;
    p->fnDecl = aA_FnDecl(fnDeclStmt->fnDecl);
    return p;
}

aA_programElement aA_ProgramElement(A_programElement programElement){
    if(!programElement) return nullptr;
    aA_programElement p = new aA_programElement_;
    p->pos = programElement->pos;
    p->kind = programElement->kind;
    switch(programElement->kind){
    case A_programNullStmtKind:{
        break;
    }
    case A_programVarDeclStmtKind:{
        p->u.varDeclStmt = aA_VarDeclStmt(programElement->u.varDeclStmt);
        break;
    }
    case A_programStructDefKind:{
        p->u.structDef = aA_StructDef(programElement->u.structDef);
        break;
    }
    case A_programFnDeclStmtKind:{
        p->u.fnDeclStmt = aA_FnDeclStmt(programElement->u.fnDeclStmt);
        break;
    }
    case A_programFnDefKind:{
        p->u.fnDef = aA_FnDef(programElement->u.fnDef);
        break;
    }
    }
    return p;
}

aA_program aA_Program(A_program program){
    if(!program) return nullptr;
    aA_program p = new aA_program_;
    for(A_programElementList l=program->programElements; l; l=l->tail){
        p->programElements.emplace_back(aA_ProgramElement(l->head));
    }
    return p;
}