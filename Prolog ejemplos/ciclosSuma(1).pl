/*------------Pregunta 1------------------------*/
sumaEnteros(N,X):-	N=:=1,
					X is 1,!.
sumaEnteros(N,X):-	N1 is N-1,
					sumaEnteros(N1,X1),
					X is X1 + N.
			
/*------------Pregunta 2------------------------*/
sumaPares(N,X):-	N=:=1,
					X is 2,!.
sumaPares(N,X):-	N1 is N-1,
					sumaPares(N1,X1),
					N2 is N*2,
					X is X1 + N2.

/*------------Pregunta 3------------------------*/
sumaImpares(N,X):-	N=:=1,
					X is 1,!.
sumaImpares(N,X):-	N1 is N-1,
					sumaImpares(N1,X1),
					N2 is (N*2) -1,
					X is X1 + N2.

/*------------Pregunta 4------------------------*/
factorial(N,X):-	N=:=1,
					X is 1,!.
factorial(N,X):-	N1 is N-1,
					factorial(N1,X1),
					X is X1 * N.

/*------------Pregunta 5------------------------*/
combi(N,N,1):-!.
combi(_,0,1):-!.
combi(N,R,C):-	N1 is N-1,
				R1 is R-1,
				combi(N1,R,C1),
				combi(N1,R1,C2),
				C is C1+C2.

/*------------Pregunta 6------------------------*/
sumaCoef(N,X):-		sumaCoef(N,0,X).
sumaCoef(N,R,X):-	N=:=R,
					combi(N,N,X),!.
sumaCoef(N,R,X):-	R1 is R+1,	
					sumaCoef(N,R1,X1),
					combi(N,R,X2),
					X is X1+X2.

/*------------Pregunta 7------------------------*/
potencia(_,0,1).
potencia(N,1,N).
potencia(N,X,P):-	X1 is X-1, 	
					potencia(N,X1,P1),
					P is P1*N.

/*------------Pregunta 8------------------------*/
sumaPotencias(_,0,1):-!.
sumaPotencias(N,1,P):-	P is N+1,!.
sumaPotencias(N,X,P):-	X1 is X-1,
						sumaPotencias(N,X1,P1),
						potencia(N,X,P2),
						P is P1+P2.
	
/*------------Pregunta 9------------------------*/
mostrarTabla(N):- tabla(N,1).
tabla(N,I):-	I>N,!.
tabla(N,I):-	tablaJ(N,I,1),
				I1 is I+1,
				tabla(N,I1).
tablaJ(N,_,J):-	J>N,!.
tablaJ(N,I,J):-	C is I*J,
				write(I),write(' X '),write(J),write(' = '),write(C),nl,
				J1 is J+1,
				tablaJ(N,I,J1).

/*------------Pregunta 10-----------------------*/
mostrarFactores(N):- tablaF(N,1).
tablaF(N,I):-	I>N,!.
tablaF(N,I):-	tablaFJ(N,I,1),
				I1 is I+1,
				tablaF(N,I1).
tablaFJ(N,_,J):-	J>N,!.
tablaFJ(N,I,J):-	C is I*J,
					N=:=C,
					write(I),write(' X '),write(J),write(' = '),write(C),nl,
					J1 is J+1,
					tablaFJ(N,I,J1).
tablaFJ(N,I,J):-	J1 is J+1,
					tablaFJ(N,I,J1).

/*------------Pregunta 11-----------------------*/
sumaInter(1,-1):-!.
sumaInter(N,S):-	N1 is N-1,
					sumaInter(N1,S1),
					N mod 2 =:= 0,
					S is S1+N.
sumaInter(N,S):-	N1 is N-1,
					sumaInter(N1,S1),
					N mod 2 =:= 1,
					S is S1-N.

/*------------Pregunta 12-----------------------*/
sumaGeom(0,1):-!.
sumaGeom(1,1.5):-!.
sumaGeom(N,S):-	N1 is N-1,
				sumaGeom(N1,S1),
				potencia(2,N,P),
				N2 is 1/P,
				S is S1+N2.

/*------------Pregunta 13-----------------------*/
sumaArmonica(1,1):-!.
sumaArmonica(N,S):-	N1 is N-1,
					sumaArmonica(N1,S1),
					N2 is 1/N,
					S is S1+N2.

/*------------Pregunta 14-----------------------*/
sumaAlterna(1,1):-!.
sumaAlterna(N,S):-	N1 is N-1,
					sumaAlterna(N1,S1),
					potencia(-1,N+1,P),
					N2 is P*(1/N),
					S is S1+N2.

/*------------Pregunta 15-----------------------*/
sumaCuadrados(1,1):-!.
sumaCuadrados(N,S):-	N1 is N-1,
						sumaCuadrados(N1,S1),
						N2 is N*N,	
						S is S1+N2.

/*------------Pregunta 16-----------------------*/
sumaEscalada(N,S):-	escalada(N,1,S).
escalada(1,1,1):-!.
escalada(N,I,_):- 	I>N,!.
escalada(N,I,S):-	escalada(N,I,1,S1),
					I1 is I+1,
					escalada(N,I1,S2),
					S is S1+S2.
escalada(N,I,J,_):-	J>N,!.
escalada(N,I,J,S):-	J1 is J+1,	
					escalada(N,I,J1,S1),
					S is S1 + J.

/*------------Pregunta 17-----------------------*/
/*------------Pregunta 18-----------------------*/
/*------------Pregunta 19-----------------------*/
/*------------Pregunta 20-----------------------*/
