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

	*iafile << "mov ecx, " << operando1 << " ; S_OUTPUT " << operando1 << ", " << operando2 << endl;
	*iafile << "mov edx, " << operando2 << endl;
	*iafile << "call @EscreverString" << endl;

	*iafile << "pop edx" << endl;
	*iafile << "add esp, 4" << endl;
}