#!make -f
# This Makefile can handle any set of cpp and hpp files.
# To use it, you should put all your cpp and hpp files in the SOURCE_PATH folder.

CXX=clang++-9
CXXVERSION=c++2a
CXXFLAGS=-std=$(CXXVERSION) -Wsign-conversion 
TIDY_FLAGS=-extra-arg=-std=$(CXXVERSION) -checks=bugprone-*,clang-analyzer-*,cppcoreguidelines-*,performance-*,portability-*,readability-*,-cppcoreguidelines-pro-bounds-pointer-arithmetic,-cppcoreguidelines-owning-memory --warnings-as-errors=*
TEST_SOURCES=Schedule.cpp League.cpp Game.cpp Team.cpp Test.cpp
TEST_O=Schedule.o League.o Game.o Team.o

run: test demo

files:
	$(CXX) $(CXXFLAGS) $(TEST_SOURCES) -c -g

demo:files
	@$(CXX) $(CXXFLAGS) $(TEST_O) -o demo demo.cpp -g
	

test:files TestCounter.o Test.o
	@echo "Running tests..."
	@$(CXX) $(CXXFLAGS) -o test $(TEST_O)   Test.cpp TestCounter.o Test.o -g
	@./test

TestCounter.o:
	@echo "Compiling TestCounter.cpp..."
	@$(CXX) $(CXXFLAGS) -c TestCounter.cpp -g

Test.o:
	@echo "Compiling Test.cpp..."
	@$(CXX) $(CXXFLAGS) -c Test.cpp -g


tidy:
	clang-tidy $(SOURCES) $(HEADERS) $(TIDY_FLAGS) -std=$(CXXVERSION) -g

valgrind: test
	valgrind --tool=memcheck $(VALGRIND_FLAGS) ./test 2>&1 | { egrep "lost| at " || true; }

clean:
	rm -f *.o test
	rm -f StudentTest*
	rm -f demo