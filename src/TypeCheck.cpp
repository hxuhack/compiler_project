#include "TypeCheck.h"

//global tabels
typeMap func2retType; // function name to return type

// global token ids to type
typeMap g_token2Type;  //全局变量类型维护

// local token ids to type, since func param can override global param
typeMap funcparam_token2Type; //函数参数对应类型
vector<typeMap*> local_token2Type;  //总的局部变量类型


paramMemberMap func2Param;   // 函数名与其中所有变量的map
paramMemberMap struct2Members; // 结构体与其中所有变量的map


// private util functions
void error_print(std::ostream& out, A_pos p, string info)
{
    out << "Typecheck error in line " << p->line << ", col " << p->col << ": " << info << std::endl;
    exit(0);
}


void print_token_map(typeMap* map){
    for(auto it = map->begin(); it != map->end(); it++){
        std::cout << it->first << " : ";
        switch (it->second->type->type)
        {
        case A_dataType::A_nativeTypeKind:
            switch (it->second->type->u.nativeType)
            {
            case A_nativeType::A_intTypeKind:
                std::cout << "int";
                break;
            default:
                break;
            }
            break;
        case A_dataType::A_structTypeKind:
            std::cout << *(it->second->type->u.structType);
            break;
        default:
            break;
        }
        switch(it->second->isVarArrFunc){
            case 0:
                std::cout << " scalar";
                break;
            case 1:
                std::cout << " array";
                break;
            case 2:
                std::cout << " function";
                break;
        }
        std::cout << std::endl;
    }
}


void print_token_maps(){
    std::cout << "global token2Type:" << std::endl;
    print_token_map(&g_token2Type);
    std::cout << "local token2Type:" << std::endl;
    print_token_map(&funcparam_token2Type);
}


bool comp_aA_type(aA_type target, aA_type t){
    if(!target || !t)
        return false;
    if(target->type != t->type)
        return false;
    if(target->type == A_dataType::A_nativeTypeKind)
        if(target->u.nativeType != t->u.nativeType)
            return false;
    if(target->type == A_dataType::A_structTypeKind)
        if(target->u.structType != t->u.structType)
            return false;
    return true;
}


bool comp_tc_type(tc_type target, tc_type t){
    if(!target || !t)
        return false;
    
    // arr kind first
    if (target->isVarArrFunc && t->isVarArrFunc == 0)
        return false;
    
    // if target type is nullptr, alwayse ok
    return comp_aA_type(target->type, t->type);
}


tc_type tc_Type(aA_type t, uint isVarArrFunc){
    tc_type ret = new tc_type_;
    ret->type = t;
    ret->isVarArrFunc = isVarArrFunc;
    return ret;
}


tc_type tc_Type(aA_varDecl vd){
    if(vd->kind == A_varDeclType::A_varDeclScalarKind)
        return tc_Type(vd->u.declScalar->type, 0);
    else if(vd->kind == A_varDeclType::A_varDeclArrayKind)
        return tc_Type(vd->u.declArray->type, 1);
    return nullptr;
}


// public functions
void check_Prog(std::ostream& out, aA_program p)
{
    for (auto ele : p->programElements)
    {
        if(ele->kind == A_programVarDeclStmtKind){
            check_VarDecl(out, ele->u.varDeclStmt);
        }else if (ele->kind == A_programStructDefKind){
            check_StructDef(out, ele->u.structDef);
        }
    }
    
    for (auto ele : p->programElements){
        if(ele->kind == A_programFnDeclStmtKind){
            check_FnDeclStmt(out, ele->u.fnDeclStmt);
        }
        else if (ele->kind == A_programFnDefKind){
            check_FnDecl(out, ele->u.fnDef->fnDecl);
        }
    }

    for (auto ele : p->programElements){
        if(ele->kind == A_programFnDefKind){
            check_FnDef(out, ele->u.fnDef);
        }
        else if (ele->kind == A_programNullStmtKind){
            // do nothing
        }
    }

    out << "Typecheck passed!" << std::endl;
    return;
}


