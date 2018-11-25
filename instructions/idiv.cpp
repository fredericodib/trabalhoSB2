#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;



void idiv(ofstream *iafile, string operando1) {
	*iafile << endl << "cdq ; DIV " << operando1 << endl;
	if (is_const(operando1)) { /*Dando div em uma constante*/
		*iafile << "mov ebx, "<< operando1 << endl;
		*iafile << "idiv dword ebx" << endl;
	}
	else { /*Dando div em uma variavel normal*/
		*iafile << "idiv dword ["<< ajusted_value(operando1) << "]" << endl;
	}
}