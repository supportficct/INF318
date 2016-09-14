/*1. sumaEnteros(N, Sum) : Predicado que encuentra en Sum la suma de los
primeros n números enteros positivos. Ejemplo: n = 4. suma = 1 + 2 + 3 + 4*/
suma(N,RESULTADO):-N=:=1,RESULTADO is 1,!.
suma(N,RESULTADO):- N1 is N-1,
					suma(N1,RESULTADO1),
					RESULTADO is N+RESULTADO1.
					
/*2. sumaPares(N, Sum) : Predicado que encuentra en Sum la suma de los
primeros n números pares. Ejemplo: n = 4. suma = 2 + 4 + 6 + 8*/
sumaPares(1,2):-!.
sumaPares(N,X):- N1 is N-1,
				sumaPares(N1,X1),
				N2 is N*2,
				X is X1+N2.
				
/*3. sumaImpares(N, Sum) : Predicado que encuentra en Sum la suma de los
primeros números impares.
Ejemplo: n = 4. suma = 1 + 3 + 5 + 7*/
sumaImpares(1,1):-!.
sumaImpares(N,X):-N1 is N-1,
				sumaImpares(N1,X1),
				N2 is (N*2)-1,
				X is X1+N2.
				
/*4. factorial(N, F) : Predicado que encuentra en F el factorial del entero positivo N.*/
factorial(0,1):-!.
factorial(N,_resp):-N1 is N-1,
					factorial(N1,_resp1),
					_resp is _resp1 * N.
					
/*5. combi(N, R, NR) : Predicado que encuentra en NR el número combinatorio
de N elementos tomados de R en R.*/
combinatoria(_,0,1):-!.
combinatoria(N,R,1):-N=:=R,!.
combinatoria(N,R,_resp):- N1 is N-1,
						R1 is R-1,
						combinatoria(N1,R,C1),
						combinatoria(N1,R1,C2),
						_resp is C1 + C2.
						
/*6. sumaCoef(N, Sum) : Predicado que encuentra en Sum la suma de los
coeficientes binomiales..*/
sumaCoef(N,RESP):-combinatoria(_,N,RESP)!.
sumaCoef(N,RESP):-N1 is N-1,
					sumaCoef(N1,RESP2),
					combinatoria(N,N,RESP1),
					RESP is RESP1 + RES2.
					
/*7. potencia(X, N) : Predicado que encuentra en Pot, la potencia de X elevado a
N, X y N son valores enteros positivos..*/
potencia(_,0,1):-!.
potencia(X,N,POT):-N1 is N-1,
					potencia(X,N1,POT1),
					POT is POT1 * X.
					
/*8. sumaPot(X, N, Sum) : Predicado que encuentra en Sum la suma de potencias..*/
sumaPotencia(X,0,POT):-potencia(X,0,M),POT is M,!.
sumaPotencia(X,N,POT):-N1 is N-1,
					sumaPotencia(X,N1,POT1),
					potencia(X,N,POT2),
					POT is POT1+POT2.
/*9. mostrarTabla(N) : Predicado que muestra la tabla de multiplica desde 1 hasta
N.
Ejemplo:
1 x 1 = 1
1 x 2 = 2
. . . . .
1 x n = n
. . . . . .
n x n = 2n.*/

mostrarTabla:- write('introduzca el valor N: '), read(N),tabla(N,1).
tabla(N,I):-I>N,!.
tabla(N,I):-tabla(N,I,1),
			I1 is I+1,
			tabla(N,I1).
tabla(N,I,J):-J>N,!.
tabla(N,I,J):-mostrar(I,J),
				J1 is J+1,
				tabla(N,I,J1).
mostrar(I,J):- R is I * J, write(I '*' J '=' R),nl.