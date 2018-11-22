#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;



void c_output(ofstream *iafile, string operando1) {
	*iafile << "; Imprimir aux_output" << endl;
  *iafile << "mov eax, 4 ; C_OUTPUT " << operando1 << endl;
  *iafile << "mov ebx, 1" << endl;
	*iafile << "mov ecx, " << operando1 << endl;
	*iafile << "mov edx, 1" << endl;
	*iafile << "int 80h" << endl;
  *iafile << "mov eax, 4" << endl;
  *iafile << "mov ebx, 1" << endl;
  *iafile << "mov ecx, blank_msg" << endl;
	*iafile << "mov edx, size_blank_msg" << endl;
	*iafile << "int 80h" << endl;
}