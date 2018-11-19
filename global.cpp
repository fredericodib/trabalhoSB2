#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>


using namespace std;

struct instruction {
	string rotulo;
	string operacao;
	string operando1;
	string operando2;
};

struct operando {
	string operando1;
	string operando2;
};

struct bss {
	string label;
	string type;
	int size;
};

struct data {
	string label;
	string value;
};


vector<instruction> instruction_array;
vector<data> const_vector;
vector<bss> bss_vector;
string inputname;

bool has_mult = false;
bool has_input = false;
bool has_output = false;


operando get_operando(string expression){
	int i = 0;
	operando op;
	string aux="";
	if (expression.find(" + ") == string::npos) {
		op.operando1 = expression;
		op.operando2 = "";
	}
	else {
		while (expression[i] != ' '){
			aux = aux + expression[i];
			i++;
		}
		op.operando1 = aux;
		aux = "";
		i = i + 3;
		while (i < (int)expression.size()){
			aux = aux + expression[i];
			i++;
		}
		op.operando2 = aux;
	}
	return op;
}