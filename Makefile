PROJECT = game
LIBPROJECT = lib$(PROJECT).a
TESTPROJECT = test-$(PROJECT)

CXX = g++
CXXFLAGS = -Iinclude -std=c++17 -Werror -Wpedantic -Wall -g
LDXXFLAGS = $(CXXFLAGS) -L. -l$(PROJECT)
LDGTESTFLAGS = $(LDXXFLAGS) -lgtest_main -lgtest -lpthread
AR = ar
ARFLAGS = rsv

#Directories
SRCDIR = src
TESTDIR = test
OBJDIR = obj
BINDIR = bin
TESTBINDIR = testbin
DOCSDIR = docs

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
default: all
all: $(TARGET) depend

$(shell mkdir -p $(OBJDIR) $(BINDIR) $(TESTBINDIR) $(DOCSDIR) $(DOCSDIR)/doxygen $(DOCSDIR)/images)

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

depend:
	$(CXX) -MM $(CXXFLAGS) $(SRCS) $(TESTSRCS) > $(DOCSDIR)/.depend

-include $(DOCSDIR)/.depend

clean:
	rm -rf $(OBJDIR)/* $(BINDIR)/* $(TESTBINDIR)/* .depend

cleandocs:
	rm -rf $(DOCSDIR)/doxygen/*
	rm -f $(DOCSDIR)/.depend

cleanall: clean
	rm -rf $(OBJDIR) $(BINDIR) $(TESTBINDIR) $(LIBPROJECT)
