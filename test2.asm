SECTION TEXT    
ROT:    INPUT       N4 
      COPY N1, N4 ;comentario qualquer
ROT2: 


			       COPY N2, N3 
COPY N3, N3 + 1 


OUTPUT N3 + 1

STOP

;comentario qualuer
SECTION DATA 
N2: CONST -5
SECTION BSS
N1: SPACE 1
N3: SPACE 2
N4: SPACE
END