void check_VarDecl(std::ostream& out, aA_varDeclStmt vd)
{
    if (!vd)
        return;
    string name;
    tc_type varType = new tc_type_;
    if (vd->kind == A_varDeclStmtType::A_varDeclKind){
        // decl only
        aA_varDecl vdecl = vd->u.varDecl;
        if(vdecl->kind == A_varDeclType::A_varDeclScalarKind){
            name = *vdecl->u.declScalar->id;
            /* fill code here*/
            //判断新变量名是否在，若已存在则报错，不存在则向map中新增
            if (g_token2Type.find(name) != g_token2Type.end() ||
                (!local_token2Type.empty() && local_token2Type.back()->find(name) != local_token2Type.back()->end())) {
                error_print(out, vdecl->pos, "Variable name conflict: " + name);
            }
            else if(!check_struct_declared(vdecl)){
                error_print(out, vdecl->pos, "Struct not defined.");
            }
            else {
                varType->type = vdecl->u.declScalar->type;
                varType->isVarArrFunc = 0;
                if (!local_token2Type.empty()) {
                    (*local_token2Type.back())[name] = varType;
                } else {
                    g_token2Type[name] = varType;
                }
            }

        }else if (vdecl->kind == A_varDeclType::A_varDeclArrayKind){
            name = *vdecl->u.declArray->id;
            /* fill code here*/
             //判断新数组名是否在，若已存在则报错，不存在则向map中新增
            if (g_token2Type.find(name) != g_token2Type.end() ||
                (!local_token2Type.empty() && local_token2Type.back()->find(name) != local_token2Type.back()->end())) {
                error_print(out, vdecl->pos, "Array name conflict: " + name);
            } else {
                varType->type = vdecl->u.declScalar->type;
                varType->isVarArrFunc = 1;
                if (!local_token2Type.empty()) {
                    (*local_token2Type.back())[name] =  varType;
                } else {
                    g_token2Type[name] =  varType;
                }
            }
            }
    }
    else if (vd->kind == A_varDeclStmtType::A_varDefKind){
        // decl and def
        aA_varDef vdef = vd->u.varDef;
        if (vdef->kind == A_varDefType::A_varDefScalarKind){
            name = *vdef->u.defScalar->id;
            /* fill code here, allow omited type */
            //定义标量变量
            auto rValType = check_ArithExpr(out, vdef->u.defScalar->val->u.arithExpr)->type;
            if (g_token2Type.find(name) != g_token2Type.end() ||
            (!local_token2Type.empty() && local_token2Type.back()->find(name) != local_token2Type.back()->end())) {
                error_print(out, vdef->pos, "Variable " + name + " already defined in this scope!");
            } 
            else if(!comp_aA_type(vdef->u.defScalar->type,rValType)){
                error_print(out, vd->pos, name+ "Declared type dosenot match the type of rightvalue");
                }
            else{
                varType->type = vdef->u.defScalar->type;
                varType->isVarArrFunc = 0;
                // For scalar variable definitions, infer type if omitted and register the variable
                if (!local_token2Type.empty()) {
                    (*local_token2Type.back())[name] = varType;
                } else {
                    g_token2Type[name] = varType;
                }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
            }    
        }else if (vdef->kind == A_varDefType::A_varDefArrayKind){
            name = *vdef->u.defArray->id;
            /* fill code here, allow omited type */
            //定义数组变量
            auto rValType = check_ArithExpr(out, vdef->u.defScalar->val->u.arithExpr)->type;
            if (g_token2Type.find(name) != g_token2Type.end() ||
            (!local_token2Type.empty() && local_token2Type.back()->find(name) != local_token2Type.back()->end())) {
                error_print(out, vdef->pos, "Variable " + name + " already defined in this scope!");
            } 
            else if(!comp_aA_type(vdef->u.defScalar->type,rValType)){
                error_print(out, vd->pos, name+ "Declared type dosenot match the type of rightvalue");
                }
            else{
                varType->type = vdef->u.defScalar->type;
                varType->isVarArrFunc = 1;
                // For scalar variable definitions, infer type if omitted and register the variable
                if (!local_token2Type.empty()) {
                    (*local_token2Type.back())[name] = varType;
                } else {
                    g_token2Type[name] = varType;
                }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
            }   
        }
    }
    return;
}


void check_StructDef(std::ostream& out, aA_structDef sd)
{
    if (!sd)
        return;
    string name = *sd->id;
    if (struct2Members.find(name) != struct2Members.end())
        error_print(out, sd->pos, "This id is already defined!");
    struct2Members[name] = &(sd->varDecls);
    return;
}


