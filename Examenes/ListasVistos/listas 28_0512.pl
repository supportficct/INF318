suma([],0).
suma([X|L1],Sum):-suma(L1,Sum1),
                  Sum is Sum1 + X.
iguales([]).
iguales([_]).
iguales([X,X|L1]):-iguales([X|L1]).

%lados_iguales
extremosiguales(L1):- primerElemento(L1,X),
                      ultimoElemento(L1,X).
primerElemento([X|L1],X).
ultimoElemento([X],X).
ultimoElemento([_|L1],X):- ultimoElemento(L1,X).

ordenado([]).
ordenado(L1):-ascendente(L1),!;
              descendente(L1).

ascendente([_]).
ascendente([X,Y|L]):- X =< Y,
                      ascendente([Y|L]),!.
descendente([_]).
descendente([X,Y|L]):- X >=Y,
                       descendente([Y|L]),!.

primo(N):-primo(N,2).
primo(N,I):-I > N//2 , ! .
primo(N,I):- N mod I =\= 0,
                        I1 is I+1,
                        primo(N,I1).
listaPrimo([X]):-primo(X).
listaPrimo([X|L]):- listaPrimo(L),
                    primo(X).

%Suma_pares
par(N):- N mod 2 =:= 0.
sumaPares([],0).
sumaPares([X],X):-par(X).
sumaPares([X|L1],Sum):-  
                        sumaPares(L1,Sum2),
						par(X),
						Sum is Sum2 + X.
sumaPares([X|L1],Sum):- sumaPares(L1,Sum).
%===================
frecuancia([],X,0).
frecuancia([X],X,1).
frecuancia([X|L1],X,Q1):-	
							frecuancia(L1,X,Q2),
							Q1 is Q2 + 1.
frecuancia([X|L1],Y,Q1):-frecuancia(L1,Y,Q1).
%========================
diferentes([]):-!.
diferentes([X]):-!.
diferentes([X|L1]):-frecuancia(L1,X,Q),
					Q =:= 1,
					diferentes(L1).					
%insertar_ultimo
insertUlt([],X,[X]).
insertUlt([X|L1],Y,[X|L2]):-    insertUlt(L1,Y,L2).
%eliminar_Ultimo
eliminarUlt([_],[]).
eliminarUlt([X|L1],[X|L2]):-eliminarUlt(L1,L2).

%insertar_Al_Incio
insertarPri(L1,X,[X|L1]).

%eliminar_Primero
eliminarPri([X|L1],L1).

%insertarLugar
insertarLugar([],X,[X]).
insertarLugar([X|L1],Y,[Y,X|L1]):-Y =< X.
insertarLugar([X|L1],Y,[X|L2]):-insertarLugar(L1,Y,L2).
					
%eliminar_Pares
elimiPares([],[]).
elimiPares([X],[]):-par(X).
elimiPares([X|L1],[X|L2]):-  
                        elimiPares(L1,L2),
						not(par(X)).	
elimiPares([X|L1],L2):- elimiPares(L1,L2).

%сссссссссссссссссссссссс					
menor(A, B, Me):- A<B,
                  Me is A,!;Me is B,!.
mayor(A, B, Me):- A>B,
                  Me is A,!;Me is B,!.
				  
menor([X],X).
menor([X|L1],Me):-menor(L1,Me1),
                  menor(X,Me1,Me).                  

mayor([X],X).
mayor([X|L1],My):-mayor(L1,My1),
                  mayor(X,My1,My).                  
				  
iguales([]).
iguales([_]).
iguales([X,X|L1]):-iguales([X|L1]).
%nofunciona
ascX([]).
ascX([_]).
ascX([punto(X1,Y1),punto(X2,Y2)|L1]):- X1 =< X2,
                                       ascX([punto(X2,Y2)|L1]).

%functores==========================
menordeX(punto(X,Y),punto(Z,T),punto(X,Y)):-X<Z,!.
menordeX(punto(X,Y),punto(Z,T),punto(Z,T)):-!.

