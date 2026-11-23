#!/bin/bash

echo "compiling..."

case "$(uname -s)" in
  MINGW*|MSYS*|CYGWIN*) library="libmysdl2.dll" ;;
  Darwin*) library="libmysdl2.dylib" ;;
  *) library="libmysdl2.so" ;;
esac

g++ -std=c++17 -O0 -g3 -Wall -fPIC -c -fmessage-length=0 -o mysdl2.o "mysdl2.cpp"
g++ -shared -o "$library" mysdl2.o -lSDL2 -lSDL2_image -lSDL2_ttf
echo "done!"
