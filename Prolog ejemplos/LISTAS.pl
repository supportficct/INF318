/*Suma*/
suma([],0):-!.
suma([X|L1],Sum):-	suma(L1,Sum1),
					Sum is Sum1+X.

/*mayor de dos numeros*/
mayor(A,B,A):- A>B.
mayor(A,B,B):- A<B. 




menorr([],X).
menorr([X|L1],Me):- menorr(L1,Me1),menorr(Me1,X,Me).
menorr(X,Y,X):- X<Y,!.
menorr(X,Y,Y).


































/*mayor elemento de una lista*/
mayor([X],X):-!.
mayor([X|L1],May):-	mayor(L1,May1),
					mayor(X,May1,May).
				
/*iguales todos*/
iguales([]).
iguales([_]).
iguales([X,X|L1]):-iguales([X|L1]).

/*frecuencia*/
incrementar(X,X,F1,F):-F is F1+1,!.
incrementar(_,_,F1,F1):-!.

frecuencia([],_,0):-!.
frecuencia([X|L1],Y,F):-frecuencia(L1,Y,F1),
						incrementar(X,Y,F1,F).
						
/*Todos diferentes de una lista*/
diferentes(L1):-diferentes(L1,L1).
diferentes([],_):-!.
diferentes([X|L1],L2):-	frecuencia(L2,X,1),
						diferentes(L1,L2).
						
/*cantidad de numeros pares de una lista*/
cantidadPar([X],1):- X mod 2=:=0,!.
cantidadPar([X],0):- X mod 2 =\=0,!.
cantidadPar([X|L1],Q):-	cantidadPar(L1,R),
						X mod 2=:=0,
						Q is R+1.
cantidadPar([_|L1],Q):-	cantidadPar(L1,R),
						Q is R.
/*ordenado Ascendente o ordenado Descendente una lista*/
ordenado(L):-ordenadoAs(L);ordenadoDes(L).
ordenadoAs([]):-!.
ordenadoAS([_]):-!.
ordenadoAs([X,Y|L1]):- 	X=<Y,
						ordenadoAs([Y|L1]).
ordenadoDes([]):-!.
ordenadoDes([_]):-!.
ordenadoDes([X,Y|L1]):- X >= Y,
						ordenadoDes([Y|L1]).
/*Extremos iguales en una lista*/					
extremosIguales(L1):-	primerElemento(L1,X),
						ultimoElemento(L1,X).
primerElemento([X|_],X).
ultimoElemento([X],X).
ultimoElemento([_|L1],X1):-ultimoElemento(L1,X1).

/*insertar un elemento al ultimo de una lista*/
insertarUltimo([],X,[X]).
insertarUltimo([X|L1],Y,[X|L2]):-insertarUltimo(L1,Y,L2).

/*inserta un elemento al inicio de la lista*/
insertarPrimero(L1,X,[X|L1]).

/*eliminar el ultimo elemento de una lista*/
eliminarUltimo([_],[]).
eliminarUltimo([X|L1],[X|L2]):-eliminarUltimo(L1,L2).

/*eliminar el primer elemento de una lista*/
eliminarPrimero([_],[]).
eliminarPrimero([_|L1],L1).

/*Insertar dato en posicion X*/
insertarLugar([],X,[X]).
insertarLugar([X|L1],Y,[Y,X|L1]):- X>=Y,!.
insertarLugar([X|L1],Y,[X|L2]):- 
							insertarLugar(L1,Y,L2).

/*Concatenar 2 listas*/
concatenar([],L2,L2).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).

/*Insertar ultimo utilizando concatenar*/
insertarUlt(L1,X,L2):-concatenar(L1,[X],L2).

/*Eliminar ultimo utilizando concatenar*/
eliminarUlt(L1,L2):-concatenar(L2,[_],L1).

/*Eliminar primero utilizando concatenar*/
eliminarPrim([_|L1],L2):-concatenar(L1,[],L2).							

/*Insertar primero utilizando concatenar*/
insertarPrim(L1,X,L2):-concatenar([X],L1,L2).

/*Se encuentra un numero utilizando concatenar*/
seEncuentra(L1,X):-concatenar([_],[X|_],L1).

/*Verificar si los extremos son iguales utilizando concatenar*/
extIguales(L1):-concatenar([X|_],[X],L1).

/*Invertir una lista*/
invertir([],[]).
invertir([X|L1],L3):-	invertir(L1,L2),
						concatenar(L2,[X],L3).

/*Intercalar 2 listas*/
intercalar([],L2,L2).
intercalar(L1,[],L1).
intercalar([X|L1],[Y|L2],[X,Y|L3]):-intercalar(L1,L2,L3).

/*Mezclar 2 listas ordenadas*/
mezcla([],L2,L2).
mezcla(L1,[],L1).
mezcla([X|L1],[Y|L2],[X|L3]):-	X=<Y, 
								mezcla(L1,[Y|L2],L3).
mezcla([X|L1],[Y|L2],[Y|L3]):-	Y=<X, 
								mezcla([X|L1],L2,L3).
								
/*Separar*/
separar([],X,[],[]).
separar([Y|L1],X,[Y|L2],L3):- Y=<X, separar(L1,X,L2,L3).
separar([Y|L1],X,L2,[Y|L3]):- Y>X, separar(L1,X,L2,L3).
/*Quick Sort*/
quickSort([],[]).
quickSort([X|L1],L2):- 	separar(L1,X,L1Me,L1Ma),
						quickSort(L1Me,L1MeSort),
						quickSort(L1Ma,L1MaSort),
						concatenar(L1MeSort,[X|L1MaSort],L2).


