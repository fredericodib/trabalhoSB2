all: compile

nasm: compile_nasm exec_nasm clear_nasm

compile:
	g++ -std=c++11 -ansi -Wall -o tradutor tradutor.cpp

compile_nasm:
	nasm -f elf -o test.o test.s
	ld -m elf_i386 -o test test.o 

exec_nasm:
	./test

clear_nasm:
	rm *o
	rm test

clear:
	rm tradutor
	rm *.s
