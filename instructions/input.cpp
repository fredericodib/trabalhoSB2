#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;



void input(ofstream *iafile, string operando1) {
	*iafile << endl << "; Ler do teclado" << endl;
	*iafile << "mov eax, 3 ; INPUT " << operando1 << endl;
	*iafile << "mov ebx, 0" << endl;
	*iafile << "mov ecx, aux_input" << endl;
	*iafile << "mov edx, 12" << endl;
	*iafile << "int 80h" << endl;
	*iafile << endl << "; Converte string para inteiro" << endl;
	*iafile << "sub esp, 4" << endl;
	*iafile << "push esi" << endl;
	*iafile << "sub esp, 4" << endl;
	*iafile << "push eax" << endl;
	*iafile << "sub esp, 4" << endl;
	*iafile << "push edx" << endl;
	*iafile << endl << "mov esi, aux_input" << endl;
	*iafile << "call @atoi" << endl;
	*iafile << "mov [" << ajusted_value(operando1) << "], eax" << endl;
	*iafile << endl << "pop edx" << endl;
	*iafile << "add esp, 4" << endl;
	*iafile << "pop eax" << endl;
	*iafile << "add esp, 4" << endl;
	*iafile << "pop esi" << endl;
	*iafile << "add esp, 4" << endl;
	*iafile << "; Termina de converter" << endl;
}