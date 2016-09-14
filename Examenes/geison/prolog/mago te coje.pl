
%%%%%%%%%%%%%%%    grupo 10, RICHARD LOPEZ









						
					%%%%%%%%%LISTAS%%%%%%%%%






				%CONSULTAS Y ENCONTRAR VALORES.

 % 1. seEncuentra(L1, X) : Predicado que es True, si el elemento X se encuentra en la lista L1.

        seEncuentra( [X|_] , X ) :- !.
        seEncuentra( [_|L1] ,X ) :-seEncuentra(L1,X).


        


% 2. iguales(L1) : Predicado que es True, si todos los elementos de la lista L1 son iguales.


	iguales([_]).                        %listo
	iguales([X,X|L1]):-iguales([X|L1]).



% 3. existePar(L1) : Predicado que es True, si existe algún elemento par en la lista L1.

	existePar( [X|_] ) :- X mod 2 =:= 0,!.
	existePar( [_|L1] ):- existePar( L1 ).

	
	par(X):-X mod 2 =:= 0.

% 4. secuenciaParImpar(L1) : Predicado que es True, si la lista L1 está formado por una secuencia de elementos par, impar, par, impar,......

	secuenciaParImpar([X,Y]) :- par(X),impar(Y),!.
	secuenciaParImpar([X,Y|L1]) :- par(X),impar(Y),secuenciaParImpar(L1).
  
	
	impar(X):- not(X mod 2=:=0). 

% 5. ordenado(L1) : Predicado que es True, si los elementos de la lista L1 están ordenados de menor a mayor o de mayor a menor.
            

	ordenado([X|L1]):-ordenadosDes([X|L1]);ordenadosAsc([X|L1]).



	ordenadosDes([_]):-!.
	ordenadosDes([X,Y]):-X<Y.
	ordenadosDes([X,Y|L1]):-X<Y,ordenadosDes([Y|L1]).
       

        ordenadosAsc([_]):-!.
	ordenadosAsc([X,Y]):-X>Y.
	ordenadosAsc([X,Y|L1]):-X>Y,ordenadosAsc([Y|L1]).





% 6. primerElem(L1, X) : Predicado que encuentra el primer elemento de la lista L1 en X.


	primerElem([X,_|L1],X).





% 7. ultimoElem(L1, X) : Predicado que encuentra el último elemento de la lista L1 en X.


	ultimoElem([X],X).
	ultimoElem([_|L1],X):-ultimoElem(L1,X).





% 8. iEsimo(L1, i, X) : Predicado que encuentra el i-esimo elemento de la lista L1 en X.


	iEsimo([X],1,X).
	iEsimo([_|L1],C,B):-D is C-1,iesimo(L1,D,B).




% 9. diferentes(L1) : Predicado que es True, si todos los elementos de la lista L1 son diferentes.


        diferentes([_]).
        diferentes[X,Y]):-X=\=Y.
        diferentes([X,Y|L1]):-X=\=Y,diferentes([Y|L1]).
  


% 10. todosPares(L1) : Predicado que es True, si todos los elementos de la lista L1 son pares.



        todosPares([X]):-par(X).
        todosPares[X,Y]):-par(X),par(Y).
        todosPares([_,Y|L1]):-par(Y),todosPares([Y|L1]).
  


% 11. menor(L1, X) : Predicado que encuentra el menor elemento de la lista L1 en X.



	menor([X],X).
	menor([X|L1],Me):-menor(L1,M1),eMenor(X,M1,Me).



	eMenor(X,Y,X):-X<Y,!.
	eMenor(X,Y,Y).



% 12. mayor(L1, X) : Predicado que encuentra el mayor elemento de la lista L1 en X.



        mayor([X],X).
	mayor([X,Y|L1],Me):-mayor([Y|L1],M1),eMayor(X,M1,Me).



	eMayor(X,Y,X):-X>Y,!.
	eMayor(X,Y,Y).


% 13. cantidad(L1, Q) : Predicado que encuentra la cantidad de elementos de la lista L1 en Q.

           cantidad([ ],0).
           cantidad([X|L1],Q):- cantidad(L1,P),Q is P+1.
           


