concatenar([],L2,L2).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).

seEncuentra(L1,X):-concatenar([_],[X|_],L1).

elimP([_|L1],L1).

comparar(X,Y,L2):-X=:=Y,
	elimP(L1,L2).
ciclo([])
ciclo(L1,X,L1):-

eli([],L2,L2).
eli([X|L1],[Y|L2],L3):-
	comparar(X,Y,L2),
	eli(L1,L2,L3).


asc([punto(_,_)]).
asc([punto(X,Y),punto(Q,W)|L1]):-X<Q, Y<W,
	asc([punto(Q,W)|L1]).

gene(0,[puntp(0,0)]).
gene(N,L1):-
	generar(1,N,N,L1).
generar(I,J,N,L1):-I>N,!.
generar(I,J,N,[punto(I,J)|L1]):-
	I1 is I+1, J1 is J-1,
	generar(I1,J1,N,L1).