void check_FnDecl(std::ostream& out, aA_fnDecl fd)
{
    if (!fd)
        return;
    string name = *fd->id;

    // if already declared, should match
    if (func2Param.find(name) != func2Param.end()){
        // is function ret val matches
        /* fill code here */
        if(!comp_tc_type(tc_Type(fd->type,2),func2retType[name]))
        {
            error_print(out, fd->pos, "function ret type doesn't match");
            return;
        }
        // is function params matches decl
        vector<aA_varDecl>* existingParams = func2Param[name];
        vector<aA_varDecl>  newParams = fd->paramDecl->varDecls;
        if (existingParams->size() != newParams.size()) {
            error_print(out, fd->pos, "Function parameter count mismatch!");
        } else {
            for (size_t i = 0; i < existingParams->size(); ++i) {
                if (!comp_tc_type(tc_Type((*existingParams)[i]),tc_Type(newParams[i])) ){
                    error_print(out, fd->pos, "Function parameter type mismatch at position ");
                }
            }
        }
        /* fill code here */
    }else{
        // if not defined
        /* fill code here */
         // 将新的函数声明添加到映射中
        func2retType[name] = tc_Type(fd->type, 2);
        func2Param[name] = &(fd->paramDecl->varDecls);
    }
    return;
}


void check_FnDeclStmt(std::ostream& out, aA_fnDeclStmt fd)
{
    if (!fd)
        return;
    check_FnDecl(out, fd->fnDecl);
    return;
}


void check_FnDef(std::ostream& out, aA_fnDef fd)
{
    if (!fd)
        return;
    // should match if declared
    check_FnDecl(out, fd->fnDecl);
    string fnname = *fd->fnDecl->id;
    funcparam_token2Type.clear();
    // add params to local tokenmap, func params override global ones
    for (aA_varDecl vd : fd->fnDecl->paramDecl->varDecls)
    {
        /* fill code here */
        string name = extractVariableName(vd);
        funcparam_token2Type[name] = tc_Type(vd);
    }
    local_token2Type.push_back(&funcparam_token2Type);
    func2Param[fnname] = &(fd->fnDecl->paramDecl->varDecls);
    /* fill code here */
    for (aA_codeBlockStmt stmt : fd->stmts)
    {
        check_CodeblockStmt(out, stmt);
        // return value type should match
        /* fill code here */
        // if(stmt->kind == A_codeBlockStmtType::A_returnStmtKind){
        //     if(!comp_tc_type(func2retType[fnname],tc_Type(stmt->u.returnStmt->retVal->kind,2))){

        //     }
        // }        
    }
    funcparam_token2Type.clear();
    if (local_token2Type.size() != 0)local_token2Type.pop_back();
 
    return;
}


void check_CodeblockStmt(std::ostream& out, aA_codeBlockStmt cs){
    if(!cs)
        return;
    // variables declared in a code block should not duplicate with outer ones.
    switch (cs->kind)
    {
    case A_codeBlockStmtType::A_varDeclStmtKind:
        check_VarDecl(out, cs->u.varDeclStmt);
        break;
    case A_codeBlockStmtType::A_assignStmtKind:
        check_AssignStmt(out, cs->u.assignStmt);
        break;
    case A_codeBlockStmtType::A_ifStmtKind:
        check_IfStmt(out, cs->u.ifStmt);
        break;
    case A_codeBlockStmtType::A_whileStmtKind:
        check_WhileStmt(out, cs->u.whileStmt);
        break;
    case A_codeBlockStmtType::A_callStmtKind:
        check_CallStmt(out, cs->u.callStmt);
        break;
    case A_codeBlockStmtType::A_returnStmtKind:
        check_ReturnStmt(out, cs->u.returnStmt);
        break;
    default:
        break;
    }
    return;
}


