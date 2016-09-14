
secuencia(L1,X):- secuencia(L1,X,1).
secuencia([],X,I):- I>X.
secuencia([I|L1],X,I):- I1 is I+1,secuencia(L1,X,I1).

secuenciap(L1,X):- secuenciap(L1,X,1).
secuenciap([],X,I):- I>X.
secuenciap([C|L1],X,I):- I1 is I+1,C is I*2,secuenciap(L1,X,I1).

secuenciad(L1,X):- secuenciad(L1,X,1).
secuenciad([],X,I):- I>X.
secuenciad([I|L1],X,I):- I1 is I+1,X mod I =:=0,secuenciad(L1,X,I1),!.
secuenciad(L1,X,I):- I1 is I+1,secuenciad(L1,X,I1).

secuenciafb(L1,X):- secuenciafb(L1,X,1).
secuenciafb([],X,I):- I>X.
secuenciafb([C|L1],X,I):- I1 is I+1,fibo(I,C),secuenciafb(L1,X,I1).

secuenciafc(L1,X):- secuenciafc(L1,X,1).
secuenciafc([],X,I):- I>X.
secuenciafc([C|L1],X,I):- I1 is I+1,fac(I,C),secuenciafc(L1,X,I1).




fac(0,1):-!.
fac(N,F):- N1 is N-1, fac(N1,F1),F is N*F1.

fibo(1,0):-!.
fibo(2,1):-!.
fibo(N,F):- N1 is N-1, N2 is N-2, fibo(N1,F1),fibo(N2,F2),F is F1+F2.


