<center><h1>编译原理实验：Assignment 2</h1></center>

<center>指导老师：徐辉</center>
<center>助教：倪雯倩 陈实立 董方
崔漠寒 王兆瀚 柏露 张业鸿</center>
<center>2023 年秋季学期</center>

## 实验介绍

Assignment 2 的目标是实现 TeaPL 的语法分析最终得到抽象语法树。在本实验中，输入是 TeaPL 的源代码，输出是 TeaPL 的抽象语法树。我们将得到抽象语法树打印出来以检查程序的正确性。

### 实验工作流

本次实验的工作流在 `compiler.cpp` 中可以清楚的看到：我们首先调用 `yyparse` 来生成我们的抽象语法树（在 `TeaplAst.h` 中定义，这是一个 C 风格的定义（方便接入 lex 和 yacc）），然后我们调用 `aA_Program` 将抽象语法树转换为使用 STL 的定义（为了方便后续的实验），最后调用 `print_aA_Program` 将转换后的语法树打印出来。

### 文件介绍

- `compiler.cpp` 

    main 函数所在的文件，能够体现实验的总体流程

- `lexer.lex` 

    lexer，需要补全其中的代码以完成本次实验

- `Makefile` 

    输入 make 进行测试，输入 make clean 清除生成的文件

- `parser.yacc` 

    parser，需要补全其中的代码以完成本次实验

- `compiler.cpp` 

    main 函数所在的文件，能够体现实验的总体流程

- `PrintTeaplaAst.h` 

    输出语法树的代码

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

需要补全 `lexer.lex` 和 `parser.yacc` 中的代码以完成本次实验（补全代码后可以直接 make 进行测试）。

### 实验提交

提交格式：提交命名如`20307110078.zip`的压缩包（直接将本次实验的文件夹打包即可，不要随意更改实验代码的目录结构）

### 评分说明

评分时会替换掉 `tests` 文件夹，使用隐藏测试检查代码的正确性，按照通过的测试点数目进行给分。