void check_AssignStmt(std::ostream& out, aA_assignStmt as){
    if(!as)
        return;
    string name;
    tc_type deduced_type; // deduced type if type is omitted at decl
    tc_type leftValType;
    deduced_type = check_rightVal(out, as->rightVal);
    switch (as->leftVal->kind)
    {
        case A_leftValType::A_varValKind:{
            name = *as->leftVal->u.id;
            /* fill code here */
            if(func2Param.find(name) != func2Param.end()){
                error_print(out, as->pos, "Cannot assign a value to a function");
                return;
            }
            leftValType = nameToType(out, as->pos, name);
        }
            break;
        case A_leftValType::A_arrValKind:{
            name = *as->leftVal->u.arrExpr->arr->u.id;
            if(func2Param.find(name) != func2Param.end()){
                error_print(out, as->pos, "Cannot assign a value to a function");
                return;
            }
            check_ArrayExpr(out, as->leftVal->u.arrExpr);
            leftValType = nameToType(out, as->leftVal->pos, name);
            leftValType->isVarArrFunc = 1;
            /* fill code here */
        }
            break;
        case A_leftValType::A_memberValKind:{
            /* fill code here */
            if(func2Param.find(name) != func2Param.end()){
                error_print(out, as->pos, "Cannot assign a value to a function");
                return;
            }
            leftValType = check_MemberExpr(out, as->leftVal->u.memberExpr);
        }
            break;
    }
    if (leftValType == nullptr){ 
        error_print(out, as->leftVal->pos, "LeftVal is not declared!");
        return;
    }
    if(leftValType->type == nullptr){
        leftValType->type = deduced_type->type;
        leftValType->isVarArrFunc = deduced_type->isVarArrFunc;
        if (funcparam_token2Type.find(name) != funcparam_token2Type.end())
            funcparam_token2Type[name]->type = deduced_type->type;
        else if (g_token2Type.find(name) != g_token2Type.end())
            g_token2Type[name]->type = deduced_type->type;
    }
    if (!comp_tc_type(leftValType, deduced_type)){
        error_print(out, as->pos, "leftval and rightval type mismatch");
        return;
    }
    return;
}


void check_ArrayExpr(std::ostream& out, aA_arrayExpr ae){
    if(!ae)
        return;
    string name = *ae->arr->u.id;
    tc_type arrayType = nameToType(out, ae->arr->pos, name);
    if (arrayType == nullptr) {
        error_print(out, ae->arr->pos, "Array" + name + "not declared!");
        return;
    }
    if (arrayType->isVarArrFunc != 1) { // Assuming 1 signifies array type
        error_print(out, ae->arr->pos, "Variable " + name + " is not an array!");
        return;
    }
    // check array name
    /* fill code here */
    
    // check index
    /* fill code here */
     if (ae->idx->kind == A_indexExprKind::A_idIndexKind){  //数字数组没有问题
        string indexTypeName = *(ae->idx->u.id);
        tc_type indexType = nameToType(out, ae->idx->pos, indexTypeName);
        if(indexType == nullptr){
            error_print(out, ae->idx->pos, "Index " + indexTypeName + " not declared!");
            return;
        }
        if(indexType->isVarArrFunc != 0){
            error_print(out, ae->idx->pos, "Index " + indexTypeName + " is not a scalar!");
            return;
        }
     }

    return;
}

 
tc_type check_MemberExpr(std::ostream& out, aA_memberExpr me){  //检查成员表达式 如a.b,a->b
    // check if the member exists and return the tyep of the member
    if(!me)
        return nullptr;
    string name = *me->structId->u.id;
    // check struct name
    /* fill code here */
    tc_type structType = nameToType(out, me->structId->pos, name);
    if (structType == nullptr) {
        error_print(out, me->structId->pos, "Struct " + name + " not declared!");
        return nullptr;
    }
    if (structType->type->type != A_dataType::A_structTypeKind) { // Assuming 2 signifies struct type
        error_print(out, me->structId->pos, "Variable " + name + " is not a struct!");
        return nullptr;
    }

    // check member name
    /* fill code here */
    string structname = *structType->type->u.structType;
    string memberId = *me->memberId;
    vector<aA_varDecl>* members = struct2Members[structname];
    bool found = false;
    for (aA_varDecl member : *members) {
        if (extractVariableName(member) == memberId) {
            found = true;
            return tc_Type(member);
        }
    }
    if (!found) {
        error_print(out, me->pos, "Member " + memberId + " not defined in struct " + name);
    }

    return nullptr;
}


