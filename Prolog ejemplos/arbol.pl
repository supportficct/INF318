insertar(X,null,arbol(null,X,null)).
insertar(X,arbol(AIzq,Y,ADer),arbol(AIzq1,Y,ADer)):-		X<Y,
															insertar(X,AIzq,AIzq1),!.
														
insertar(X,arbol(AIzq,Y,ADer),arbol(AIzq,Y,ADer1)):-		insertar(X,ADer,ADer1).

inOrden(null).
inOrden(arbol(AIzq,X,ADer)):-	inOrden(AIzq),
								write(X),nl,
								inOrden(ADer).
								
comenzar:-	write('dimension'),nl,
			read(N),
			ciclo(N,1,null,A1),
			inOrden(A1),
			suma(A1,Sum),
			write('Suma='),write(Sum),nl,
			mostrarNivel(A1,0),
			cantNodos(A1,N),
			write('La cantidad de nodos es: '), write(N), nl,
			sumaPares(A1,Sum1),
			write('La suma de los pares es: '), write(Sum1),nl,
			mayorElemento(A1,May),
			write('El mayor elemento es: '), write(May),nl,
			menorElemento(A1,Men),
			write('El menor elemento es: '), write(Men).
			
ciclo(N,I,A1,A1):-	I>N,!.
ciclo(N,I,A1,A3):-	write('dato'),write(I),nl,
					read(X),
					insertar(X,A1,A2),
					I1 is I+1,
					ciclo(N,I1,A2,A3).

suma(null,0).					
suma(arbol(AIzq,X,ADer),Sum):-	suma(AIzq,SumI),
								suma(ADer,SumD),
								Sum is (SumI+SumD+X).
								
mostrarNivel(null,_).
mostrarNivel(arbol(AI,X,AD),Nivel):-	Nivel1 is Nivel+1,
										mostrarNivel(AI,Nivel1),
										write(X),write('    '),write(Nivel),nl,
										mostrarNivel(AD,Nivel1).
										
cantNodos(null,0).
cantNodos(arbol(null,_,null),1).
cantNodos(arbol(AIzq,_,ADer),N):-	cantNodos(AIzq,N1),
									cantNodos(ADer,N2),
									N is N1+N2+1.
									
sumaPares(null,0).
sumaPares(arbol(AIzq,X,ADer),Sum):-	X mod 2 =:= 0,
									sumaPares(AIzq,SumI),
									sumaPares(ADer,SumD),
									Sum is SumI + SumD + X,!.
sumaPares(arbol(AIzq,X,ADer),Sum):-	X mod 2 =\= 0,
									sumaPares(AIzq,SumI),
									sumaPares(ADer,SumD),
									Sum is SumI + SumD.								

mayorElemento(arbol(null,X,null),X):-!.
mayorElemento(arbol(_,_,ADer),Ma):-	mayorElemento(ADer,Ma).
										
menorElemento(arbol(null,X,null),X):-!.
menorElemento(arbol(AIzq,_,_),Me):-	menorElemento(AIzq,Me).
										