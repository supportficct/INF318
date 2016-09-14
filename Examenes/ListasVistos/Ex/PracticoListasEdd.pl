
menorDato(A,B,Me):-A<B, Me is A,!.
menorDato(A,B,B).

mayorDato(A,B,Me):-A=>B, Me is A,!.
mayorDato(A,B,B).

%-1
menorLista([X],X).
menorLista([X|L1],Me):-menorLista(L1,Me1),
						menorDato(X,Me1,Me).
%-2						
mayorLista([X],X).
mayorLista([X|L1],Me):-mayorLista(L1,Me1),
						mayorDato(X,Me1,Me).

%-3
seEncuentra([X|_],X).
seEncuentra([_|L1],X):-seEncuentra(L1,X).

%-4
subConjunto

%-5
suma([],S):-S is 0.
suma([X],S):-S is X.
suma([X|L1],S):-suma(L1,S1),S is S1+X.

%-6
cantidad([X],1).
cantidad([X|L],Q):-
			cantidad(L,Q1),
				Q is Q1 + 1.			

%-7
promedio
%-8
ordenadosAsc([]).
ordenadosAsc([_]).
ordenadosAsc([X,Y|L]):-X=<Y,ordenadosAsc([Y|L]).

ordenadosDes([]).
ordenadosDes([_]).
ordenadosDes([X,Y|L]):-X>=Y,ordenadosDes([Y|L]).

%-9
frecuencia([A],X,F):-A=:=X,F is 1,!.
frecuencia([A],X,F):-A=\=X,F is 0.
frecuencia([A|L1],X,F):-A=:=X,frecuencia(L1,X,F1), F is F1+1,!.
frecuencia([A|L1],X,F):-frecuencia(L1,X,F).

%-10
iguales([]).
iguales([X]).
iguales([X,Y|L1]):-X=:=Y,iguales(L1).

%-11
diferentes([X]).
diferentes([X,Y]):- X=\=Y.
diferentes([X,Y|L1]):- X=\=Y,diferentes(L1).

%-12

sumaPares([],S):-S is 0.
sumaPares([X],S):-(X mod 2)=:=0,S is X,!.
sumaPares([X],S):-S is 0.
sumaPares([X|L1],S):-(X mod 2)=:=0,sumaPares(L1,S1),S is S1+X,!.
sumaPares([X|L1],S):-sumaPares(L1,S).
%-parImpar
par(N):- N mod 2 =:= 0.
impar(A):- not(par(A)).
alterno([X|L1]):- alternoPar([X|L1]);
				(impar(X), alternoPar(L1)).

alternoPar([X]):- par(X), !.			

alternoPar([X,Y]):- par(X), impar(Y), !.
				
alternoPar([X,Y|L1]):-
				par(X), impar(Y),
					alternoPar(L1),!.
%-13primos
primo(N):-primo(N,2).
primo(N,I):-I > N//2 , ! .
primo(N,I):- N mod I =\= 0,
                        I1 is I+1,
                        primo(N,I1).
esprimo(N):-esprimo(N,2).
esprimo(N,I):-I>N//2,!.
esprimo(N,I):-(N mod I =\= 0),
				I1 is I+1, esprimo(N,I1).
listaPrimo([X]):-primo(X).
listaPrimo([X|L]):- listaPrimo(L),
                    primo(X).
cantidadprimos([],0).
cantidadprimos([X],1):- esprimo(X),!.
cantidadprimos([X|L1],S):- esprimo(X),
							cantidadprimos(L1,S1),
							S is 1+S1,!.
cantidadprimos([_|L1],S1):- cantidadprimos(L1,S1).
%-14
%========================
diferentes([]):-!.
diferentes([X]):-!.
diferentes([X|L1]):-frecuancia(L1,X,Q),
					Q =:= 1,
					diferentes(L1).		
%-15
insertarLugar(X,[],[X]).
insertarLugar(X,[Y|L1],[X,Y|L1]):-X=<Y,!.
insertarLugar(X,[Y|L1],[Y|L2]):-insertarLugar(X,L1,L2).
		
%-16eliminar_Pares

elimiPares([],[]).
elimiPares([X],[]):-par(X).
elimiPares([X|L1],[X|L2]):-  
                        elimiPares(L1,L2),
						not(par(X)).	
elimiPares([X|L1],L2):- elimiPares(L1,L2).
%-17
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

%-18
%-19
%-20
%-21










