CXX = clang++
CXXFLAGS = -std=c++17 -g 

TESTCASE_DIR := tests/public
# TESTCASE_DIR := tests/private
TESTCASES = $(wildcard $(TESTCASE_DIR)/*.tea)
LLFILES = $(patsubst $(TESTCASE_DIR)/%.tea,$(TESTCASE_DIR)/%.ast,$(TESTCASES))

.SECONDARY: $(LLFILES)

run: $(patsubst $(TESTCASE_DIR)/%.tea,$(TESTCASE_DIR)/%.ll,$(TESTCASES))

$(TESTCASE_DIR)/%.ll: $(TESTCASE_DIR)/%.tea compiler
#	@echo TEST $*
#	@ulimit -s 65536
	@./test-functional.sh $*
	@echo 

compiler: y.tab.o lex.yy.o TeaplAst.o TeaplaAst.o PrintTeaplaAst.o compiler.o  llvm_ir.o ast2llvm.o printLLVM.o temp.o ssa.o bg_llvm.o liveness.o
	@$(CXX) $(CXXFLAGS) -o compiler $^ 

y.tab.cpp: parser.yacc TeaplAst.h 
#	yacc --verbose --debug -d $< -o y.tab.cpp
	@yacc -o y.tab.cpp -d $< -v --debug

y.tab.hpp: parser.yacc
#	yacc --verbose --debug -d $< -o y.tab.cpp
	@yacc -o y.tab.cpp -d $< -v --debug

lex.yy.cpp: lexer.lex y.tab.hpp y.tab.cpp
	@lex -o lex.yy.cpp $< 

y.tab.o: y.tab.cpp y.tab.hpp
	@$(CXX) $(CXXFLAGS) -c $<

lex.yy.o: lex.yy.cpp y.tab.hpp
	@$(CXX) $(CXXFLAGS) -c $<

# TypeCheck.o: TypeCheck.cpp TypeCheck.h
# 	$(CXX) $(CXXFLAGS) -c $<

TeaplAst.o: TeaplAst.cpp TeaplAst.h
	@$(CXX) $(CXXFLAGS) -c $<

TeaplaAst.o: TeaplaAst.cpp TeaplaAst.h
	@$(CXX) $(CXXFLAGS) -c $<

PrintTeaplaAst.o: PrintTeaplaAst.cpp PrintTeaplaAst.h
	@$(CXX) $(CXXFLAGS) -c $<

compiler.o: compiler.cpp TeaplAst.o TeaplaAst.o PrintTeaplaAst.o y.tab.o lex.yy.o llvm_ir.o ast2llvm.o printLLVM.o temp.o ssa.o bg_llvm.o liveness.o
	@$(CXX) $(CXXFLAGS) -c $<

llvm_ir.o: llvm_ir.cpp llvm_ir.h temp.cpp temp.h
	@$(CXX) $(CXXFLAGS) -c $<

ast2llvm.o: ast2llvm.cpp ast2llvm.h llvm_ir.cpp llvm_ir.h temp.cpp temp.h
	@$(CXX) $(CXXFLAGS) -c $<

printLLVM.o: printLLVM.cpp printLLVM.h llvm_ir.cpp llvm_ir.h temp.cpp temp.h
	@$(CXX) $(CXXFLAGS) -c $<

temp.o: temp.cpp temp.h
	@$(CXX) $(CXXFLAGS) -c $<

ssa.o: ssa.cpp ssa.h 
	@$(CXX) $(CXXFLAGS) -c $<

bg_llvm.o: bg_llvm.cpp bg_llvm.h  graph.hpp 
	@$(CXX) $(CXXFLAGS) -c $<

liveness.o: liveness.cpp liveness.h  graph.hpp 
	@$(CXX) $(CXXFLAGS) -c $<
clean:
	rm -f *.o   compiler  tests/*.ll output/*.ll output/*.out tests/public/*.ll tests/private/*.ll

