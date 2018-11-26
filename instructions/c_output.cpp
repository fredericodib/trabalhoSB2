#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;



void c_output(ofstream *iafile, string operando1) {
	*iafile << "sub esp, 4" << endl;
	*iafile << "push eax" << endl;

	*iafile << "mov ecx, " << operando1 << " ; C_OUTPUT " << operando1 << endl;
	*iafile << "call @EscreverChar" << endl;
	
	*iafile << "pop edx" << endl;
	*iafile << "add esp, 4" << endl;
}