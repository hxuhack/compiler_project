<center><h1>编译原理Assignment 1实验指南</h1></center>

Lex + Yacc是一套代码生成器，可生成C代码；该C代码的输入是target language的源代码，会按你写的规则来解析源代码并构建出AST。

词法分析的文件是`lexer.lex`，语法分析的文件是`parser.yacc`。虽然编译的步骤是先进行词法分析，但编写解析规则时却不是先写`lexer.lex`。

这两个文件都分为三个部分，两个部分之间用两个百分号`%%`隔开：

```yacc
声明部分
%%
规则部分
%%
辅助函数
```

本文档将使用以下文法作为例子：

```cfg
identifier -> [a-z_A-Z][a-z_A-Z0-9]*
number -> [1-9][0-9]* | 0
expr -> number | identifier | (expr + expr) | (expr * expr)
```

## Step 0 环境配置

这里默认大家已经有一个Ubuntu环境（**注意：使用Mac Apple Silicon芯片（M1，M2，M3，M4）的同学建议在docker中配置Ubuntu环境，具体方法可以参考[张涵星助教写的文档](Docker使用.pdf)**），打开终端，执行以下命令：

```shell
$ sudo apt-get install flex bison
```

部分系统可能还需要手动安装gcc、make等，但这里默认大家已经使用过这些工具。

完成安装后可以通过以下命令进行测试：

```shell
$ lex --version # 查看版本，若出现版本信息则说明安装成功
$ yacc --version # 查看版本，若出现版本信息则说明安装成功    
```

本实验的`Makefile`中选择`clang`为编译器，因此没有安装`clang`的同学需要先安装`clang`（后续实验还会用到`llvm`因此在这里一并给出安装的指令）：

```shell
$ sudo apt-get install llvm
$ sudo apt-get install clang
```

安装完成后可以通过以下命令进行测试：

```shell
$ clang -v # 查看版本，若出现版本信息则说明安装成功
$ lli --version # 查看版本，若出现版本信息则说明安装成功
```

## Step 1   确定终结符、非终结符 、token

根据文法，可以确定终结符与非终结符。对于上述文法，一位数字、字母和运算符是终结符，`identifier`、`number`和`expr`是非终结符。

`lexer.lex`以终结符为输入，向`parser.yacc`返回`token`，可以把`token`理解为“词”。`parser.yacc`则以`token`为输入，根据每个非终结符的规则进行解析，最后构建出AST。

但`lexer.lex`解析的`token`可以不是终结符，比如一个`identifier`可以是一个`token`，但你也可以把字母当作`token`。推荐把`identifier`和`number`当作`token`，这样可以在lex中完成组装数字或变量的工作，让yacc更简洁。

## Step 2   yacc 声明

`token`在`parser.yacc`的声明部分定义，因此应该先写yacc的声明部分，再写lex，并且`lexer.lex`的开头也要导入yacc编译出的`y.tab.h`库。

给token和非终结符分类，可以是数字类或抽象类，单个字符可以也不定义而直接作为char返回。大多数情况下，导入`TeaplAst.h`，然后使用AST中的节点结构体就是不错的选择。

将它们的名字和类别名按以下的格式写入`parser.yacc`的声明部分：

```parser.yacc
%union
{
    int token; // 例：数字类
    A_exp expr; // 例：自定义的类
}

// token的类
// %token <name in union> token_name_1 token_name_2
%token <token> OP_PLUS OP_MULTIPLY
%token <token> NUMBER
%token <expr> IDENTIFIER

// 非终结符的类
%type <expr> EXPR
```

## Step 3   编写 lexer 规则

在`lexer.lex`的规则部分添加lexer规则。

每条规则的形式：`正则表达式 { C代码 }`

这部分的C代码一般做两件事：

- 对`yylval`进行赋值。`yylval`的类型是上面写的union，用来记录这个token的内容。
- `return token_name;` 返回token的名字。

