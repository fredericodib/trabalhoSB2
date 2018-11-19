#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;



void build_bss_data_section(ofstream *iafile) {
	unsigned int i, j;
	bss space;
	string aux;
	data cons;
	*iafile << "global _start" << endl << endl;

	/*build table*/
	for (i=0;i<instruction_array.size();i++) {
		if (instruction_array[i].operacao == "INPUT") {
			has_input = true;
		}
		if (instruction_array[i].operacao == "OUTPUT") {
			has_output = true;
		}
		if (instruction_array[i].operacao == "MULT") {
			has_mult = true;
		}
		if (instruction_array[i].operacao == "SPACE") {
			space.label = instruction_array[i].rotulo;
			space.type = "int";
			if (instruction_array[i].operando1 != "") {
				space.size = atoi(instruction_array[i].operando1.c_str());
			}
			else {
				space.size = 1;
			}
			bss_vector.push_back(space);
		}
		if (instruction_array[i].operacao == "CONST") {
			cons.label = instruction_array[i].rotulo;
			cons.value = instruction_array[i].operando1;
			const_vector.push_back(cons);
		}
	}

	/*update table bss*/
	for (i=0;i<instruction_array.size();i++) {
		aux = instruction_array[i].operacao;
		if ((aux == "C_INPUT") || (aux == "S_INPUT") || (aux == "C_OUTPUT") || (aux == "S_OUTPUT")) {
			for (j=0;j<bss_vector.size();j++) {
				if (bss_vector[j].label == get_operando(instruction_array[i].operando1).operando1) {
					bss_vector[j].type = "char";
				}
			}
		}
	}

	/*print bss and data table*/
	*iafile << "section .bss" << endl;
	for (i=0;i<bss_vector.size();i++) {
		if (bss_vector[i].type == "char") {
			*iafile << bss_vector[i].label << " resb " << bss_vector[i].size << endl;
		}
		else {
			*iafile << bss_vector[i].label << " resb " << bss_vector[i].size*4 << endl;
		}
	}
	if (has_input) {
		*iafile << "aux_input resb 12" << endl;
	}
	if (has_output) {
		*iafile << "aux_output resb 12" << endl;
	}
	*iafile << endl << "section .bss" << endl;
	for (i=0;i<const_vector.size();i++) {
		*iafile << const_vector[i].label << " equ " << const_vector[i].value << endl;
	}
	if (has_output) {
		*iafile << "blank_msg db \"\", 0DH, 0AH" << endl;
		*iafile << "size_blank_msg equ $-blank_msg" << endl;
	}
	if (has_mult) {
		*iafile << "overflow_msg db \"Erro, houve um overflow\", 0DH, 0AH" << endl;
		*iafile << "size_overflow_msg equ $-overflow_msg" << endl;
	}
	*iafile << endl << "section .text" << endl;
	*iafile << "_start: " << endl << endl;
}