ONE: EQU -10
SECTION TEXT    
INPUT NUM
COPY ONE, I
LOAD NUM
MULT ONE
STORE NUM
OUTPUT NUM
STOP
SECTION BSS
I: SPACE
NUM: SPACE 1
