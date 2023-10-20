CXX = clang++
CXXFLAGS = -std=c++17 -g

TESTCASE_DIR := tests
TESTCASES = $(wildcard $(TESTCASE_DIR)/*.tea)
LLFILES = $(patsubst $(TESTCASE_DIR)/%.tea,$(TESTCASE_DIR)/%.ast,$(TESTCASES))

.SECONDARY: $(LLFILES)

run: $(patsubst $(TESTCASE_DIR)/%.tea,$(TESTCASE_DIR)/%.ast,$(TESTCASES))

$(TESTCASE_DIR)/%.ast: $(TESTCASE_DIR)/%.tea compiler
	@./compiler $< $@

compiler: y.tab.o lex.yy.o TypeCheck.o TeaplAst.o TeaplaAst.o PrintTeaplaAst.o compiler.o 
	$(CXX) $(CXXFLAGS) -o compiler $^ 

y.tab.cpp: parser.yacc TeaplAst.h 
#	yacc --verbose --debug -d $< -o y.tab.cpp
	yacc -o y.tab.cpp -d $< -v --debug

y.tab.hpp: parser.yacc
#	yacc --verbose --debug -d $< -o y.tab.cpp
	yacc -o y.tab.cpp -d $< -v --debug

lex.yy.cpp: lexer.lex y.tab.hpp y.tab.cpp
	lex -o lex.yy.cpp $< 

y.tab.o: y.tab.cpp y.tab.hpp
	$(CXX) $(CXXFLAGS) -c $<

lex.yy.o: lex.yy.cpp y.tab.hpp
	$(CXX) $(CXXFLAGS) -c $<

TypeCheck.o: TypeCheck.cpp TypeCheck.h
	$(CXX) $(CXXFLAGS) -c $<

TeaplAst.o: TeaplAst.cpp TeaplAst.h
	$(CXX) $(CXXFLAGS) -c $<

TeaplaAst.o: TeaplaAst.cpp TeaplaAst.h
	$(CXX) $(CXXFLAGS) -c $<

PrintTeaplaAst.o: PrintTeaplaAst.cpp PrintTeaplaAst.h
	$(CXX) $(CXXFLAGS) -c $<

compiler.o: compiler.cpp TeaplAst.o TeaplaAst.o PrintTeaplaAst.o y.tab.o lex.yy.o
	$(CXX) $(CXXFLAGS) -c $<

clean:
	rm *.o *.output y.tab.cpp y.tab.hpp lex.yy.cpp compiler tests/*.ast
