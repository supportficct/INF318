/*Iguales*/
igual(X,Y):-X=:=Y.
igual(X,X).

/*Diferentes*/
dif(X,Y):-X=\=Y.
dif(X,Y):-not(igual(X,Y)).

/*Menor de 2 numeros*/
menor(X,Y,X):-X<Y.
menor(X,Y,Y):-Y=<X.

/*Menor de 3 numeros*/
menor(A,B,C,Me):- 	menor(A,B,Me1),
					menor(C,Me1,Me).

/*Menor de 4 numeros*/
menor(A,B,C,D,Me):-	menor(A,B,C,Me1),
					menor(Me1,D,Me).
					
/*Menor de 5 numeros*/
menor(A,B,C,D,E,Me):-	menor(A,B,C,D,Me1),
						menor(Me1,E,Me).
				
/*Mayor de 2 numeros*/
mayor(X,Y,X):-X>Y.
mayor(X,Y,Y):-Y>=X.

/*Mayor de 3 numeros*/
mayor(A,B,C,Ma):- 	mayor(A,B,Ma1),
					mayor(C,Ma1,Ma).

/*Mayor de 4 numeros*/
mayor(A,B,C,D,Ma):-	mayor(A,B,C,Ma1),
					mayor(Ma1,D,Ma).
					
/*Mayor de 5 numeros*/
mayor(A,B,C,D,E,Ma):-	mayor(A,B,C,D,Ma1),
						mayor(Ma1,E,Ma).

/*Predicado existeSuma: Predicado que es true si un argumento es igual a la suma de los otros argumentos*/
existeSuma(A,B,C):-	igual(A+B,C).
existeSuma(A,B,C):-	igual(B+C,A).
existeSuma(A,B,C):- igual(C+A,B).

