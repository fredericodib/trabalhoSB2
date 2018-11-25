#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;



void s_output(ofstream *iafile, string operando1, string operando2) {
	*iafile << "sub esp, 4" << endl;
	*iafile << "push eax" << endl;
	*iafile << "; Imprimir aux_output" << endl;
  *iafile << "mov eax, 4 ; C_OUTPUT " << operando1 << ", " << operando2 << endl;
  *iafile << "mov ebx, 1" << endl;
	*iafile << "mov ecx, " << operando1 << endl;
	*iafile << "mov edx, " << operando2 << endl;
	*iafile << "int 80h" << endl;
  *iafile << "mov eax, 4" << endl;
  *iafile << "mov ebx, 1" << endl;
  *iafile << "mov ecx, blank_msg" << endl;
	*iafile << "mov edx, size_blank_msg" << endl;
	*iafile << "int 80h" << endl;
	*iafile << "pop edx" << endl;
	*iafile << "add esp, 4" << endl;
}