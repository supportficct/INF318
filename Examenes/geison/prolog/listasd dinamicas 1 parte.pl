concatenar([],L2,L2).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).

ultimo([X],X).
ultimo([_|L1],X):- ultimo(L1,X).

ultimo1(L1,X):- concatenar(_,[X],L1).

eliminarUlt([_],[]).
eliminarUlt([X|L1],[X|L2]):- eliminarUlt(L1,L2).

eliminarUlt1(L1,L2):-concatenar(L2,[X],L1).

seEncuentra([X|_],X).
seEncuentra([Y|L1],X):- seEncuentra(L1,X).

seEncuentra1(L1,X):- concatenar(_,[X|_],L1).

extremosIg(L1):- concatenar([X|_],[X],L1).