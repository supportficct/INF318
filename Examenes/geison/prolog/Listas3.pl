cicloP(N,A,S):-A>N,S is 0,!.
cicloP(N,A,S):- N mod A=:=0,A=\=N,A1 is A+1,cicloP(N,A1,Sm),S is Sm+A,!.
cicloP(N,A,S):- A1 is A+1,cicloP(N,A1,Sm),S is Sm.
perfect(N):-cicloP(N,1,T),T=:=N.
primo(N):-cicloP(N,1,T),T=:=1;N=:=1.

cantPrimos([],0).
cantPrimos([X|L1],Q):- primo(X),cantPrimos(L1,Q1),Q is Q1 + 1,!.
cantPrimos([X|L1],Q):- cantPrimos(L1,Q).

menor([X], X).
menor([M|L1], M) :- menor(L1, M1), M =< M1, !.
menor([_|L1], M1) :- menor(L1, M1).
