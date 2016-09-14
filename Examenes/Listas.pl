% Materia: PROGRAMACION LOGICA FUNCIONAL

% Autor: BISMARCK VILLCA SOLIZ

%-------------------------------------------------------------------------------
% EJERCICIOS HECHOS EN CLASES
%-------------------------------------------------------------------------------
% 1. SUMA LOS ELEMENTOS DE LA LISTA
suma([], 0).
suma([X|L], Sum) :- suma(L, Sum1), Sum is Sum1+X.

%-------------------------------------------------------------------------------
% 2. ES TRUE SI LOS ELEMENTOS DE LA LISTA SON IGUALES
iguales([]).
iguales([_]).
iguales([X, X|L]) :- iguales([X|L]).

%-------------------------------------------------------------------------------
% 3. ES TRUE SI LOS EXTREMOS DE LA LISTA SON IGUALES
extremosIguales(L) :- primerElemento(L, X), ultimoElemento(L, X).

primerElemento([X|_], X).

ultimoElemento([X], X).
ultimoElemento([_|L], X) :- ultimoElemento(L, X).

%-------------------------------------------------------------------------------
% 4. ES TRUE SI LA LISTA ESTA ORDENADA ASCENDENTEMENTE O DESCENDENTEMENTE
ordenado(L) :- ordAsc(L); ordDesc(L).

ordAsc([_]).
ordAsc([X, Y|L]) :- X =< Y, ordAsc([Y|L]).

ordDesc([_]).
ordDesc([X, Y|L]) :- Y =< X, ordDesc([Y|L]).

%-------------------------------------------------------------------------------
% 5. ES TRUE SI LOS ELEMENTOS DE LA LISTA SON PRIMOS
primos([]).
primos([X]) :- isPrimo(X).
primos([X|L]) :- isPrimo(X), primos(L).

isPrimo(N) :- isPrimoR(N, 2).

isPrimoR(N, I) :- I > N//2, !.
isPrimoR(N, I) :- N mod I =\= 0, I1 is I+1, isPrimoR(N, I1).

%-------------------------------------------------------------------------------
% 6. SUMA LOS ELEMENTOS PARES DE LA LISTA
sumarPares([], 0) :- !.
sumarPares([X], X) :- par(X), !.
sumarPares([X|L], Sum) :- sumarPares(L, Sum1), par(X), Sum is Sum1+X, !;
                          sumarPares(L, Sum1), Sum is Sum1.

par(N) :- N mod 2 =:= 0.

%-------------------------------------------------------------------------------
% 7. MUESTRA LA FRECUENCIA Q DE LA LISTA
frecuencia([], _, 0) :- !.
frecuencia([X], N, Q) :- N =:= X, Q is 1, !;
                         Q is 0, !.
frecuencia([X|L], N, Q) :- frecuencia(L, N, Q1), N =:= X, Q is Q1+1, !;
                           frecuencia(L, N, Q1), Q is Q1.

%-------------------------------------------------------------------------------
% 8. ES TRUE SI LOS ELEMENTOS DE LA LISTA SON DIFERENTES
diferentes([]).
diferentes([_]).
diferentes([X, Y|L]) :- X =\= Y, diferentes([Y|L]).