你可以在用户自定义函数部分定义新的函数，例如用来拼接数字的`calc`函数。

```lexer.lex
%{

#include "util.h"
#include "TeaplAst.h"
#include "y.tab.h"

int c;

%}

%%

" " ;
"+" { yylval.token = OP_PLUS; return OP_PLUS; }
"*" { yylval.token = OP_MULTIPLY; return OP_MULTIPLY; }
"(" | ")" {
    c = yytext[0];
    return(c);
}
[a-z_A-Z][a-z_A-Z0-9]* { 
    yylval.expr = A_IdExp(strdup(yytext));
    return IDENTIFIER;
}
[1-9][0-9]* {
    yylval.token = calc(yytext, yyleng);
    return NUMBER;
}
0 {
    yylval.token = 0;
    return NUMBER;
}
. {
    printf("Illegal input \"%c\"\n", yytext[0]);
}
%%


int calc(char *s, int len) {
    int ret = 0;
    for(int i = 1; i < len; i++)
        ret = ret * 10 + (s[i] - '0');
    return ret;
}
```

需要注意两点：

- lex规则有优先级：优先匹配最长的，再匹配靠前的规则。
- 这里用了`yytext`和`yyleng`。从上下文可以看出，它们分别表示匹配到的子串的内容和长度。还有一些 yy 开头的变量，你可以在`lex lexer.lex -o lexer.c`后查看（现在还不能执行这个）。需要注意的是，这里`yytext`的类型是`char *`，且该指针随着lex读入字符而改变。因此，在组装`identifier`时需要将`yytext`指向的字符串复制到一块堆上的内存，故上述代码中组装`identifier`时使用了`strdup`。

## Step 4   编写 yacc 规则

在`parser.y`的规则部分添加yacc规则。

yacc规则的形式是：`非终结符名字 : 导出式 { 规约时执行的语义动作 } | 其他导出式`

其中：

- 规约时执行的语义动作采用C语言编写，在构造语法树时，该语义动作通常为根据导出式生成非终结符的语法树节点。
- `$$`表示返回值，没有显式的`return`语句。返回值类型需与非终结符名字的类型一致。
- `$1`表示导出式的第几部分，从1开始编号。
- 例如，下面代码含义为：

```yacc
EXPR: NUMBER
      {
          $$ = A_NumExp($1)
      } 
```

在根据文法规则`EXPR->NUMBER`进行规约时将非终结符`EXPR`赋值为`A_NumExp(NUMBER)`（`$$`对应`EXPR`，`$1`对应`NUMBER`）。

`parser.yacc`代码续：

```parser
%%
EXPR: NUMBER
      {
          $$ = A_NumExp($1)
      } 
      | 
      IDENTIFIER 
      {
          $$ = $1
      }
      |
      "(" EXPR OP_PLUS EXPR ")" 
      {
          $$ = A_OpExp($2, A_plus, $4);
      } 
      | 
      "(" EXPR OP_MULTIPLY EXPR ")" 
      {
          $$ = A_OpExp($2, A_times, $4);
      }
%%
```

## Step 5   yacc库中其他接口

编译`parser.yacc`时，yacc会根据我们写的规则生成C语言的 parser 代码，其中可能涉及几个常用的yacc库接口。为了保证编译成功，我们需要在yacc的声明部分声明以下外部接口：

```c
extern int yylex();
extern void yyerror(char*);
extern int  yywrap();
```

再在结尾的辅助函数部分增加以下代码：

```c
void yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
}

int yywrap()
{
  return(1);
}
```

## Step 6   编译parser和lexer

```shell
yacc -d parser.yacc  # 用yacc生成parser代码
yacc --help          # 查看yacc使用帮助
lex lexer.lex        # 用lex生成lexer代码，需要确保lexer中已经添加了parser库 
```

## Step 7   使用这些生成的代码

