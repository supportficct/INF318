diferentes([]).
diferentes([X|L1]):- diferente(L1,X),diferentes(L1).

diferente([],_).
diferente([Y|L1],X):- X =\=Y,diferente(L1,X).
par(X):- X mod 2 =:= 0.

cantPares([],0).
cantPares([X|L1],Q):- par(X),cantPares(L1,Q1),Q is Q1 + 1,!.
cantPares([X|L1],Q):- cantPares(L1,Q). 

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

mayor([X], X).
mayor([M|L1], M) :- mayor(L1, M1), M >= M1, !.
mayor([_|L1], M1) :- mayor(L1, M1).

frecuencia([],X,0).
frecuencia([Y|L1],X,Q):- X=:=Y,frecuencia(L1,X,Q1),Q is Q1 + 1 ,!.
frecuencia([Y|L1],X,Q):-frecuencia(L1,X,Q).

purosPares([]).
purosPares([X|L1]):- par(X),purosPares(L1),!.
purosPares(L1):- false.

parImpar([]).
parImpar([X]):- par(X).
parImpar([X,Y|L1]):- par(X),not(par(Y)),parImpar(L1).

imparPar([]).
imparPar([X]):- not(par(X)).
imparPar([X,Y|L1]):- not(par(X)),par(Y),imparPar(L1).

alternos(L1):- parImpar(L1);imparPar(L1).

existeFrec([X|L1],N):-frecuencia([X|L1],X,Q),Q=:=N,!.
existeFrec([X|L1],N):-existeFrec(L1,N).

frec([],L2,N).
frec([X|L1],L2,N):-frecuencia(L2,X,Q),Q=:=N,frec(L1,L2,N),!.
frec([X|L1],L2,N):- ret false.

mismaFrec([X|L1]):- frecuencia([X|L1],X,Q),frec([X|L1],[X|L1],Q).

iguales([]).
iguales([_]).
iguales([X,X]).
iguales([X,X|L1]):-iguales([X|L1]).

grande([]).
grande([X|L1]):- iguales(L1).

cantidad([ ],0).
cantidad([X|L1],Q):- cantidad(L1,Q1),Q is Q1+1.



full(L1):- cantidad(L1,C),frec(L1,L1,C/2).

escalera(L1):- diferentes(L1),mayor(L1,Ma),menor(L1,Me),cantidad(L1,C), Ma - Me =:= C-1.

poker( L1 ) :- cantidad(L1,C),existeFrec(L1,C-1),not(iguales(L1)).