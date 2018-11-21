#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;



void jmpp(ofstream *iafile, string operando1) {
	*iafile << endl << "cmp eax, 0 ; JMPP " << operando1 << endl;
	*iafile << "jg "<< operando1 << endl;
}