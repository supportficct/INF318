hombre(juan).
hombre(rosendo).
hombre(raul).
hombre(ronald).
hombre(fransisco).
hombre(goku).
hombre(luffy).
hombre(masterkof).
hombre(paul).
hombre(fredy).
hombre(gregorio).
hombre(paulino).
hombre(andres).
hombre(aron).
hombre(jordy).
hombre(jorge).
hombre(pauljr).


mujer(rufina).
mujer(segundina).
mujer(marcelina).
mujer(adela).
mujer(ana).
mujer(rocio).
mujer(roxana).
mujer(nathaly).
mujer(daniela).
mujer(jimena).
mujer(evangelina).
mujer(reichel).
mujer(reina).
mujer(rubi).
mujer(noemi).

matrimonio(juan,daniela).
matrimonio(rosendo,rufina).
matrimonio(raul,Jimena).
matrimonio(paul,roxana).
matrimonio(fredy,adela).
matrimonio(gregorio,evangelina).
matrimonio(jorge,rocio).

madre(rufina,juan).
madre(rufina,rocio).
madre(rufina,roxana).
madre(rufina,ronald).
madre(rufina,raul).
madre(rufina,adela).
madre(rufina,ana).
madre(daniela,goku).
madre(daniela,luffy).
madre(daniela,masterkof).
madre(evangelina,fransisco).
madre(evangelina,paulino).
madre(evangelina,segundina).
madre(evangelina,marcelina).
madre(evangelina,rufina).
madre(ana,andres).
madre(rocio,jordy).
madre(roxana,pauljr).
madre(jimena,aron).
madre(adela,reina).

padre(rosendo,juan).
padre(rosendo,raul).
padre(rosendo,ronald).
padre(rosendo,rocio).
padre(rosendo,roxana).
padre(rosendo,adela).
padre(rosendo,ana).
padre(juan,goku).
padre(juan,luffy).
padre(juan,masterkof).
padre(raul,aron).
padre(raul,reichel).
padre(paul,pauljr).
padre(fredy,reina).
padre(gregorio,rufina).
padre(gregorio,marcelina).
padre(gregorio,segundina).
padre(gregorio,fransisco).
padre(gregorio,paulino).
padre(jorge,jordy).


hijo(raul,rufina).
hijo(juan,rufina).
hijo(ronald,rufina).
hijo(luffy,daniela).
hijo(masterkof,daniela).
hijo(goku,daniela).
hijo(paulino,evangelina).
hijo(fransisco,evangelina).
hijo(aron,jimena).
hijo(jordy,rocio).
hijo(pauljr,roxana).
hijo(andres,ana).

hija(rufina,evangelina).
hija(segundina,evangelina).
hija(marcelina,evangelina).
hija(adela,rufina).
hija(ana,rufina).
hija(rocio,rufina).
hija(roxana,rufina).
hija(reichel,jimena).
hija(reina,adela).



soltero(X):-hombre(X),not(matrimonio(X,_)).

soltera(Y):-mujer(Y),not(matrimonio(Y,_)).

padre(X,Y):-madre(Z,Y),matrimonio(X,Z).

hijo(X,Y):-padre(Y,X),hombre(X).

hija(X,Y):-padre(Y,X),mujer(X).

sinhijos(X,Y):-matrimonio(X,Y),not(madre(Y,_)).

hermana(X,Y):-mujer(X),madre(Z,X),madre(Z,Y),X\==Y.

hermano(X,Y):-hombre(X),madre(Z,X),madre(Z,Y),not(X=Y).

abuela(X,Y):-madre(Z,Y),madre(X,Z);padre(Z,Y),madre(X,Z).

abuelo(X,Y):-madre(Z,Y),padre(X,Z);padre(Z,Y),padre(X,Z).

des(X,Y):-madre(Y,X);padre(Y,X).

desr(X,Y):-madre(Z,X),des(Z,Y);padre(Z,X),des(Z,Y).

primohermano(X,Y):-padre(Z,X),padre(W,Y),hermano(Z,W);madre(Z,X),madre(W,Y),hermana(Z,W);padre(Z,X),madre(W,Y),hermano(Z,w),padre(Z,X),padre(W,Y),hermana(Z,W).

primahermana(X,Y):-mujer(X),abuela(Z,X),abuela(Z,Y),not(hermano(X,Y)),not(hermana(X,Y)).

tio(X,Y):-padre(Z,Y),hermano(Z,X),hombre(X).

tia(X,Y):-mujer(Y),abuela(Z,Y),madre(Z,X).

nieto(X,Y):-padre(Y,Z),padre(Z,X),hombre(X).

bisnieto(X,Y):-padre(Z,X),padre(W,Z),padre(W,Y).

suegro(X,Y):-hombre(X),padre(X,Z),matrimonio(Y,Z);hombre(X),padre(X,Z),matrimonio(Z,Y).

suegra(X,Y):-mujer(X),madre(X,Z),matrimonio(Y,Z);mujer(X),madre(X,Z),matrimonio(Z,Y).

sobrina(X,Y):-hija(X,Z),hermano(Z,Y),mujer(X).

sobrino(X,Y):-hijo(X,Z),hermano(Z,Y),hombre(X).

yerno(X,Y):-matrimonio(Z,X),madre(Y,Z);matrimonio(Z,X),padre(Y,Z).

nuera(X,Y):-matrimonio(Z,X),madre(Y,Z);matrimonio(Z,X),padre(Y,Z).

cuniado(X,Y):-matrimonio(Y,Z),hermano(X,Z).






	 