%-------------------------------------------------------------------------------
%-------------------------------------------------------------------------------
% CONTINUACION DE LA CLASE LISTA (INSERTAR Y ELIMINAR)
%-------------------------------------------------------------------------------
% 1. INSERTAR ULTIMO
insertarUlt([], X, [X]) :- !.
insertarUlt([X|L1], N, [X|L2]) :- insertarUlt(L1, N, L2).
%-------------------------------------------------------------------------------
% 2. ELIMINAR ULTIMO
eliminarUlt([_], []) :- !.
eliminarUlt([X|L1], [X|L2]) :- eliminarUlt(L1, L2).
%-------------------------------------------------------------------------------
% 3. INSERTAR PRIMERO
insertarPrim(L1, X, [X|L1]).
%-------------------------------------------------------------------------------
% 4. ELIMINAR PRIMERO
eliminarPrim([_|L1], L1).
%-------------------------------------------------------------------------------
% 5. INSERTA UN DATO EN LA LISTA DE FORMA ORDENADA
%    TENIENDO EN CUENTA QUE LA LISTA ESTA ORDENADA TAMBIEN
insertarLugar([], X, [X]) :- !.
insertarLugar([X|L1], N, [N, X|L1]) :- N =< X, !.
insertarLugar([X|L1], N, [X|L2]) :- insertarLugar(L1, N, L2).
%-------------------------------------------------------------------------------
% 6. ORDENAR UNA LISTA (SUG. UTILIZE EL INSERTAR LUGAR)
ordenar([], []) :- !.
ordenar([X|L1], [X|L2]) :- insertarLugar([X|L2], X, L3), ordenar(L1, L3).
%-------------------------------------------------------------------------------
% 7. ELIMINAR PARES DE UNA LISTA
eliminarPares([X], []) :- X mod 2 =:= 0, !.
eliminarPares([X], [X]) :- !.
eliminarPares([X|L1], [X|L2]) :- X mod 2 =\= 0, eliminarPares(L1, L2), !.
eliminarPares([_|L1], L2) :- eliminarPares(L1, L2).
%-------------------------------------------------------------------------------
% 8. HALLAR EL MENOR DE LA LISTA
menor([X], X) :- !.
menor([X, Y|L1], Me) :- X > Y, menor([Y|L1], Me1), Me is Me1, !.
menor([X, _|L1], Me) :- menor([X|L1], Me1), Me is Me1.
%-------------------------------------------------------------------------------
% 9. HALLAR EL MAYOR DE LA LISTA
mayor([X], X).
mayor([X, Y|L1], My) :- X < Y, mayor([Y|L1], My1), My is My1, !.
mayor([X, _|L1], My) :- mayor([X|L1], My1), My is My1.
%-------------------------------------------------------------------------------
/* CONTINUACION DE LISTAS CON CONCATENAR, INTERCALAR, MEZCLA
/*----------------------------------------------------------------------------*/
intercalar([], [], []) :- !.
intercalar([], L2, L2) :- !.
intercalar(L1, [], L1) :- !.
intercalar([X|L1], [Y|L2], [X, Y|L3]) :- intercalar(L1, L2, L3).
/*----------------------------------------------------------------------------*/
mezcla([], [], []) :- !.
mezcla([], L2, L2) :- !.
mezcla(L1, [], L1) :- !.
mezcla([X|L1], [Y|L2], [X|L3]) :- X < Y, mezcla(L1, [Y|L2], L3), !.
mezcla([X|L1], [Y|L2], [Y|L3]) :- mezcla([X|L1], L2, L3).
/*----------------------------------------------------------------------------*/
concatenar([], L2, L2).
concatenar([X|L1], L2, [X|L3]) :- concatenar(L1, L2, L3).
/*----------------------------------------------------------------------------*/
seEncuentra(L1, X) :- concatenar(_, [X|_], L1).
/*----------------------------------------------------------------------------*/
insertarUlt(L1, X, L2) :- concatenar(L1, [X], L2).
/*----------------------------------------------------------------------------*/
eliminarUlt([_], []) :- !.
eliminarUlt([X|L1], [X|L2]) :- eliminarUlt(L1, L2).
/*----------------------------------------------------------------------------*/
extremosIguales(L1) :- primerElem(L1, X), ultimoElem(L1, X).

primerElem([X|_], X).

ultimoElem([X], X) :- !.
ultimoElem([_|L1], U) :- ultimoElem(L1, U).
/*----------------------------------------------------------------------------*/
quickSort([], []) :- !.
quickSort([X|L1], L2) :- separar(L1, X, LMe, LMy),
                         quickSort(LMe, LMeOrd),
                         quickSort(LMy, LMyOrd),
                         concatenar(LMeOrd, [X|LMyOrd], L2).

separar([], _, [], []) :- !.
separar([X|L1], N, [X|L2], LMy) :- X < N, separar(L1, N, L2, LMy), !.
separar([X|L1], N, LMe, [X|L3]) :- separar(L1, N, LMe, L3).