#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;

void print_ler_inteiro(ofstream *iafile) {
	*iafile << "; ----------------------- LeerInteiro inicio ---------------------------------" << endl;
	*iafile << "; input:" << endl;
	*iafile << "\t; string -> esi" << endl;
	*iafile << "; output:" << endl;
	*iafile << "\t; num -> eax" << endl;
	*iafile << "@LeerInteiro:" << endl;
	*iafile << "mov eax, 0" << endl;
	*iafile << "mov edx, 0" << endl;
	*iafile << "mov ecx, 0" << endl;
	*iafile << "movzx edx, BYTE[esi]" << endl;
	*iafile << "cmp edx, '-'" << endl;
	*iafile << "jne .atoi_convert" << endl;
	*iafile << "inc esi" << endl;
	*iafile << "mov ecx, 1" << endl;
	*iafile << ".atoi_convert:" << endl;
	*iafile << "movzx edx, BYTE[esi]" << endl;
	*iafile << "inc esi" << endl;
	*iafile << "cmp edx, '0'" << endl;
	*iafile << "jl .atoi_exit" << endl;
	*iafile << "cmp edx, '9'" << endl;
	*iafile << "jg .atoi_exit" << endl;
	*iafile << "sub edx, '0' ; converte para inteiro" << endl;
	*iafile << "imul eax, 10 ; eax = eax * 10" << endl;
	*iafile << "add eax, edx ; eax = eax + edx" << endl;
	*iafile << "jmp .atoi_convert" << endl;
	*iafile << ".atoi_exit:" << endl;
	*iafile << "cmp ecx, 0" << endl;
	*iafile << "je .atoi_reallyexit" << endl;
	*iafile << "mov edx, 0" << endl;
	*iafile << "sub edx, eax" << endl;
	*iafile << "mov eax, edx" << endl;
	*iafile << ".atoi_reallyexit:" << endl;
	*iafile << "ret" << endl;
	*iafile << "; ----------------------- LeerInteiro fim ---------------------------------" << endl << endl;
}

void print_escreve_inteiro(ofstream *iafile) {
	*iafile << "; ----------------------- EscreverInteiro inicio ---------------------------------" << endl;
	*iafile << "@EscreverInteiro:" << endl;
	*iafile << "; input:" << endl;
	*iafile << "\t; num -> eax" << endl;
	*iafile << "\t; len -> ecx" << endl;
	*iafile << "; output:" << endl;
	*iafile << "\t; string -> esi" << endl;
	*iafile << "mov edx, 0" << endl;
	*iafile << "mov edi, 0" << endl;
	*iafile << "cmp eax, 0" << endl;
	*iafile << "jge .itoa_begin" << endl;
	*iafile << "sub edx, eax" << endl;
	*iafile << "mov eax, edx" << endl;
	*iafile << "mov edx, 0" << endl;
	*iafile << "mov edi, 1" << endl;
	*iafile << ".itoa_begin:" << endl;
	*iafile << "add esi, ecx" << endl;
	*iafile << "dec esi" << endl;
	*iafile << "mov BYTE [esi], 0" << endl;
	*iafile << "mov ebx, 10" << endl;
	*iafile << ".itoa_convert:" << endl;
	*iafile << "xor edx, edx" << endl;
	*iafile << "div ebx" << endl;
	*iafile << "add DL, '0'" << endl;
	*iafile << "dec esi" << endl;
	*iafile << "mov [esi], DL" << endl;
	*iafile << "test EAX, EAX" << endl;
	*iafile << "jnz .itoa_convert" << endl;
	*iafile << "cmp edi, 0" << endl;
	*iafile << "je .itoa_reallyexit" << endl;
	*iafile << "xor edx, edx" << endl;
	*iafile << "add DL, '-'" << endl;
	*iafile << "dec esi" << endl;
	*iafile << "mov [esi], DL" << endl;
	*iafile << ".itoa_reallyexit:" << endl;
	*iafile << "ret" << endl;
	*iafile << "; ----------------------- EscreverInteiro fim ---------------------------------" << endl << endl;
}

