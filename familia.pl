
%--------------Hechos_Hombre--------
hombre(benito).
hombre(andres).
hombre(adrian).
hombre(jose).
hombre(juan).
hombre(edd).
hombre(jorge).
hombre(junior).
hombre(dario).
hombre(rodrigo).
hombre(roberto).
hombre(olvis).
hombre(marcelo).
hombre(vladimir).
hombre(josue).
%--------------Hechos_Mujer--------
mujer(mary).
mujer(silvana).
mujer(maria).
mujer(analia).
mujer(juana).
mujer(valeria).
mujer(diana).
mujer(gloria).
mujer(melissa).
mujer(yane).
mujer(tania).
mujer(analia).
mujer(ana).
mujer(jessica).
mujer(lucia).
mujer(laura).
mujer(maricela).
mujer(anabel).
%--------------Hechos_Matrimonio--------
matr(dario,mary).
matr(jorge,diana).
matr(roberto,analia).
matr(rodrigo,tania).
matr(edd,yane).
matr(adrian,ana).
matr(jose,valeria).
%--------------Hechos_Madre--------
madre(mary,vladimir).
madre(mary,junior).
madre(mary,rodrigo).
madre(diana,tania).
madre(diana,olvis).
madre(diana,gloria).
madre(diana,edd).
madre(analia,yane).
madre(tania,ana).
madre(tania,juan).
madre(tania,maria).
madre(tania,juana).
madre(tania,valeria).
madre(yane,jose).
madre(yane,adriana).
%--------Reglas_y_mas_Reglas----------------- 
padre(X,Y):-madre(Z,Y),matr(X,Z).
persona(X):-hombre(X);mujer(X).

soltero(X):-hombre(X), not(matri(X,_)).
soltera(Y):-mujer(Y),not(matri(_,Y)).

abuela(X,Y):-madre(Z,Y),madre(X,Z);padre(Z,Y),madre(X,Z).
abuelol(X,Y):-padre(Z,Y),padre(X,Z);madre(Z,Y),padre(X,Z).
abuelo(X,Y):-abuela(Z,Y),matri(X,Z).
abueloa(X,Y):-abuelo(X,Y);abuela(X,Y).

hermanoa(X,Y):-padre(Z,X),padre(Z,Y).
hermano(X,Y):-hermanoa(X,Y),hombre(X).
hermana(X,Y):-hermanoa(X,Y),mujer(X).
hermanos(X,Y):-hermano(X,Y),hermana(X,Y).

hijos(Z):-madre(Z,_);padre(Z,_).
padres(X,Y):-madre(X,Y);padre(X,Y).
primoa(X,Y):-(padres(W,X),padres(Z,Y)),(hermanoa(W,Z)).


tia(X,Y):-hermanos(Z,X),padre(Z,Y);hermanos(Z,X),madre(Z,Y).
tio(X,Y):-madre(Z,Y),hermanos(X,Z).
tios(X,Y):-tio(X,Y);tia(X,Y).

tiabuela(X,Y):-abueloa(Z,Y),hermana(X,Z).
tioabuelo(X,Y):-abueloa(Z,Y),hermano(X,Z).

nuera(M,Y):-mujer(M),matri(H,M),madre(Y,H);
		mujer(M),matri(Z,M),padre(Y,Z).

primoher(X,Y):- padre(Z,X),padre(W,Y),hermanos(Z,W);
		madre(Z,X),madre(W,Y),hermanos(Z,W);
		padre(Z,X),madre(W,Y),hermanos(Z,W);
		madre(Z,X),padre(W,Y),hermanos(Z,W).
primohermana(X,Y):-	mujer(Y),padre(Z,X),padre(W,Y),hermanos(Z,W);
			mujer(Y),madre(Z,X),madre(W,Y),hermanos(Z,W);
			mujer(Y),padre(Z,X),madre(W,Y),hermanos(Z,W);
			mujer(Y),madre(Z,X),padre(W,Y),hermanos(Z,W).

sobrino(X,Y):-tios(Y,X).
cuñado(X,Y):-matr(Y,Z),hermano(X,Z).

yerno(X,Y):-hombre(X), matr(X,Z), madre(Y,Z);hombre(X),matr(X,Z),padre(Y,Z).


desc(X,Y):-madre(Y,X);padre(Y,X).   
desc(X,Y):- 	madre(Z,X),desc(Z,Y);
		padre(Z,X),desc(Z,Y).
