% 14. suma(L1, Sum) : Predicado que encuentra la suma de los elementos de la lista L1 en Sum.

	
	
	suma( [],0 ) :- !.
	suma( [X],X ) :- !.
	suma( [X|L1],Sum) :- suma(L1,Sum1),Sum is (Sum1+X).



% 15. sumaPar(L1, Sum) : Predicado que encuentra la suma de los elementos pares de L1 en Sum.

	
	
	sumaPar( [],0 ) :- !.
	sumaPar( [X],Sum ) :- par(X),Sum is X ; not(par(X)),Sum is 0,!.
	sumaPar( [X|L1],Sum ) :- sumaPar(L1,Sum1),par(X),Sum is (X+Sum1);sumaPar(L1,Sum1),not(par(X)),Sum is Sum1.


% 16. penúltimo(L1) : Predicado que encuentra el penúltimo elemento de la lista L1 en X.

	penultimo([X,_],X).
	penultimo([_|L1],X):-penultimo(L1,X).



%  17. segundo(L1, X) : Predicado que encuentra el segundo elemento de la lista L1 en X.


       segundo([_,Y|L1],Y).



% 18. parejasIguales(L1) : Predicado que devuelve True, si la lista L1 está formado por una secuencia de parejas de elementos iguales.

	
	
	parejasIguales( [X,X] ) :- !.
	parejasIguales( [X,X|L1] ) :- parejasIguales(L1).



% 19. frecuencia(L1, X, Q) : Predicado que encuentra la frecuencia del elemento X en la lista L1, el resultado se encuentra en Q.



          frecuencia([ ], _, 0).
          frecuencia([ Y|L1], X, Q):- frecuencia(L1, X, P),Y=:=X, Q is P+1.
          frecuencia([ Y|L1], X, Q):- frecuencia(L1, X, P), Q is P.



% 20. seRepite(L1, X, Q) : Predicado que es True, si el elemento X, se repite Q veces en la lista L1.


          seRepite( L1,X,Q ) :- frecuencia(L1,X,F),F=:=Q.




% 21. existeFrec(L1, Q) : Predicado que es True, si en la lista L1 existe algún elemento que se repite Q veces.

	

	existeFrec( [_|_],1 ) :- !.
	existeFrec( L1,Q ) :- primerElem(L1,E),frecuencia( L1,E,F),F =:= Q,!.
	existeFrec( [_|L1],Q ) :- existeFrec(L1,Q).



% 22. mismasFrec(L1) : Predicado que es True, si todos los elementos de la lista L1 tienen la misma frecuencia.

	

	mismasFrec( [_] ) :- !.
	mismasFrec( [_,_] ) :- !.
	mismasFrec( [X|L1] ) :- frecuencia([X|L1],X,F),eliminar(L1,X,[Y|L2] ),frecuencia([Y|L2],Y,F2),
				iguales(F,F2),mismasFrec([Y|L2]);
				frecuencia([X|L1],X,F),eliminar(L1,X,[Y|L2] ),frecuencia([Y|L2],Y,F2),
				iguales(0,F2).



	eliminar( [],_,[] ) :- !.
	eliminar( [X],X,[] ) :- !.
	eliminar( [X],Y,[X] ) :- dif(X,Y),!.
	eliminar( [X|L1],Y,[X|L2] ):- dif(X,Y),eliminar( L1,Y,L2 ),!.
	eliminar( [_|L1],Y,L2 ) :- eliminar(L1,Y,L2).

        

        iguales(X,X).


 % 23. escalera(L1) : Predicado que es True, si los elementos de la lista L1 forman una escalera.

	

	escalera( [_] ) :-!.
	escalera( L1 ) :- diferentes(L1),mayor(L1,Ma,menor(L1,Me),cantidad(L1,C), Ma-Me =:= C-1.


% 24. poker(L1) : Predicado que es True, si los elementos de la lista L1 forman poker.


	poker( L1 ) :- cantidad(L1,C),existeFrec(L1,C-1),existeFrec(L1,1),not(iguales(L1)).


% 25. full(L1) : Predicado que es True, si los elementos de la lista L1 forman full. 







%Implementar estos predicado en el orden que más le convenga. (Trabajo Individual)





dif(X,Y) :- not(iguales(X,Y)).

