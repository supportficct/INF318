igual(X,Y):-X=:=Y.
igual2(X,X).

dif(X,Y):-X=\=Y.
dif2(X,Y):-not(igual2(X,Y)).

menor(X,Y,X):-X < Y.
menor(X,Y,Y):-Y =< X.

menor(A,B,C,Me):-	menor(A,B,Me1),
					menor(C,Me1,Me).
					
menor(A,B,C,D,Me):-	menor(A,B,C,Me1).
					menor(D,Me1,Me).
					
menor(A,B,C,D,E,Me):-	menor(A,B,C,D,Me1).
						menor(E,Me1,Me).
					

mayor(X,Y,X):-X > Y.
mayor(X,Y,Y):-Y => X.

mayor(A,B,C,Ma):-	mayor(A,B,Ma1),
					mayor(C,Ma1,Ma).
					
mayor(A,B,C,D,Ma):-	mayor(A,B,C,Ma1).
					mayor(D,Ma1,Ma).
					
mayor(A,B,C,D,E,Ma):-	mayor(A,B,C,D,Ma1).
						mayor(E,Ma1,Ma).

existeSuma(A,B,C):-	igual(A+B,C).
existeSuma(A,B,C):-	igual(C+B,A).
existeSuma(A,B,C):-	igual(A+C,B).