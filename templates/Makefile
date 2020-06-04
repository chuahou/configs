CXX      ?= g++
CXXFLAGS ?= -g

export CXXFLAGS:=$(CXXFLAGS) -Wall -O3
export CXX
LDFLAGS = -g

SRCDIR    := src
HEADERDIR := include
OBJDIR    := obj
OUTDIR    := bin

INCLUDES = $(HEADERDIR:%=-I%)

DIRS := $(SRCDIR) $(OBJDIR) $(OUTDIR)

SRC     := $(wildcard $(SRCDIR)/*.cpp)
HEADERS := $(wildcard HEADERDIR/*.h) $(wildcard HEADERDIR/*.hpp)
OBJ     := $(SRC:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
OUT     := $(OUTDIR)/a.out

.PHONY: build setup run clean

build: setup $(OUT)

$(OUT): $(OBJ)
	$(CXX) $^ $(LDFLAGS) -o $@

setup: $(DIRS)

$(DIRS):
	mkdir -p $@

run: $(OUT)
	$(OUT)

clean:
	rm $(OUT) $(OBJ) || true

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@
