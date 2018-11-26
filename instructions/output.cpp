#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;



void output(ofstream *iafile, string operando1) {
	*iafile << endl << "; Convert inteiro para string" << endl;
	*iafile << "sub esp, 4" << endl;
	*iafile << "push eax" << endl;
	*iafile << "sub esp, 4 ; OUTPUT " << operando1 << endl;
	*iafile << "push eax" << endl;
	*iafile << "sub esp, 4" << endl;
	*iafile << "push esi" << endl;
	*iafile << "sub esp, 4" << endl;
	*iafile << "push ecx" << endl;
	*iafile << "sub esp, 4" << endl;
	*iafile << "push edx" << endl;
	*iafile << "sub esp, 4" << endl;
	*iafile << "push ebx" << endl;
	*iafile << endl << "mov eax, [" << ajusted_value(operando1) << "]" << endl;
	*iafile << "lea esi, [aux_output]" << endl;
	*iafile << "mov ecx, 12" << endl;
	*iafile << "call @EscreverInteiro" << endl;
	*iafile << endl << "pop ebx" << endl;
	*iafile << "add esp, 4" << endl;
	*iafile << "pop edx" << endl;
	*iafile << "add esp, 4" << endl;
	*iafile << "pop ecx" << endl;
	*iafile << "add esp, 4" << endl;
	*iafile << "pop esi" << endl;
	*iafile << "add esp, 4" << endl;
	*iafile << "pop eax" << endl;
	*iafile << "add esp, 4" << endl;
	*iafile << "; Termina de converter" << endl;
	*iafile << "; Imprimir aux_output" << endl;
	*iafile << "mov eax, 4" << endl;
	*iafile << "mov ebx, 1" << endl;
	*iafile << "mov ecx, aux_output" << endl;
	*iafile << "mov edx, 12" << endl;
	*iafile << "int 80h" << endl;
	*iafile << "mov eax, 4" << endl;
	*iafile << "mov ebx, 1" << endl;
	*iafile << "mov ecx, blank_msg" << endl;
	*iafile << "mov edx, size_blank_msg" << endl;
	*iafile << "int 80h" << endl;
	*iafile << "mov BYTE [aux_output], 0" << endl;
	*iafile << "mov BYTE [aux_output+1], 0" << endl;
	*iafile << "mov BYTE [aux_output+2], 0" << endl;
	*iafile << "mov BYTE [aux_output+3], 0" << endl;
	*iafile << "mov BYTE [aux_output+4], 0" << endl;
	*iafile << "mov BYTE [aux_output+5], 0" << endl;
	*iafile << "mov BYTE [aux_output+6], 0" << endl;
	*iafile << "mov BYTE [aux_output+7], 0" << endl;
	*iafile << "mov BYTE [aux_output+8], 0" << endl;
	*iafile << "mov BYTE [aux_output+9], 0" << endl;
	*iafile << "mov BYTE [aux_output+10], 0" << endl;
	*iafile << "mov BYTE [aux_output+11], 0" << endl;
	*iafile << "pop edx" << endl;
	*iafile << "add esp, 4" << endl;
}