void print_escreve_char(ofstream *iafile) {
	*iafile << "; ----------------------- EscreverChar inicio ---------------------------------" << endl;
	*iafile << "@EscreverChar:" << endl;
	*iafile << "mov eax, 4" << endl;
	*iafile << "mov ebx, 1" << endl;
	*iafile << "mov edx, 1" << endl;
	*iafile << "int 80h" << endl;
	*iafile << "mov eax, 4" << endl;
	*iafile << "mov ebx, 1" << endl;
	*iafile << "mov ecx, blank_msg" << endl;
	*iafile << "mov edx, size_blank_msg" << endl;
	*iafile << "int 80h" << endl;
	*iafile << "ret" << endl;
	*iafile << "; ----------------------- EscreverChar fim ---------------------------------" << endl << endl;
}

void print_ler_char(ofstream *iafile) {
	*iafile << "; ----------------------- LeerChar inicio ---------------------------------" << endl;
	*iafile << "@LeerChar:" << endl;
	*iafile << "mov eax, 3" << endl;
	*iafile << "mov ebx, 0" << endl;
	*iafile << "mov edx, 2" << endl;
	*iafile << "int 80h" << endl;
	*iafile << "ret" << endl;
	*iafile << "; ----------------------- LeerChar fim ---------------------------------" << endl << endl;
}

void print_escreve_string(ofstream *iafile) {
	*iafile << "; ----------------------- EscreverString inicio ---------------------------------" << endl;
	*iafile << "@EscreverString:" << endl;
	*iafile << "mov eax, 4" << endl;
	*iafile << "mov ebx, 1" << endl;
	*iafile << "int 80h" << endl;
	*iafile << "ret" << endl;
	*iafile << "; ----------------------- EscreverString fim ---------------------------------" << endl << endl;
}

void print_ler_string(ofstream *iafile) {
	*iafile << "; ----------------------- LeerString inicio ---------------------------------" << endl;
	*iafile << "@LeerString:" << endl;
	*iafile << "mov eax, 3" << endl;
	*iafile << "mov ebx, 0" << endl;
	*iafile << "int 80h" << endl;
	*iafile << "ret" << endl;
	*iafile << "; ----------------------- LeerString fim ---------------------------------" << endl << endl;
}

void print_overflow(ofstream *iafile) {
	*iafile << "; ----------------------- overflow inicio ---------------------------------" << endl;
	*iafile << "@overflow_error:" << endl;
	*iafile << "cmp edx, 0" << endl;
	*iafile << "je ret_overflow" << endl;
	*iafile << "cmp edx, -1" << endl;
	*iafile << "je ret_overflow" << endl;
	*iafile << "mov eax, 4" << endl;
	*iafile << "mov ebx, 1" << endl;
	*iafile << "mov ecx, overflow_msg" << endl;
	*iafile << "mov edx, size_overflow_msg" << endl;
	*iafile << "int 80h" << endl;
	*iafile << "; Encerra o programa" << endl;
	*iafile << "mov eax, 1" << endl;
	*iafile << "mov ebx, 0" << endl;
	*iafile << "int 80h" << endl;
	*iafile << "ret_overflow:" << endl;
	*iafile << "ret" << endl;
	*iafile << "; ----------------------- overflow fim ---------------------------------" << endl;
}

void stop(ofstream *iafile) {
	*iafile << endl << "; Encerra o programa" << endl;
	*iafile << "mov eax, 1 ; STOP" << endl;
	*iafile << "mov ebx, 0" << endl;
	*iafile << "int 80h" << endl << endl;
	print_ler_inteiro(iafile);
	print_escreve_inteiro(iafile);
	print_escreve_char(iafile);
	print_ler_char(iafile);
	print_escreve_string(iafile);
	print_ler_string(iafile);
	if (has_mult) { /*Caso tenha um mult imprime a função de overflow*/
		print_overflow(iafile);
	}
}