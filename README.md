## TRABALHO 2 DA DISCIPLINA DE SOFTWARE BÁSICO - UNB - 2/2018
## PROFESSOR - BRUNO MACCHIAVELLO

### ALUNOS:
```
FREDERICO PINHEIRO DIB - 15/0125925
LUCAS DA SILVA MOUTINHO - 15/0015747
```

### PROBLEMA:
Implementar um tradutor que traduza um programa escrito na linguagem Assembly hipotética, vista em sala de aula, para a linguagem Assembly IA-32.

### DESENVOLVIMENTO:
O programa foi feito em C++ 11, no ubuntu 16.04 LTS. Fora utilizado a seguinte versão do g++:

```
g++ --version
```

```
g++ (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

### COMO COMPILAR:
Para compilar o códigos fonte e gerar o executável "tradutor", utilize o comando:

```
make
```

ou:

```
g++ -std=c++11 -ansi -Wall -o tradutor tradutor.cpp
```


### COMO EXECUTAR:
Para executar o programa do tradutor, utilize o seguinte comando:

```
./tradutor arquivo
```

Onde "arquivo" deve ser o nome de um programa "arquivo.asm" presente no diretório local. Apenas um argumento é aceito por execução. Sendo assim, apenas um programa é traduzido por execução.

### TESTE:

O arquivo: test.asm presente1 no diretório é um programa feito a partir da linguagem Assembly hipotética e que pode ser utilizado como teste para averiguar o correto funcionamento do tradutor