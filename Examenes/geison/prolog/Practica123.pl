
comenzar:- read(N),sumaenteros(N,1,0).
sumaenteros(N,I,S):- I>N,write(S),!.
sumaenteros(N,I,S):- S1 is S+I,I1 is I+1,sumaenteros(N,I1,S1).


comenzar1:- read(N),sumPares(N,1,1,0).
sumPares(N,I,C,S):- C>N,write(S),!.
sumPares(N,I,C,S):- I mod 2=:=0, S1 is S+I,I1 is I+1,C1 is C+1,sumPares(N,I1,C1,S1),!.
sumPares(N,I,C,S):- I1 is I+1,sumPares(N,I1,C,S).

comenzar2:- read(N),sumImpares(N,1,1,0).
sumImpares(N,I,C,S):- C>N,write(S),!.
sumImpares(N,I,C,S):- I mod 2=:=1, S1 is S+I,I1 is I+1,C1 is C+1,sumImpares(N,I1,C1,S1),!.
sumImpares(N,I,C,S):- I1 is I+1,sumImpares(N,I1,C,S).


fact(0,1):-!.
fact(N,F):- N1 is N-1,
            fact(N1,F1),
	    F is N*F1.

combi(N,N,1):-!.
combi(_,0,1):-!.
combi(N,R,C):- N1 is N-1, R1 is R-1, combi(N1,R,C1),combi(N1,R1,C2),C is C1+C2.

comenzar4:- read(N),cicloI(N,1).
cicloI(N,I):- I > N ,!.
cicloI(N,I):- cicloJ(N,I,1),
		I1 is I + 1,
		cicloI(N,I1).
cicloJ(N,I,J):- J>N,!.
cicloJ(N,I,J):- I=\=J,mostrar(I,J), 
		J1 is J+1,
		cicloJ(N,I,J1),!.
cicloJ(N,I,J):-J1 is J+1,
		cicloJ(N,I,J1).
mostrar(I,J):- write(I),write('*'),write(J),write('='),X is J*I,write(X),nl.

pot(X,0,1):-!.
pot(X,1,X):-!.
pot(X,N,F):- N1 is N-1, pot(X,N1,C1), F is X*C1.


comenzar5:- read(N),divisores(N,1).
divisores(N,I):- I>N,!.
divisores(N,I):- N mod I =:= 0,write(I),nl,I1 is I+1,divisores(N,I1),!.
divisores(N,I):-I1 is I+1,divisores(N,I1).

comenzar6:- read(X),read(N), sumapot(X,N,0,0).
sumapot(X,N,I,S):- I>N,write(S),!.
sumapot(X,N,I,S):- pot(X,I,P),S1 is P + S,I1 is I+1,sumapot(X,N,I1,S1).

comenzar7:- read(N),cicloA(N,1).
cicloA(N,I):- I>N,!.
cicloA(N,I):- cicloB(N,I,1), I1 is I +1 , cicloA(N,I1).
cicloB(N,I,J):- J>N,!.
cicloB(N,I,J):- cicloC(N,I,J,1), J1 is J +1 , cicloB(N,I,J1).
cicloC(N,I,J,K):- K>N,!.
cicloC(N,I,J,K):- I*I + J*J =:= K*K, mostrar1(I,J,K),K1 is K +1 , cicloC(N,I,J,K1),!.
cicloC(N,I,J,K):- K1 is K +1 , cicloC(N,I,J,K1).
mostrar1(I,J,K):- write(I),write('+'),write(J),write('='),write(K),nl.

comenzar8:- read(N),sumD(N,1,0).
sumD(N,I,S):- I=>N,write(S),!.
sumD(N,I,S):- N mod I =:= 0,S1 is S+I,I1 is I+1,sumD(N,I1,S1),!.
sumD(N,I,S):-I1 is I+1,sumD(N,I1,S).