menordeY(punto(X,Y),punto(Z,T),punto(X,Y)):-Y<T,!.
menordeY(punto(X,Y),punto(Z,T),punto(Z,T)):-!.

mayordeY(punto(X,Y),punto(Z,T),punto(X,Y)):-Y>T,!.
mayordeY(punto(X,Y),punto(Z,T),punto(Z,T)):-!.

mayordeX(punto(X,Y),punto(Z,T),punto(X,Y)):-X>Z,!.
mayordeX(punto(X,Y),punto(Z,T),punto(Z,T)):-!.

cuadraN(punto(0,0),0):-!.
cuadraN(punto(X,Y),1):-X>0,Y>0,!.
cuadraN(punto(X,Y),2):-X<0,Y>0,!.
cuadraN(punto(X,Y),3):-X<0,Y<0,!.
cuadraN(punto(X,Y),4):-X>0,Y<0,!.
cuadraN(punto(X,0),5):-X=\=0,!.
cuadraN(punto(0,Y),6):-Y=\=0,!.
%mismocuadrente
cuadraN1(P1,P2):-cuadraN(P1,C),cuadraN(P2,C1),C=:=C1.

pendiente(punto(X1,Y1),punto(X2,Y2),M):-(X1=\=X2,M is (Y2-Y1)/(X2-X1)),!;(M is 1000000).
%===============================
/*1.-*/
menorX([punto(X,Y)],punto(X,Y)):-!.
menorX([punto(X,Y)|L1],L):-menorX(L1,punto(T,F)),
							menordeX(punto(T,F),punto(X,Y),L).
/*2.-*/
menorY([punto(X,Y)],punto(X,Y)):-!.
menorY([punto(X,Y)|L1],L):-menorY(L1,punto(T,F)),
							menordeY(punto(T,F),punto(X,Y),L).
/*3.-*/
mayorX([punto(X,Y)],punto(X,Y)):-!.
mayorX([punto(X,Y)|L1],L):-mayorX(L1,punto(T,F)),
							mayordeX(punto(T,F),punto(X,Y),L).
/*4.-*/
mayorY([punto(X,Y)],punto(X,Y)):-!.
mayorY([punto(X,Y)|L1],L):-mayorY(L1,punto(T,F)),
							mayordeY(punto(T,F),punto(X,Y),L).
/*5.-*/
mismoLug([]):-!.
mismoLug([punto(X,Y)]):-!.
mismoLug([punto(X,Y),punto(Z,T)|L1]):-cuadraN(punto(X,Y),C),
									cuadraN(punto(Z,T),C1),
									C=:=C1,
									mismoLug([punto(Z,T)|L1]).
/*6.- */
puntosDif([punto(X,Y)]):-!.
puntosDif([punto(X,Y),punto(Z,T)|L1]):-(X=\=Z,!;Y=\=T),
										puntosDif([punto(X,Y)|L1]),
										puntosDif([punto(Z,T)|L1]).
/*7.- */
lineal([punto(X,Y)]):-!.
lineal([punto(X1,Y1),punto(X2,Y2)|L1]):-	pendiente(punto(X1,Y1),punto(X2,Y2),M),
											lineal([punto(X2,Y2)|L1],M).
lineal([punto(X,Y)],M):-!.
lineal([punto(X1,Y1),punto(X2,Y2)|L1],M):-	pendiente(punto(X1,Y1),punto(X2,Y2),M1),
											M=:=M1,
											lineal([punto(X2,Y2)|L1],M).
/*8.- */
mismoPuntos([punto(X,Y)]):-!.
mismoPuntos([punto(X,Y),punto(Z,T)|L1]):-(X=:=Z,!;Y=:=T),
										mismoPuntos([punto(X,Y)|L1]),
										mismoPuntos([punto(Z,T)|L1]).