在主程序中调用`yyparse()`。`yyparse()`从`stdin`中读取源代码，然后执行lexer和parser的工作。这个函数不会返回AST的root，所以需要在`parser.yacc`中添加一个`extern A_exp root;`然后在yacc规则中赋值使用。

如果你的`main`从`argv`中读取文件名，可以用`freopen(filename, "r", stdin);`。

## Step 8   lex和yacc的debug

lex的debug可以在结尾增加这样一个通配的正则表达式，将未被识别的字符打印出来：

```lexer.lex
. {
    printf("Illegal input \"%c\"\n", yytext[0]);
}
```

yacc的debug可以使用自带的debug模式，在该模式下yacc会输出其语法解析的过程：

1. 在yacc开头的定义部分增加`extern int yydebug=1`

2. 运行`yacc a.yacc -d -v --debug`，这一步相当于生成了一个debug版本的C代码，所以要回到正常模式，使用`yacc a.yacc`等语句正常编译，或删除yydebug标识重新编译即可。

3. 正常make

（在我们的实验中只需将`compiler.cpp`中的`YACCDEBUG`宏打开，即可开启yacc的debug模式）

## 补充1 处理注释——使用Lex的状态

单纯使用正则表达式处理注释会非常复杂，因此Lex提供了状态机制。

Lex规则的完整形式为：`<状态>正则表达式 { C代码 }`。初始状态为 `INITIAL`，未标注状态的规则在所有状态下都生效（所以如果你希望规则仅在 `INITIAL` 状态下生效，需要在规则前面标注 `<INITIAL>`）。

状态在声明部分声明，格式为`%start 状态名`，例如声明两个状态用于处理两类注释：

```lex
%start COMMENT1 COMMENT2
```

转为某个状态的指令为`BEGIN 状态名`，例如遇到`//`，转入`COMMENT1`状态处理注释：

```lex
"//" {  BEGIN COMMENT1;  }
```

注释结束后，返回`INITIAL`状态继续处理源代码：

```lex
<COMMENT1>"\n" {  BEGIN INITIAL;  }
```

## 补充2 检查并消除yacc中的冲突——使用优先级与结合性

如果在执行`make`后，输出中有如下字样则说明yacc中存在冲突：

```
yacc -o y.tab.cpp -d parser.yacc -v --debug
parser.yacc: warning: 16 shift/reduce conflicts [-Wconflicts-sr]
```

上面输出中的第二行表明你的`parser.yacc`中描述的语法规则存在16个shift/reduce冲突。

为了看到发生的冲突语法，我们可以查看`y.output`文件（该文件由yacc生成）。

如果语法中存在冲突，则`y.output`文件开头会标出发生冲突的状态（这里的状态指解析文法的自动机的状态）：

```
State 126 conflicts: 4 shift/reduce
State 127 conflicts: 4 shift/reduce
State 128 conflicts: 4 shift/reduce
State 129 conflicts: 4 shift/reduce
```

此时，我们可以在`y.output`中搜索对应的状态，查看冲突，例如：

```
State 126

    9 ArithExpr: ArithExpr . ADD ArithExpr
    9          | ArithExpr ADD ArithExpr .
   10          | ArithExpr . SUB ArithExpr
   11          | ArithExpr . MUL ArithExpr
   12          | ArithExpr . DIV ArithExpr

    ADD  shift, and go to state 91
    SUB  shift, and go to state 92
    MUL  shift, and go to state 93
    DIV  shift, and go to state 94

    ADD       [reduce using rule 9 (ArithExpr)]
    SUB       [reduce using rule 9 (ArithExpr)]
    MUL       [reduce using rule 9 (ArithExpr)]
    DIV       [reduce using rule 9 (ArithExpr)]
    $default  reduce using rule 9 (ArithExpr)
```

这表明，在`State 126`时，如果下一个终结符是`ADD`，该语法可以选择shift，并转移到自动机的状态91(`ArithExpr . ADD ArithExpr`)；也可以选择使用规则9进行reduce(`ArithExpr ADD ArithExpr .`)，导致了shift和reduce的冲突。

