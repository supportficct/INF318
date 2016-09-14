cantidad([],0).
cantidad([X|L1],Q):- cantidad(L1,Q1),Q is Q1+1.

suma([],0).
suma([X|L1],Q):- suma(L1,Q1),Q is Q1+X.

iguales([]).
iguales([_]).
iguales([X,X]).
iguales([X,X|L1]):-iguales([X|L1]).

ordenado(L1):-ordenAsc(L1) ; ordenDsc(L1).

ordenAsc([]).
ordenAsc([_]).
ordenAsc([X,Y|L1]):- X=<Y, ordenAsc([Y|L1]).

ordenDsc([]).
ordenDsc([_]).
ordenDsc([X,Y|L1]):- X>=Y, ordenDsc([Y|L1]).

par(X):- X mod 2 =:= 0.
parImpar([]).
parImpar([X]):- par(X).
parImpar([X,Y|L1]):- par(X),not(par(Y)),parImpar(L1).

sumaPares([],0).
sumaPares([X|L1],S):-par(X),sumaPares(L1,S1),S is S1+X ,!.
sumaPares([_|L1],S):-sumaPares(L1,S).


diferentes([]).
diferentes([X|L1]):- diferente(L1,X),diferentes(L1).

diferente([],_).
diferente([Y|L1],X):- X =\=Y,diferente(L1,X).

cantPares([],0).
cantPares([X|L1],Q):- par(X),cantPares(L1,Q1),Q is Q1 + 1,!.
cantPares([X|L1],Q):- cantPares(L1,Q). 