/*9.- */
distancia([punto(X,Y)],0):-!.
distancia([punto(X,Y),punto(X1,Y1)|L1],D):-	distancia([punto(X1,Y1)|L1],D1),
											D is D1+(sqrt((X1-X)^2 + (Y1-Y)^2)),!.
/*10.-*/
soloEjes([punto(X,0)]):-!.
soloEjes([punto(0,Y)]):-!.
soloEjes([punto(X,0)|L1]):-soloEjes(L1),!.
soloEjes([punto(0,Y)|L1]):-soloEjes(L1),!.
/*11.-*/
ascendentes([punto(X,Y)]):-!.
ascendentes([punto(X,Y),punto(X1,Y1)|L1]):-	X1>=X,
											ascendentes([punto(X1,Y1)|L1]),!.
/*12.- */
cantidadEje([punto(X,Y)],1):-X=:=0,!;Y=:=0,!.
cantidadEje([punto(X,Y)],0):-!.
cantidadEje([punto(X,0)|L1],Q1):-cantidadEje(L1,Q2),
									Q1 is Q2+1,!.
cantidadEje([punto(0,Y)|L1],Q1):-cantidadEje(L1,Q2),
									Q1 is Q2+1,!.
cantidadEje([punto(X,Y)|L1],Q1):-cantidadEje(L1,Q1),!.
/*13.- */
puntosMedios([punto(X,Y),punto(X1,Y1)],[punto(X2,Y2)]):-X2 is (X+X1)/2 ,
														Y2 is (Y+Y1)/2,!.
puntosMedios([punto(X,Y),punto(X1,Y1)|L1],[punto(X2,Y2)|L2]):-X2 is (X+X1)/2 ,
															Y2 is (Y+Y1)/2,
															puntosMedios([punto(X1,Y1)|L1],L2).
/*14.- menor_distancia */
distancia(punto(X1,Y1), punto(X2,Y2), D1):- D1 is sqrt((X1- X2)**2 +(Y1-Y2)**2).
menorDist([],0):-!.
menorDist([_],0):-!.
menorDist([punto(X,Y),punto(X1,Y1)|L1],Me):-distancia(punto(X,Y), punto(X1,Y1), Me1),
											Me1 < Me,
											menorDist([punto(X1,Y1)|L1],Me1).
menorDist([punto(X,Y),punto(X1,Y1)|L1],Me):-menorDist([punto(X1,Y1)|L1],Me).			
concatenar																												
										
intercalar([],[],[]).
intercalar([],L2,L2).
intercalar(L1,[],L1).
intercalar([X|L1],[Y|L2],[X,Y|L3]):-intercalar(L1,L2,L3).

mezclar([],[],[]).
mezclar([],L2,L2).
mezclar(L1,[],L1).
mezclar([X|L1],[Y,L2],[X|L3]):- X < Y, mezclar(L1,[Y|L2],L3),!.
mezclar([X|L1],[Y,L2],[Y|L3]):- mezclar([X|L1],L2,L3),!.                                                        



%ExtremosIguales
extremosIguales(L1):-   primerElem(L1,X),
                        ultimoElem(L1,X).
primerElem([X|L1],X).
ultimoElem([X],X).
ultimoElem([_|L1],X):- ultimoElem(L1,X).
%separa_menores_a_la_izq_may_ala_Der
separar([],X,[],[]):-!.
separar([Y|L1],X,[Y|LMe],LMy):- Y < X, separar(L1,X,LMe,LMy),!.
separar([Y|L1],X,LMe,[Y|LMy]):- separar(L1,X,LMe,LMy),!.				
		
%concatenar                                                     
concatenar([],L2,L2).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).

%Ordenar_QUIKSORT
quikSort([],[]).
quikSort([X|L1],L2):-   separar(L1,X,LMe,LMy),
                                                quikSort(LMe,LMeOrd),
                                                quikSort(LMy,LMyOrd),
                                                concatenar(LMeOrd,[X|LMyOrd],L2).

												