我们可以通过规定`ADD`的结合性来解决这一冲突。在C语言中`ADD`是左结合，我们将`ADD`规定为左结合后，在`State 126`时，如果下一个终结符是`ADD`，此时根据结合性，自动机会使用规则9进行reduce(`ArithExpr ADD ArithExpr .`)，不会产生冲突。

消除冲突的手段一般有：重写语法、规定优先级和结合性。我们TeaPL的语法中本身不存在很多冲突，实验中遇到的冲突基本可以通过规定优先级和结合性解决。

**注：TeaPL中运算符的优先级和结合性与[C语言中的优先级和结合性](https://c-cpp.com/c/language/operator_precedence)相同。**（实际上，如果你已经按照[C语言中的优先级和结合性](https://c-cpp.com/c/language/operator_precedence)为`token`规定好了优先级和结合性，你甚至不会遇到任何冲突。）

优先级与结合性的具体使用方法如下：

在`parser.yacc`的声明部分添加：

```parser.yacc
%left '+' '-'
%left '*' '/'
%left UMINUS
```

`%`后面的结合性可以是： left 左结合、right 右结合、nonassoc 不结合。

声明越靠下的符号优先级越高。没有运算符或运算符无法区分的规则，也可以通过在规则后增加`%prec`规定其优先级，例如负号和减法可如下处理：

```parser
exp '-' exp
{
    $$ = A_OpExp($1, A_minus, $3);
}
|
'-' exp %prec UMINUS
{
    $$ = A_OpExp(A_NumExp(0), A_minus, $2);
}
```

使用`yacc -v parser.yacc`指令编译，可以获得`y.output`文件，包含 Yacc 的状态信息。

## 补充3 维护位置信息

为了衔接实验二 类型检查，我们在语法树中需要维护每个节点的终结符位置信息，方便在报错时输出位置信息，便于用户修改语法错误。记录位置信息的操作如下：

首先我们在`parser.yacc`中的声明部分中加入关于位置信息的声明：

```yacc
%union {
  A_pos pos; // 位置信息
  A_tokenId tokenId;
  A_tokenNum tokenNum;
  A_type type;
  ...
}
```

其次，在Lex中生成终结符时，我们需要将位置信息通过`yylval`传给Yacc，并更新位置信息。

```lex
<INITIAL>"+" { yylval.pos = A_Pos(line, col); ++col; return ADD; }
<INITIAL>"*" { yylval.pos = A_Pos(line, col); ++col; return MUL; }
<INITIAL>"-" { yylval.pos = A_Pos(line, col); ++col; return SUB; }
<INITIAL>"/" { yylval.pos = A_Pos(line, col); ++col; return DIV; }
```

最后，Yacc接受位置信息后，将位置信息记录在语法树中。

```yacc
ArithExpr: ArithExpr ADD ArithExpr
{
  $$ = A_ArithBiOp_Expr($1->pos, A_ArithBiOpExpr($1->pos, A_add, $1, $3));
}
| ArithExpr SUB ArithExpr
{
  $$ = A_ArithBiOp_Expr($1->pos, A_ArithBiOpExpr($1->pos, A_sub, $1, $3));
}
| ArithExpr MUL ArithExpr
{
  $$ = A_ArithBiOp_Expr($1->pos, A_ArithBiOpExpr($1->pos, A_mul, $1, $3));
}
| ArithExpr DIV ArithExpr
{
  $$ = A_ArithBiOp_Expr($1->pos, A_ArithBiOpExpr($1->pos, A_div, $1, $3));
}
| ExprUnit
{
  $$ = A_ExprUnit($1->pos, $1);
}
;
```

Lex中特殊符号的处理：代码中难免会包含空格、`\n`、`\t`等特殊符号，我们编写的Lex规则应接收这些符号，但不需要返回token给Yacc，只更新位置信息即可。