void check_IfStmt(std::ostream& out, aA_ifStmt is){
    if(!is)
        return;
    check_BoolExpr(out, is->boolExpr);
    /* fill code here, take care of variable scope */
    local_token2Type.push_back(&funcparam_token2Type);
    funcparam_token2Type.clear();
    for(aA_codeBlockStmt s : is->ifStmts){
        check_CodeblockStmt(out, s);
    }
    local_token2Type.pop_back();
    funcparam_token2Type.clear();
    /* fill code here */   
    local_token2Type.push_back(&funcparam_token2Type);
    for(aA_codeBlockStmt s : is->elseStmts){
        check_CodeblockStmt(out, s);
    }   
    local_token2Type.pop_back();
    funcparam_token2Type.clear();
    /* fill code here */
    return;
}


void check_BoolExpr(std::ostream& out, aA_boolExpr be){
    if(!be)
        return;
    switch (be->kind)
    {
    case A_boolExprType::A_boolBiOpExprKind:
        check_BoolExpr(out, be->u.boolBiOpExpr->left);
        check_BoolExpr(out, be->u.boolBiOpExpr->right);
        break;
    case A_boolExprType::A_boolUnitKind:
        check_BoolUnit(out, be->u.boolUnit);
        break;
    default:
        break;
    }
    return;
}


void check_BoolUnit(std::ostream& out, aA_boolUnit bu){
    if(!bu)
        return;
    switch (bu->kind)
    {
        case A_boolUnitType::A_comOpExprKind:{
            /* fill code here */
            tc_type leftType = check_ExprUnit(out, bu->u.comExpr->left);
            tc_type rightType = check_ExprUnit(out, bu->u.comExpr->right);
            if(!comp_tc_type(leftType, rightType)){
                error_print(out, bu->pos, "Left and right type mismatch in comparison operation!");
            }
        }
            break;
        case A_boolUnitType::A_boolExprKind:
            check_BoolExpr(out, bu->u.boolExpr);
            break;
        case A_boolUnitType::A_boolUOpExprKind:
            check_BoolUnit(out, bu->u.boolUOpExpr->cond);
            break;
        default:
            break;
    }
    return;
}


tc_type check_ExprUnit(std::ostream& out, aA_exprUnit eu){
    // return the aA_type of expr eu
    if(!eu)
        return nullptr;
    tc_type ret;
    switch (eu->kind)
    {
        case A_exprUnitType::A_idExprKind:{
            /* fill code here */
            string name = *eu->u.id;
            ret = nameToType(out, eu->pos, name);
            if (ret == nullptr) {
                error_print(out, eu->pos, "Variable " + name + " not declared!");
            }
            return ret;
        }
            break;
        case A_exprUnitType::A_numExprKind:{
            aA_type numt = new aA_type_;
            numt->pos = eu->pos;
            numt->type = A_dataType::A_nativeTypeKind;
            numt->u.nativeType = A_nativeType::A_intTypeKind;
            ret = tc_Type(numt, 0);
        }
            break;
        case A_exprUnitType::A_fnCallKind:{
            check_FuncCall(out, eu->u.callExpr);
            // check_FuncCall will check if the function is defined
            /* fill code here */
            string name = *eu->u.callExpr->fn;
            ret = func2retType[name];
            if(ret == nullptr){
                error_print(out, eu->pos, "Function " + name + " not declared!");
            }
            return ret;
        }
            break;
        case A_exprUnitType::A_arrayExprKind:{
            check_ArrayExpr(out, eu->u.arrayExpr);
            /* fill code here */
        }
            break; 
        case A_exprUnitType::A_memberExprKind:{
            ret = check_MemberExpr(out, eu->u.memberExpr);
        }
            break;
        case A_exprUnitType::A_arithExprKind:{
            ret = check_ArithExpr(out, eu->u.arithExpr);
        }
            break;
        case A_exprUnitType::A_arithUExprKind:{
            ret = check_ExprUnit(out, eu->u.arithUExpr->expr);
        }
            break;
    }
    return ret;
}


tc_type check_ArithExpr(std::ostream& out, aA_arithExpr ae){
    if(!ae)
        return nullptr;
    tc_type ret;
    switch (ae->kind)
    {
        case A_arithExprType::A_arithBiOpExprKind:{
            ret = check_ArithExpr(out, ae->u.arithBiOpExpr->left);
            tc_type rightTyep = check_ArithExpr(out, ae->u.arithBiOpExpr->right);
            if(ret->type->type > 0 || ret->type->type != A_dataType::A_nativeTypeKind || ret->type->u.nativeType != A_nativeType::A_intTypeKind ||
            rightTyep->type->type > 0 || rightTyep->type->type != A_dataType::A_nativeTypeKind || rightTyep->type->u.nativeType != A_nativeType::A_intTypeKind)
                error_print(out, ae->pos, "Only int can be arithmetic expression operation values!");
        }
            break;
        case A_arithExprType::A_exprUnitKind:
            ret = check_ExprUnit(out, ae->u.exprUnit);
            break;
    }
    return ret;
}


