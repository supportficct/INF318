lugar(X,Y,1):-X>0,Y>0.
lugar(X,Y,2):-X<0,Y>0.
lugar(X,Y,3):-X<0,Y<0.
lugar(X,Y,4):-X>0,Y<0.
lugar(X,Y,5):-X=\=0,Y=0.
lugar(X,Y,6):-X=0,Y=\=0.
lugar(X,Y,7):-X=0,Y=0.

mismoLugar(X1,Y1,X2,Y2):-lugar(X1,Y1,Z),lugar(X2,Y2,Z).

ejeX(X1,Y1):-lugar(X1,Y1,5).
ejeY(X1,Y1):-lugar(X1,Y1,6).

enEje(X,Y):-lugar(X,Y,5);lugar(X,Y,6).

ejesDif(X1,Y1,X2,Y2):-	lugar(X1,Y1,5),lugar(X2,Y2,6);
						lugar(X2,Y2,5),lugar(X1,Y1,6).
						
distancia(X1,Y1,X2,Y2,Dist):-Dist is sqrt((X1-X2)**2+(Y1-Y2)**2).

diagOpuesto(X1,Y1,X2,Y2):-	lugar(X1,Y1,1),lugar(X2,Y2,3);
							lugar(X1,Y1,3),lugar(X2,Y2,1);
							lugar(X1,Y1,2),lugar(X2,Y2,4);
							lugar(X1,Y1,4),lugar(X2,Y2,2).
					
isoceles(X1,Y1,X2,Y2,X3,Y3):- 	distancia(X1,Y1,X2,Y2,Z),distancia(X2,Y2,X3,Y3,Z), not(distancia(X1,Y1,X3,Y3,Z));
								distancia(X1,Y1,X2,Y2,Z),distancia(X1,Y1,X3,Y3,Z), not(distancia(X2,Y2,X3,Y3,Z));
								distancia(X1,Y1,X3,Y3,Z),distancia(X2,Y2,X3,Y3,Z), not(distancia(X1,Y1,X2,Y2,Z)).

dentro(X1,Y1,R):-	distancia(0,0,X1,Y1,Z),Z<R.

ladoEje(X1,Y1,X2,Y2,X3,Y3):-	ejeX(X1,Y1), ejeX(X2,Y2), not(ejeX(X3,Y3));
								ejeX(X3,Y3), ejeX(X2,Y2), not(ejeX(X1,Y1));	
								ejeX(X3,Y3), ejeX(X1,Y1), not(ejeX(X2,Y2));
								ejeY(X1,Y1), ejeY(X2,Y2), not(ejeY(X3,Y3));
								ejeY(X3,Y3), ejeY(X2,Y2), not(ejeY(X1,Y1));	
								ejeY(X3,Y3), ejeY(X1,Y1), not(ejeY(X2,Y2)).
							
pendiente(X1,Y1,X2,Y2,P):-	P is ((Y2-Y1)/(X2-X1)).											