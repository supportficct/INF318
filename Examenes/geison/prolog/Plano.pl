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

