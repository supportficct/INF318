hombre(amarjit).
hombre(franz).
hombre(leonidas).
hombre(lusgardo).
hombre(hector).
hombre(dionicio).
hombre(carlos).
hombre(santos).
hombre(boris).
hombre(froilan).
hombre(benedicto).

mujer(benita).
mujer(lizeth).
mujer(araceli).
mujer(nora).
mujer(ceferina).
mujer(carla).
mujer(isabel).
mujer(lola).
mujer(nilda).
mujer(lara).
mujer(felicia).
mujer(benedicta).

matrimonio(benedicto, benedicta).
matrimonio(amarjit, benita).
matrimonio(lusgardo, ceferina).
madre(benedicta,benita).
madre(benedicta,santos).
madre(benedicta,ceferina).
madre(benedicta,lola).
madre(benedicta,felicia).
madre(benita,franz).
madre(benita,lizeth).
madre(ceferina,hector).
madre(ceferina,carla).
madre(ceferina,isabel).
madre(ceferina,carlos).
madre(lola,nilda).
madre(nilda,boris).
madre(felicia,froilan).
madre(nilda,lara).

persona(X):- hombre(X) ; mujer(X).
padre(X,Y):- madre(Z,Y), matrimonio(X,Z).
hermanos(X,Y):- madre(Z,X) , madre(Z,Y).
abuela(X,Y):- madre(Z,Y), madre(X,Z) ; padre(Z,Y), madre(X,Z).
abuelo(X,Y):- madre(Z,Y), padre(X,Z) ; padre(Z,Y), padre(X,Z).
soltero(X):- hombre(X),not(matrimonio(X,_)).
primosh(X,Y):- madre(Z,X),madre(W,Y),hermanos(Z,W);madre(Z,X),padre(W,Y),hermanos(Z,W);padre(Z,X),madre(W,Y),hermanos(Z,W);padre(Z,X),padre(W,Y),hermanos(Z,W).
sinhijos(X,Y):- matrimonio(X,Y),not(madre(Y,_)).
desc(X,Y):- madre(Y,X);padre(Y,X).
desc(X,Y):- madre(Z,X);desc(Z,Y);pa dre(Z,X);desc(Z,Y).
posiblem(X,Y):- mujer(Y),hombre(X),not(matrimonio(X,Y)),not(primosh(X,Y)),not(hermanos(X,Y)),not(desc(X,Y)),not(desc(Y,X)),not(abuela(Z,X)),not(abuela(Z,Y)).    