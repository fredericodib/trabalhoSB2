#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;



void sub(ofstream *iafile, string operando1) {
	if (is_const(operando1)) { /*Dando sub em uma constante*/
		*iafile << endl << "sub eax, " << operando1;
		*iafile << " ; SUB "<< operando1 << endl;
	}
	else { /*Dando sub em uma variavel normal*/
		*iafile << endl << "sub eax, [" << ajusted_value(operando1) << "]";
		*iafile << " ; SUB "<< operando1 << endl;
	}
}