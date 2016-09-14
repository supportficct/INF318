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
