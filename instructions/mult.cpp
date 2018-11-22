#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;



void mult(ofstream *iafile, string operando1) {
	*iafile << endl << "mov edx, eax ; MULT " << operando1 << endl;
	if (is_const(operando1)) { /*Dando mult em uma constante*/
		*iafile << "imul dword "<< operando1 << endl;
	}
	else { /*Dando mult em uma variavel normal*/
		*iafile << "imul dword ["<< ajusted_value(operando1) << "]" << endl;
	}
	*iafile << "cmp edx, 0" << endl;
	*iafile << "jne @overflow_error" << endl;
}