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

	*iafile << "mov ecx, " << operando1 << " ; C_INPUT " << operando1 << endl;
	*iafile << "call @LeerChar" << endl;
	
	*iafile << "pop edx" << endl;
	*iafile << "add esp, 4" << endl;
}