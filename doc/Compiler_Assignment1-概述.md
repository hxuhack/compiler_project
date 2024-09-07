<center><h1>编译原理实验：Assignment 1</h1></center>

## 实验介绍

Assignment 1的目标是实现TeaPL的语法分析最终得到抽象语法树。在本实验中，输入是TeaPL的源代码，输出是TeaPL的抽象语法树。我们将得到抽象语法树打印出来以检查程序的正确性。

### 实验工作流

本次实验的工作流在`compiler.cpp`中可以清楚的看到：我们首先调用`yyparse`来生成我们的抽象语法树（在`TeaplAst.h`中定义，这是一个C风格的定义（方便接入lex和yacc），然后我们调用`aA_Program`将抽象语法树转换为使用STL的定义（为了方便后续的实验），最后调用`print_aA_Program`将转换后的语法树打印出来。

其中，本实验中需要大家完成的部分为使用lex和yacc描述出`yylex`和`yyparse`（即补全`lexer.lex`和`parser.yacc`）以实现语法解析。具体来说lex和yacc在进行语法解析时，工作流程如下：

![img](https://chuquan-public-r-001.oss-cn-shanghai.aliyuncs.com/sketch-images/yacc-01.png?x-oss-process=image/resize,w_800)

`lexer.lex`对输入的终结符进行简单处理，然后向`parser.yacc`返回`token`，`parser.yacc`则以`token`为输入，根据每个语法规则进行解析，最后构建出AST。

在上述过程中，`token`的确定是一个值得思考的思考的问题。对于大多数终结符，我们直接将其当作`token`（例如：+,-,*,/）；然而对于字母和数字，其在语法中通常只能被规约为`id`或`num`（例如：`id := [a-z_A-Z][a-z_A-Z0-9]*`，`num := [1-9][0-9]* | 0`），且该生成式可以写成正则表达式，此时，由于lex中可以方便地编写正则表达式，因此通常将`id`和`num`也作为`token`（直接在lex中处理），使得`parser.yacc`的编写更加简洁。

### 文件介绍

- `compiler.cpp` 

    main 函数所在的文件，能够体现实验的总体流程

- `lexer.lex` 

    lexer，需要补全其中的代码以完成本次实验

- `Makefile` 

    输入`make`进行测试，输入`make clean`清除生成的文件（建议同学们理解`Makefile`中的内容，可以直接让GPT解释）

- `parser.yacc` 

    parser，需要补全其中的代码以完成本次实验

- `PrintTeaplaAst.h` 

    `PrintTeaplaAst.cpp` 的头文件，存放函数定义

- `PrintTeaplaAst.cpp` 

    用于输出语法树

- `TeaplaAst.h` 

    使用 STL 的语法树定义

- `TeaplaAst.cpp` 

    用于将 `TeaplAst.h` 中定义的语法树转换为 `TeaplaAst.h` 中定义的语法树

- `TeaplAst.h` 

    C 风格的语法树定义

- `TeaplAst.cpp` 

    用于构造 `TeaplAst.h` 中定义的语法树

## 实验要求

需要补全`lexer.lex`和`parser.yacc`中的代码以完成本次实验（补全代码后可以直接`make`进行测试）。

### 实验验收

10月10日实验课上验收，验收时执行`make`即可，助教会记录每位同学通过的测试点数目及yacc中的冲突数目，按照通过的测试点数目及yacc中的冲突数目进行给分。

### 关于提问

请在[仓库](https://github.com/hxuhack/compiler_project)上提issue🤗

### 实验提交

本次实验除了验收还需要在elearning上提交代码，提交代码时直接将仓库打包即可，命名方式为学号-姓名，例如`20307110078-陈实立.zip`（组队的同学可命名为`20307110077-陈实力_20307110079-陈实丽.zip`）

### 关于迟交

本次（以及后续）作业的迟交得分标准为：迟交48小时以内在得分基础上\*90%，超过48小时但在72小时以内在得分基础上\*80%

迟交同学需要自行与负责对应实验的助教约定验收时间！
