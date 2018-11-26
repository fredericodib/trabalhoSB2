#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;



void jmpz(ofstream *iafile, string operando1) {
	*iafile << endl << "cmp eax, 0 ; JMPZ " << operando1 << endl;
	*iafile << "jz "<< operando1 << endl;
}