# 实验三：类型检查

### 实验目标

在生成AST后，对程序进行类型检查。检测到错误时，输出错误所在的位置和错误内容。

### 实验环境

本次实验的环境和实验二相同。__你需要首先将你在实验二中实现的 `parser.yacc`、`lexer.lex` 文件 copy 到本目录__ ，然后在本目录下运行

```
make
```

编译所有文件，并对所有 testcase 进行测试。在你开始编写本作业的代码之前，可以运行 make 确认你的环境和实验二的实现是否准备好了。

### 语法更新

本次实验相较于实验二，更新了逻辑运算结合优先级的语法，具体如下：

1. `boolUnit := <(> exprUnit comOp exprUnit <)> -> boolUnit := exprUnit comOp exprUnit`

2. `boolExpr := boolExpr boolBiOp boolUnit -> boolExpr := boolExpr boolBiOp boolExpr` （boolBiOp 中，&& 的优先级高于 ||）

在开始本次实验前，建议先把上述更新实现到你的 parser 和 lexer 里；否则，由于 ast 文件也进行了相应更新，可能会无法编译通过。

### 上手

在 `compiler.cpp` 里可以看到，生成 AST 后调用 `check_Prog` 进行类型检查，你在 `check_Prog` 函数中拿到的即是整个程序的 AST 的 root。`TypeCheck.h` 和 `TypeCheck.cpp` 是本次实验需要编辑的文件，里面已经定义了一些数据结构和函数，给出了类型检查的整体框架。如果出现了类型检查错误，请输出错误的位置和原因。`TypeCheck.cpp` 里提供了一个 `error_print` 函数，你可以使用它输出错误信息然后退出程序。

本次实验的 `PrintTeaplaAst.cpp` 进行了更新，在你 `make` 之后，会在 `test/` 目录下同时打印出树结构的代码 AST，如
```
A_program 
	|--A_programElement 
		|--A_fnDef 
			|--A_fnDecl fn foo1(
				|--A_paramDecl 
					|--A_varDecl 
						|--A_varDeclScalar a:
						|--A_type int, 
					|--A_varDecl 
						|--A_varDeclScalar b:
						|--A_type int)->
			|--A_type int{

			|--A_codeBlockStmt 
				|--A_returnStmt ret 
				|--A_rightVal 
					|--A_arithExpr 
						|--A_exprUnit 
							|--A_fnCall foo2(
							|--A_rightVal 
								|--A_arithExpr 
									|--A_exprUnit b, 
							|--A_rightVal 
								|--A_arithExpr 
									|--A_exprUnit a);
```
可以使用这个输出来帮助你更直观地了解你拿到的 root 里是怎样的数据结构，提高你编码和debug的效率。

如果需要额外的数据结构或者函数定义，可以自行设计。

### 类型检查规则
以下是本次实验的测试用例遵循的类型检查规则。

- 不需要支持变量声明时的类型推断。如：
```
let a = 5;
```
和
```
let a;
let b:int = 10;
a = b;
```
只需要支持明确提供类型的变量声明，如：
```
let a:int = 5;
```
在测试用例中，变量在声明的同时一定指出了其类型。

- 函数声明和全局变量声明不关注位置。即，下述代码应当通过类型检查：

```
fn foo1(a:int, b:int)->int{
    ret foo2(b, a);
}

fn foo2(a:int, b:int)->int{
    ret a * x + b;
}

let x:int = 25;
```
但声明的全局变量引用了其他全局变量时，被引用的全局变量必须在被引用之前声明。即下述代码
```
let x:int = a + 5;
let a:int = 5;
```
应当报告变量未定义错误。

- 局部变量不能与任何位置的全局变量重名；函数参数在函数作用域内优先于全局变量：
```
let a:int = 5;
let b:int = 10;

fn foo(a:int)->int{
    ret a + b;
}
```
上述代码应当通过。其中函数 `foo` 中引用的 `a` 是函数参数，`b`是全局变量。但
```
let a:int = 203;
let b:int = 713;

fn foo(a:int)->int{
    let b:int = 10;
    ret a + b;
}
```
应当报告重复定义变量的问题。

- 对已经声明过的函数，定义时可以缺省参数列表，但声明需要在定义之前。即
```
fn foo(a:int, b:int)->int;

fn foo()->int{
    ret a + b;
}
```
是可以通过的，而
```
fn foo()->int{
    ret a + b;
}

fn foo(a:int, b:int)->int;
```
应当报告变量未定义的错误。

- 注意作用域的嵌套和并列。如
```
fn foo(a:int, b:int)->int{
    if((a < b)){
        let i:int = 10;
        while((i > 0)){
            let j:int = i - 1;
            while(j > 0){
                j = j - 1;
            }
            i = i - 1;
        }
        let j:int = a * b;
    }
    let i = b - a;
}
```
应当通过。离开一个局部变量的作用域后，它的 ID 就可以被重新利用了。这也意味着，离开它的作用域后，再引用它就应当报告变量未定义错误了。
### 测试

测试样例在 `tests/` 文件中，其中每个文件的末尾都以注释的形式提供了参考输出。直接在工程目录下运行 `make` 即可测试所有测试用例。

### 提交和评分

以学号命名提交压缩包，如 `22110240012.zip`。评分时会使用更多测试用例进行测试，按通过的测试数量进行评分。
