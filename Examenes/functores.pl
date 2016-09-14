iguales([]).
iguales([X,X|L1]):-iguales([X|L1]).

menorX([punto(X1,_)],X1).
menorX([punto(X1,_)|L1],Me):-menorX(L1|Me1),menor(Me1,X1,Me).
menor(X,Y,X):-X<Y,!.
menor(X,Y,Y):-Y=<X.

frec([],_,0).
frec([punto(X1,Y1)|L1],punto(X1,Y1),F):-
	frec(L1,punto(X1,Y1),F1),F is F1+1,!.
frec([punto(X1,Y1)|L1],punto(X,Y),F):- frec(L1,punto(X,Y),F).


concatenar([],L2,L2).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).

insertarLugar([],X,[X]).
insertarLugar([X|L1],Y,[Y,X|L1]):-Y<X,!.
insertarLugar([X|L1],Y,[X|L2]):-insertarLugar(L1,Y,L2).


disjuntos([],[]):-!.
disjuntos([X],[]):-!.
disjuntos([],[X]):-!.
disjuntos([X],[X]):-!.
disjuntos([X|L1],[Y|L2]):-X=\=Y,disjuntos([X|L1],L2).



quickSort([],[]).
quickSort([X|L1],L2):-separar(L1,X,LMe,LMa),
	quickSort(LMe,LMeOrd),
	quickSort(LMa,LMaOrd),
	concatenar(LMeOrd,[X|LMaOrd],L2).
separar([],_,[],[]).
separar([X|L1],Y,[X|L2],L3):-X<Y,
	separar(L1,Y,L2,L3),!.
separar([X|L1],Y,L2,[X|L3]):-separar(L1,Y,L2,L3).



sumaPares([],L):-L is 0.
sumaPares([X],L):-X mod 2=:=0,L is X.
sumaPares([X|L1],L):-X mod 2=:=0,L is X,sumaPares(L1,L2),L is L+X.
sumaPares([X|L1],L):-sumaPares(L1,L3).

