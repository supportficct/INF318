%EliminarTodo  

 eliminarx([X],X,[]).
 eliminarx([X|L1],Y,L1):- X=:=Y,!.
 eliminarx([X|L1],Y,[X|L2]):- eliminarx(L1,Y,L2).

 seencuentra([X],X).
 seencuentra([X|L1],Y):- seencuentra(L1,Y);X=:=Y.
 
 eliminartodo(L1,Y,L2):- seencuentra(L1,Y),
		         eliminarx(L1,Y,L3),eliminartodo(L3,Y,L2),!.
 eliminartodo(L1,_,L1).
 
mayX(punto(X,Y),punto(A,B),punto(X,Y)):-X>=A,!.
mayX(P1,P2,P2).
 
asc([punto(X,Y),punto(X1,Y1)]):-Y1>=Y,!.
asc([P1,P2|L1]):-asc([P2|L1]),mayX(P1,P2,M),P2=:=M.


generar(0,[punto(0,0)]).
generar(X,L1):- 
				L1 is [punto(I,X)],I is (X-1) .
		 	




%generar(2,L1).
%eliminartodo([1,3],[1,2,3],L2).
%asc([punto(1,5),punto(2,6)]).
%asc([punto(1,5),punto(2,3)]).

