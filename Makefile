# Makefile for mysdl2 project

# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -O2 -std=c++17

# SDL2 and related libraries
SDL2_CFLAGS := $(shell pkg-config --cflags sdl2 SDL2_image SDL2_ttf)
SDL2_LIBS   := $(shell pkg-config --libs sdl2 SDL2_image SDL2_ttf)

# Source and output
SRC = mysdl2.cpp
OBJ = mysdl2.o
TARGET = libmysdl2.dll

# Default target
all: $(TARGET)

$(OBJ): $(SRC) mysdl2.h
	$(CXX) $(CXXFLAGS) $(SDL2_CFLAGS) -c $< -o $@

$(TARGET): $(OBJ)
	$(CXX) -shared -o $@ $^ $(SDL2_LIBS)

clean:
	rm -f $(OBJ) $(TARGET)

.PHONY: all clean
