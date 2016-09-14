comenzar:- read(N),cicloI(N,1).
cicloI(N,I):- I > N ,!.
cicloI(N,I):- cicloJ(N,I,1),
		I1 is I + 1,
		cicloI(N,I1).
cicloJ(N,I,J):- J>N,!.
cicloJ(N,I,J):- mostrar(I,J), 
		J1 is J+1,
		cicloJ(N,I,J1).
mostrar(I,J):- write(I),write('*'),write(J),write('='),X is J*I,write(X),nl.

comenzar1:- read(N),cicloA(N,1).
cicloA(N,I):- I>N,!.
cicloA(N,I):- cicloB(N,I,1), I1 is I +1 , cicloA(N,I1).
cicloB(N,I,J):- J>N,!.
cicloB(N,I,J):- cicloC(N,I,J,1), J1 is J +1 , cicloB(N,I,J1).
cicloC(N,I,J,K):- K>N,!.
cicloC(N,I,J,K):- I*I + J*J =:= K*K, mostrar1(I,J,K),K1 is K +1 , cicloC(N,I,J,K1),!.
cicloC(N,I,J,K):- K1 is K +1 , cicloC(N,I,J,K1).
mostrar1(I,J,K):- write(I),write('+'),write(J),write('='),write(K),nl.

comenzar2:- read(N),divisores(N,1).
divisores(N,I):- I>N,!.
divisores(N,I):- N mod I =:= 0,write(I),nl,I1 is I+1,divisores(N,I1),!.
divisores(N,I):-I1 is I+1,divisores(N,I1).

comenzar3:- read(N),read(M),comunes(N,M,1).
comunes(N,M,I):- I>N,!.
comunes(N,M,I):- N mod I =:=0,M mod I =:=0,write(I),nl,I1 is I+1,comunes(N,M,I1),!.
comunes(N,M,I):- I1 is I+1,comunes(N,M,I1),!.

