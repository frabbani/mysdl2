#!/bin/bash

echo "compiling..."
g++ -std=c++17 -O0 -g3 -Wall -c -fmessage-length=0 -o mysdl2.o "mysdl2.cpp" 
g++ -shared -o libmysdl2.dll mysdl2.o -lSDL2main -lSDL2 -lSDL2_image
echo "done!"
