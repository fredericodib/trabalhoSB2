// TRABALHO 2 DE SOFTWARE BÁSICO - UNB - 2/2018
// PROFESSOR - BRUNO
// ALUNOS:
// - FREDERICO PINHEIRO DIB - 15/0125925
// - LUCAS DA SILVA MOUTINHO - 15/0015747

#include <iostream>
#include <algorithm>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <string>
#include <sstream>

using namespace std;


string inputname;

struct instruction {
  string rotulo;
  string operacao;
  string operando1;
  string operando2;
};

vector<instruction> instruction_array;




/*--------------------------- PARSER INICIO ---------------------------*/

void print_asm_code() {
  unsigned int i;
  cout << "-------------" << endl;
  for (i=0;i<instruction_array.size();i++) {
    if (instruction_array[i].rotulo != "") {
      cout << instruction_array[i].rotulo << ": ";
    }
    cout << instruction_array[i].operacao << " ";
    cout << instruction_array[i].operando1 << " " << instruction_array[i].operando2 << endl;
  }
  cout << "-------------" << endl;
}

/*
Retorna um array de palavras, posições:
0 - rotulo
1 - operação
2 - operador 1
3 - operador 2
*/
vector<string> separate_instructions(string line, ifstream *inputfile, int *line_count) {
  vector<string> words, wordsAux;
  string aux;
  unsigned int i=0, j=0, finish=0, rotCount=0;
  int size;

  while (finish == 0) {
    while (i <= line.length()) { /*Le a linha toda*/
      while (((line[i] == ' ') || (line[i] == '\t')) && (i < line.length())) { /*Remove espaços vazios*/
        i++;
      }


      if (line[i] == ';') { /*Ignora comentarios*/
        break;
      }

      if ((line[i] == '\0') && (aux == "")) { /*Ignora comentarios*/
        break;
      }

      aux = aux + line[i];

      if ((line[i+1] == ' ') || (line[i+1] == '\t') || (line[i+1] == '\n') || (i == line.length())) {
        if ((wordsAux.size() == 0) && (aux.find(":") == string::npos)) {
          wordsAux.push_back("none:");
        }
        if (aux[aux.length()-1] == '\0') {
          aux.erase(aux.length()-1, aux.length()-1);
        }
        wordsAux.push_back(aux);
        aux = "";
        j=0;
      }

      j++;
      i++;
    }
    if (wordsAux.size() == 0) {
      break;
    }
    if ((wordsAux.size() != 1) && (wordsAux[0].find(":") != string::npos)) { /*Caso só tenha a label ele junta com a outra linha*/
      finish = 1;
    }
    else {
      getline(*inputfile, line);
      transform(line.begin(), line.end(), line.begin(), ::toupper); /*Deixa toda a string maiuscula*/
      i=0;
      j=0;
      *line_count = *line_count + 1;
    }
  }

  if (wordsAux.size() >= 2) {
    words.push_back(wordsAux[0]);
    words.push_back(wordsAux[1]);
  }
  for (i=2;i<wordsAux.size();i++) {
    aux = wordsAux[i];
    size = wordsAux[i].length()-1;
    while ((wordsAux[i][size] != ',') && (i != wordsAux.size()-1)) {
      aux = aux + " " + wordsAux[i+1];
      i++;
      size = wordsAux[i].length()-1;
    }
    words.push_back(aux);
  }

  for (i=0;i<words.size();i++) { /*retira virgulas e dois pontos*/
    size = words[i].length()-1;
    if (words[i][size] == ':') {
      rotCount++;
    }
    if ((words[i][size] == ':') || (words[i][size] == ',')) {
      words[i].erase(size, size);
    }
  }
  return words;
}

void parser() {
  ifstream inputfile;
  int line_count=1;
  string line, prefile="";
  vector<string> words;
  instruction inst;

  inputfile.open((inputname + ".asm").c_str()); /*Abre o arquivo*/

  while (getline(inputfile, line)) {
    transform(line.begin(), line.end(), line.begin(), ::toupper); /*Deixa toda a string maiuscula*/
    words = separate_instructions(line, &inputfile, &line_count);
    if (words.size() > 0) {
      if (words[0] != "none") {
        inst.rotulo = words[0];
      }
      inst.operacao = words[1];
      if (words.size() > 2) {
        inst.operando1 = words[2];
      }
      if (words.size() > 3) {
        inst.operando2 = words[3];
      }
      instruction_array.push_back(inst);
    }
    inst.rotulo.clear();
    inst.operacao.clear();
    inst.operando1.clear();
    inst.operando2.clear();

    line_count++;
  }
}

/*--------------------------- PARSER FIM ---------------------------*/

/*--------------------------- ARQUIVO INICIO ---------------------------*/

/*Verifica se o arquivo foi enviado corretamente*/
bool correcet_execution(int argc) {
  bool correct=true;
  if (argc != 2) {
    cout << "ERROR: Numero de argumentos errados! Apenas um arquivo de entrada é permitido por execução" << endl;
    correct = false;
  }
  return correct;
}

bool fexists(const string &filename){
  ifstream ifile(filename.c_str());
  return (bool) ifile;
}

/*--------------------------- ARQUIVO FIM ---------------------------*/

int main(int argc, char *argv[]) {
  if (correcet_execution(argc)) {
    inputname = argv[1];
    if (fexists((inputname + ".asm").c_str())) {
      parser();
      print_asm_code();
    }

    else{
      cout << "ERROR: O Arquivo "<< argv[1] <<".asm não existe" << endl;
    }
  }

  return 0;
}