void check_FuncCall(std::ostream& out, aA_fnCall fc){
    if(!fc)
        return;
    // check if function defined
    string func_name = *fc->fn;
    /* fill code here */
    if (func2Param.find(func_name) == func2Param.end()) {
        error_print(out, fc->pos, "Function '" + func_name + "' not defined.");
        return;
    }
    
    vector<aA_varDecl>* expectedParams = func2Param[func_name]; // 预期的参数类型列表
    vector<aA_rightVal> actualParams = fc->vals; // 实际调用中提供的参数列表
    // check if parameter list matches
    for(int i = 0; i < fc->vals.size(); i++){
        /* fill code here */
        tc_type actualType = check_rightVal(out, actualParams[i]);
        if (!comp_tc_type(tc_Type((*expectedParams)[i]), actualType)) {
            error_print(out, fc->pos, "Function call parameter type mismatch");
        }
        
    }
    return ;
}


void check_WhileStmt(std::ostream& out, aA_whileStmt ws){
    if(!ws)
        return;
    check_BoolExpr(out, ws->boolExpr);
    /* fill code here, take care of variable scope */
    local_token2Type.push_back(new typeMap);
    for(aA_codeBlockStmt s : ws->whileStmts){
        check_CodeblockStmt(out, s);
    }
    /* fill code here */
    delete local_token2Type.back();  // 假设使用 new 创建了 typeMap
    local_token2Type.pop_back();
    return;
}


void check_CallStmt(std::ostream& out, aA_callStmt cs){
    if(!cs)
        return;
    check_FuncCall(out, cs->fnCall);
    return;
}


void check_ReturnStmt(std::ostream& out, aA_returnStmt rs){
    if(!rs)
        return;
    return;
}






string extractVariableName(aA_varDecl varDecl)
{
    if (varDecl == nullptr)
        return "";  
    switch (varDecl->kind) {
        case A_varDeclType::A_varDeclArrayKind:
            return *(varDecl->u.declArray->id);
        case A_varDeclType::A_varDeclScalarKind:
            return *(varDecl->u.declScalar->id);
        default:
            break;
    }
    return "";  
}


tc_type nameToType(std::ostream &out, A_pos pos, string id)
{
    if (funcparam_token2Type.find(id) != funcparam_token2Type.end())
        return funcparam_token2Type[id];
    
    for (int i = local_token2Type.size() - 1; i >= 0; --i) {
        typeMap* currentScope = local_token2Type[i];
        if(currentScope->find(id) != currentScope->end())
            return (*currentScope)[id];
    }
    if (g_token2Type.find(id) != g_token2Type.end())
        return g_token2Type[id];
    if (func2Param.find(id) != func2Param.end())
        error_print(out, pos, "cannot assign a value to a function");
    return nullptr;
}

tc_type check_rightVal(std::ostream &out, aA_rightVal rightVal)
{
    if (rightVal == nullptr)
        return nullptr;
    if (rightVal->kind == A_rightValType::A_arithExprValKind)
    {
        return check_ArithExpr(out, rightVal->u.arithExpr);
    }
    return nullptr;
}


bool check_struct_declared(aA_varDecl varDecl) {   //检查声明的struct是否存在
    if(varDecl->kind == A_varDeclType::A_varDeclScalarKind){
        if(varDecl->u.declScalar->type->type == A_dataType::A_structTypeKind){
            if(struct2Members.find(*(varDecl->u.declScalar->type->u.structType)) == struct2Members.end()){
                return false;
            }
        }
        return true;
    }
    else if(varDecl->kind == A_varDeclType::A_varDeclArrayKind){
        if(varDecl->u.declArray->type->type == A_dataType::A_structTypeKind){
            if(struct2Members.find(*(varDecl->u.declArray->type->u.structType)) == struct2Members.end()){
                return false;
            }
        }
        return true;
    }
}