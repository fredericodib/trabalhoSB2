#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;



void jmpn(ofstream *iafile, string operando1) {
	*iafile << endl << "cmp eax, 0 ; JMPN " << operando1 << endl;
	*iafile << "jl "<< operando1 << endl;
}