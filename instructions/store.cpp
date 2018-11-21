#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;



void store(ofstream *iafile, string operando1) {
	*iafile << endl << "mov ["<< ajusted_value(operando1) << "], eax ; STORE " << operando1 << endl;
}