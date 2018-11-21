#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;



void copy(ofstream *iafile, string operando1, string operando2) {
	*iafile << endl << "xor edx, edx ; COPY " << operando1 << " " << operando2 << endl;
	if (is_bss_int(operando2)) { /*Se estamos trabalhando com numero inteiro*/
		if (is_const(operando1)) { /*Checa se o outro parametro é uma constante*/
			*iafile << "mov edx, " << operando1 << endl;
			*iafile << "mov [" << ajusted_value(operando2) << "], edx" <<endl;
		}
		else {
			*iafile << "mov edx, [" << ajusted_value(operando1) << "]"<< endl;
			*iafile << "mov [" << operando2 << "], edx" <<endl;
		}
	}
	else { /*Caso estejamos trabalhando com bytes*/
		*iafile << "add DL, [" << operando1 << "]" << endl;
		*iafile << "mov [" << operando2 << "], DL" <<endl;
	}
}