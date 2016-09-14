lugar(X,Y,0):- X=:=0, Y=:=0 ,!.
lugar(X,Y,1):- X>0, Y>0 ,!.
lugar(X,Y,2):- X<0, Y>0 ,!.
lugar(X,Y,3):- X<0, Y<0 ,!.
lugar(X,Y,4):- X>0, Y<0 ,!.
lugar(X,Y,5):- X>0 ;X<0, Y=:=0 ,!.
lugar(X,Y,6):- Y>0 ;Y<0, X=:=0 ,!.

mismolugar(X1,Y1,X2,Y2):- lugar(X1,Y1,L1), lugar(X2,Y2,L1).
distancia(X1,Y1,X2,Y2,D1):- D1 is sqrt((X1-X2)**2 + (Y1-Y2)**2).
diferentes(A,B,C):- A=\=B, A=\=C , B=\=C.
dosiguales(A,B,C):- (A=:=B,A=\=C);(A=:=C,A=\=B);(B=:=C,B=\=A).
escaleno(X1,Y1,X2,Y2,X3,Y3):- distancia(X1,Y1,X2,Y2,D1), distancia(X1,Y1,X3,Y3,D2), distancia(X2,Y2,X3,Y3,D3), diferentes(D1,D2,D3).
isosceles(X1,Y1,X2,Y2,X3,Y3):- distancia(X1,Y1,X2,Y2,D1), distancia(X1,Y1,X3,Y3,D2), distancia(X2,Y2,X3,Y3,D3), dosiguales(D1,D2,D3).

%horizontal(_,Y,_,Y).
%vertical(X,_,X,_).
%pendiente(X1,)

par(N):- N mod 2 =:= 0.
impar(N):- not(par(N)).

dospares(A,B):- par(A), par(B).
%pares(A,B,C):- par(A), par(B), par(C).
dospares1(A,B,C):- dospares(A,B), impar(C); dospares(A,C), impar(B); dospares(B,C), impar(A).
dospares2(A,B,C,D):-	(dospares1(A,B,C), impar(D));
						(dospares1(A,B,D), impar(C));
						(dospares1(B,C,D), impar(A)).

parimpar(X,Y):- par(X),impar(Y); par(Y), impar(X).
parimpar1(X,Y,Z):- 	(parimpar(X,Y), par(Z); parimpar(X,Y), impar(Z)); 
					(parimpar(X,Z), par(Y); parimpar(X,Z), impar(Y));
					(parimpar(Y,Z), par(X); parimpar(Y,Z), impar(X)).

parimpar2(W,X,Y,Z):-	(parimpar1(W,X,Y), par(Z); parimpar1(W,X,Y), impar(Z));
						(parimpar1(W,X,Z), par(Y); parimpar1(W,X,Z), impar(Y));
						(parimpar1(X,Y,Z), par(W); parimpar1(X,Y,Z), impar(W)).
	
parimpar3(V,W,X,Y,Z):-	(parimpar2(V,W,X,Y), par(Z); parimpar2(V,W,X,Y), impar(Z));
						(parimpar2(V,W,X,Z), par(Y); parimpar2(V,W,X,Z), impar(Y));
						(parimpar2(W,X,Y,Z), par(V); parimpar2(W,X,Y,Z), impar(V));
%parimpar(A,B,C):- not (pares(A,B,C)), not(impares(A,B,C)).						
						
%iguales(A,B):- A=:=B.
%iguales(A,A).

diferente(A,B):- A=\=B.
diferente(A,B,C):- diferente(A,B), diferente(A,C), diferente(B,C).
diferente(A,B,C,D):- diferente(A,B,C), diferente(A,B,D), diferente(B,C,D).
						


