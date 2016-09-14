insertPri(L1,X,[X|L1]).

insertUlt([],X,[X]).
insertUlt([Y|L1],X,[Y|L2]):-
	insertUlt(L1,X,L2).
elimPri([],[]).
elimPri([_|L1],L1).

elimUlt([_],[]).
elimUlt([X|L1],[X|L2]):-
	elimUlt(L1,L2).
insertPos([],X,[X]).
insertPos([X|L1],Y,[Y,X|L1]):-X>Y,!.
insertPos([Y|L1],X,[Y|L2]):-
	insertPos(L1,X,L2).

insertPriC(L1,X,L2):-
	concatenar([X],L1,L2).
insertUltC(L1,X,L2):-
	concatenar(L1,[X],L2).
elimPriC([_|L1],L2):-
	concatenar(L1,[],L2).
elimUltC(L1,L2):-concatenar(L2,[_],L1).

elimtodoX([],_,[]).
elimtodoX([Y|L1],X,L2):-
	X=:=Y,
	elimPri([Y|L1],L3),
	elimtodoX(L3,X,L2).
elimtodoX([Y|L1],X,[Y|L2]):-
	elimtodoX(L1,X,L2).

elimL1deL2([],L2,L3):-concatenar([],L2,L3).
elimL1deL2([X|L1],L2,L3):-
	elimtodoX(L2,X,L4),
	elimL1deL2(L1,L4,L3).

menor(X,Y,Z):-X<Y, Z is X,!.
menor(X,Y,Z):-X>Y, Z is Y,!.
menor([X],X).
menor([X|L1],Me):-
	menor(L1,Me1),
	menor(X,Me1,Me).

mayor(X,Y,Z):-X>Y, Z is X,!.
mayor(X,Y,Z):-X<Y, Z is Y,!.
mayor([X],X).
mayor([X|L1],My):-
	mayor(L1,My1),
	mayor(X,My1,My).
seEncuentra([X|_],Y):-X=:=Y,!.
seEncuentra([_|L1],Y):-
	seEncuentra(L1,Y).

subConj([X],L2):-seEncuentra(L2,X).
subConj([X|L1],L2):-
	seEncuentra(L2,X),
	subConj(L1,L2).

suma([],0).
suma([X|L1],Sum):-
	suma(L1,Sum1),
	Sum is X+Sum1.

cant([],0).
cant([_|L1],C):-
	cant(L1,C1),
	C is C1+1.
promedio(L1,P):-
	suma(L1,Sum),
	cant(L1,Can),
	P is Sum/Can.

ordAsc([_]).
ordAsc([X,Y|L1]):-X<Y,
	ordAsc([Y|L1]).
ordDes([_]).
ordDes([X,Y|L1]):-X>Y,
	ordDes([Y|L1]).
ordenado(L1):-ordAsc(L1);ordDes(L1).

frec(X,Y,Z,Z1):-X=:=Y,Z1 is Z+1,!.
frec(_,_,Z,Z1):-Z1 is Z,!.
frecuencia([],_,0).
frecuencia([Y|L1],X,F):-
	frecuencia(L1,X,F1),
	frec(X,Y,F1,F).

concatenar([],L2,L2).
concatenar([X|L1],L2,[X|L3]):-
	concatenar(L1,L2,L3).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"WAAAAAAAA"%%%%%%%%%%%%%%%%%%%%
%%	N=4 L1=[1,2,3,4]
naturales([],0).
naturales(L1,N):-
	N1 is N-1,
	naturales(L2,N1),
	concatenar(L2,[N],L1).



%%	N=4 L1=[2,4,6,8]
%%	N=4 L1=[2,4,6,8]
%%	N=4 L1=[2,4,6,8]

%%	N=4 L1=[2,4,6,8]
