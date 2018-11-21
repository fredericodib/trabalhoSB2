#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;



void load(ofstream *iafile, string operando1) {
	if (is_const(operando1)) { /*Dando load em uma constante*/
		*iafile << endl << "mov eax, " << operando1;
		*iafile << " ; LOAD "<< operando1 << endl;
	}
	else { /*Dando load em uma variavel normal*/
		*iafile << endl << "mov eax, [" << ajusted_value(operando1) << "]";
		*iafile << " ; LOAD "<< operando1 << endl;
	}
}