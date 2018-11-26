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

	*iafile << "mov ecx, " << operando1 << " ; C_INPUT " << operando1 << ", " << operando2 << endl;
  *iafile << "mov edx, " << (atoi(operando2.c_str()) + 1) << endl;
  *iafile << "call @LeerString" << endl;

  *iafile << "pop edx" << endl;
  *iafile << "add esp, 4" << endl;
}