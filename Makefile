all: compile

compile:
	g++ -std=c++11 -ansi -Wall -o tradutor tradutor.cpp

nasm:
	nasm -f elf -o test.o test.s
	ld -m elf_i386 -o test test.o 
	./test

clear:
	rm tradutor
	rm *.s

clear nasm:
	rm *.o
	rm test
