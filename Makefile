PROJECT = game
LIBPROJECT = $(PROJECT).a
TESTPROJECT = test-$(PROJECT)

CXX = g++
CXXFLAGS = -Iinclude -std=c++17 -Werror -Wpedantic -Wall -g -fPIC
LDXXFLAGS = $(CXXFLAGS) -L. -l:$(LIBPROJECT)
LDGTESTFLAGS = $(LDXXFLAGS) -lgtest_main -lgtest -lpthread
AR = ar
ARFLAGS = rsv

#Directories
SRCDIR = src
TESTDIR = test
OBJDIR = obj
BINDIR = bin
TESTBINDIR = testbin

#Files
SRCS = $(filter-out $(SRCDIR)/main.cpp, $(wildcard $(SRCDIR)/*.cpp))
TESTSRCS = $(wildcard $(TESTDIR)/*.cpp)
OBJS = $(patsubst $(SRCDIR)/%.cpp, $(OBJDIR)/%.o, $(SRCS))
TESTOBJS = $(patsubst $(TESTDIR)/%.cpp, $(OBJDIR)/%.o, $(TESTSRCS))

#To solve conflict with gtest main and programm main
MAINOBJ = $(OBJDIR)/main.o 

TARGET = $(BINDIR)/$(PROJECT)
TESTTARGET = $(TESTBINDIR)/$(TESTPROJECT)

.PHONY: default
default: all;
all: $(TARGET)

$(shell mkdir -p $(OBJDIR) $(BINDIR) $(TESTBINDIR))

#Project's building
$(TARGET): $(MAINOBJ) $(LIBPROJECT)
	$(CXX) $^ $(LDXXFLAGS) -o $@

$(TESTTARGET): $(TESTOBJS) $(LIBPROJECT)
	$(CXX) $^ $(LDGTESTFLAGS) -o $@

$(LIBPROJECT): $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

$(MAINOBJ): $(SRCDIR)/main.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

#.cpp turn into .o
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJDIR)/%.o: $(TESTDIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

test: $(TESTTARGET)
	./$(TESTTARGET)

.PHONY: clean

clean:
	rm -rf $(OBJDIR)/* $(BINDIR)/* $(TESTBINDIR)/* .depend

cleanall: clean
	rm -f $(PROJECT)
	rm -f $(LIBPROJECT)
	rm -f $(TESTPROJECT)
	rm -rf $(OBJDIR) $(BINDIR) $(TESTBINDIR)

depend:
	$(CXX) -MM $(CXXFLAGS) $(SRCS) $(TESTSRCS) > .depend

-include .depend
