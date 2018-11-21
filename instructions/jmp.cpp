#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;



void jmp(ofstream *iafile, string operando1) {
	*iafile << endl << "jmp "<< operando1 << " ; jmp " << operando1 << endl;
}