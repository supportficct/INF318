intercalar([],L2,L2):-!.
intercalar(L1,[],L1):-!.
intercalar([X|L1],[Y|L2],[X,Y|L3]):-intercalar(L1,L2,L3).

mesclar([],L2,L2):-!.
mesclar(L1,[],L1):-!.
mesclar([X|L1],[Y|L2],[X|L3]):- X < Y,mesclar(L1,[Y|L2],L3),!.
mesclar([X|L1],[Y|L2],[Y|L3]):- mesclar([X|L1],L2,L3).

separarpi([],[],[]).
separarpi([X|L1],[X|L2],L3):- X mod 2 =:= 0,separarpi(L1,L2,L3),!.
separarpi([X|L1],L2,[X|L3]):- separarpi(L1,L2,L3).


separar([],X,[],[]).
separar([Y|L1],X,[Y|L2],L3):-Y < X,separar(L1,X,L2,L3),!.
separar([Y|L1],X,L2,[Y|L3]):- separar(L1,X,L2,L3).

concatenar([],L2,L2).
concatenar([X|L1],L2,[X|L3]):- concatenar(L1,L2,L3).


quickSort([],[]).
quickSort([X|L1],L2):- separar(L1,X,L3,L4),quickSort(L3,L5),quickSort(L4,L6),concatenar(L5,[X|L6],L2).