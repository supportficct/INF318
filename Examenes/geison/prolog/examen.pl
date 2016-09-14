
comenzar:- read(N),cicloI(N,1).
cicloI(N,I):- I > N ,!.
cicloI(N,I):- cicloJ(N,I,1),
		I1 is I + 1,
		cicloI(N,I1).
cicloJ(N,I,J):- J>N,!.
cicloJ(N,I,J):- I=\=J,mostrar(I,J), 
		J1 is J+1,
		cicloJ(N,I,J1),!.
cicloJ(N,I,J):- J1 is J+1,
		cicloJ(N,I,J1).
mostrar(I,J):- write(I),write('*'),write(J),write('='),X is J*I,write(X),nl.