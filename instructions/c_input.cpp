#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;

void c_input(ofstream *iafile, string operando1) {
	*iafile << endl << "; Ler do teclado" << endl;
	*iafile << "sub esp, 4" << endl;
	*iafile << "push eax" << endl;
	*iafile << "mov eax, 3 ; C_INPUT " << operando1 << endl;
	*iafile << "mov ebx, 0" << endl;
	*iafile << "mov ecx, " << operando1 << endl;
	*iafile << "mov edx, 1" << endl;
	*iafile << "int 80h" << endl;
	*iafile << "pop edx" << endl;
	*iafile << "add esp, 4" << endl;
}