#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;

void s_input(ofstream *iafile, string operando1, string operando2) {
	*iafile << endl << "; Ler do teclado" << endl;
  *iafile << "sub esp, 4" << endl;
  *iafile << "push eax" << endl;
  *iafile << "mov eax, 3 ; C_INPUT " << operando1 << ", " << operando2 << endl;
	*iafile << "mov ebx, 0" << endl;
	*iafile << "mov ecx, " << operando1 << endl;
  *iafile << "mov edx, " << (atoi(operando2.c_str()) + 1) << endl;
  *iafile << "int 80h" << endl;
  *iafile << "pop edx" << endl;
  *iafile << "add esp, 4" << endl;
}