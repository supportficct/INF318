fac(0,1):-!.
fac(N,F):- N1 is N-1, fac(N1,F1),F is N*F1.

fibo(1,0):-!.
fibo(2,1):-!.
fibo(N,F):- N1 is N-1, N2 is N-2, fibo(N1,F1),fibo(N2,F2),F is F1+F2.

combi(N,N,1):-!.
combi(_,0,1):-!.
combi(N,R,C):- N1 is N-1, R1 is R-1, combi(N1,R,C1), combi(N1,R1,C2), C is C1 + C2.

pot(X,0,1):-!.
pot(X,1,X):-!.
pot(X,N,F):- N1 is N-1, pot(X,N1,C1), F is X*C1.

mcd(N,M,F):- R1 is N mod M, R1 =:= 0, F is M,!.
mcd(N,M,F):- R1 is N mod M, R1 > 0,mcd(M,R1,F2), F is F2.
