all: compile

compile:
	g++ -std=c++11 -ansi -Wall -o tradutor tradutor.cpp

clear:
	rm tradutor
	rm *.s