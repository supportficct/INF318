par(X):-((X mod 2)=:=0).
impar(X):-((X mod 2)=:=1).

sumaPar([],0).
sumaPar([X|L1],Q):-sumaPar(L1,Q1),par(X),Q is X+Q1,!.
sumaPar([X|L1],Q):-sumaPar(L1,Q).


primo(2).
primo(P):-primo2(P,2).
primo2(P,I):-I<P,((P mod I) =\=0),I1 is I+1,primo2(P,I1),!.
primo2(P,I):-I=:=P.

cantidadPares([],0).
cantidadPares([X|L1],Q):-cantidadPares(L1,Q1),par(X),Q is (Q1+1),!.
cantidadPares([X|L1],Q):-cantidadPares(L1,Q).

cantidadPrimos([],0).
cantidadPrimos([X|L1],Q):-cantidadPrimos(L1,Q1),primo(X),Q is (Q1+1),!.
cantidadPrimos([X|L1],Q):-cantidadPrimos(L1,Q).

 menor([X], X).
 menor([X|L1],Me):-menor(L1,M1),M1<X,Me is M1,!.
 menor([X|L1], Me):-Me is X.

 mayor([X], X).
 mayor([X|L1],My):-mayor(L1,M1),M1<X,My is M1,!.
 mayor([X|L1], My):-My is X.


frecuencia([],_,0).
frecuencia([Y|L1], X, Q):-frecuencia(L1,X,Q1),X=:=Y,Q is (Q1+1),!.
frecuencia([Y|L1], X, Q):-frecuencia(L1,X,Q).

puroPares([]).
puroPares([X|L1]):-par(X),puroPares(L1).

alternosImpar([X]):-impar(X).
alternosImpar([X|L1]):-impar(X),alternosPar(L1).

alternosPar([X]):-par(X).
alternosPar([X|L1]):-par(X),alternosImpar(L1).

alternos([]).
alternos([X]).
alternos([X|L1]):-par(X),alternosImpar(L1),!.
alternos([X|L1]):-alternosPar(L1).

existeFrec([], 0).
existeFrec([_],1). 
existeFrec([X|L1], N):-existeFrec([X|L1],X,F1),N=:=F1,!.
existeFrec([_|L1],N):-existeFrec(L1,N).


mismasFrec([]).
mismasFrec([Y|L1]):-frecuencia([Y|L1],Y,Q1),mismasFrec2(L1,[Y|L1],Q1).
mismasFrec2([Y],L,Q):-frecuencia(L,Y,E),Q is E.
mismasFrec2([Y|L1],L,Q):-mismasFrec2(L1,L,Q1),Q1=:=Q.

grande([]).
grande([_]).
grande([X,X]).
grande([X,X|L1]):-grande([X,L1]).

escalera([X|L1]):-escalera2(L1,X).
escalera2([X],Y):-X=:=Y+1.
escalera2([X|L1],Y):-X=:=Y+1,escalera2(L1,X).

poker([X|L1]):-poker2([X|L1],[X|L1],[]).

poker2([],L,NL).
poker2([X|L1],L,NL):-frecuencia(L,X,Q),Q>1,poker2(L1,L,[X|NL]),!.
poker2([X|L1],L,NL):-poker2(L1,L,NL),grande(NL).

cantidad([],0).
cantidad([X|L1],Q):-cantidadPares(L1,Q1),Q is (Q1+1).

full([X|L1]):-D is X,full3(L1,D,J),full2([X|L1],D,J,0,0).

full3([],D,J):=1>2.
full3([X|L1],D,J):-X=:=D,full3(L1,D,J),!.
full3([X|L1],D,J):-J is X.

full2([],D,J,CD,CJ):-CD=:=CJ;CD=:=CJ+1;CD+1=:=CJ.
full2([X|L1],D,J,CD,CJ):-X=:=D,CD is CD+1,full2(L1,D,J,CD,CJ),!.
full2([X|L1],D,J,CD,CJ):-X=:=J,CJ is CJ+1,full2(L1,D,J,CD,CJ),!.




