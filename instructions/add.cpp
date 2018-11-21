#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;



void add(ofstream *iafile, string operando1) {
	if (is_const(operando1)) { /*Dando add em uma constante*/
		*iafile << endl << "add eax, " << operando1;
		*iafile << " ; ADD "<< operando1 << endl;
	}
	else { /*Dando add em uma variavel normal*/
		*iafile << endl << "add eax, [" << ajusted_value(operando1) << "]";
		*iafile << " ; ADD "<< operando1 << endl;
	}
}