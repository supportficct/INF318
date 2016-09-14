mujer(elvira).
mujer(margarita).
mujer(dely).
mujer(carmen).
mujer(brizna).
mujer(carolina)
mujer(pelona).
mujer(noheisa).
mujer(mercedes).
mujer(juanita).
mujer(rosio).
mujer(issa).
mujer(yeril).
mujer(sherlyn).
mujer(brisnita).
mujer(maely).
mujer(sayuri).
mujer(anahi).
mujer(flavia).
mujer(jeinalis).
mujer(valentina).
hombre(antonio).
hombre(miguel).
hombre(quililo).
hombre(pedro).
hombre(luis).
hombre(ricardo).
hombre(manolo).
hombre(ernesto).
hombre(rico).
hombre(victor).
hombre(cacho).
hombre(ayrton).
hombre(takeshi).
hombre(antony).
hombre(junior).
hombre(ruddy).
hombre(robert).
hombre(sebastian).
hombre(diego).
hombre(edson).
matr(antonio,elvira).
matr(miguel,margarita).
matr(quililo,dely).
matr(pedro,carmen).
matr(luis,brizna).
matr(ricardo,carolina).
matr(manolo,pelona).
matr(ernesto,noheisa).
matr(rico,mercedes).
matr(victor,juanita).
matr(cacho,rosio).
matr(diego,yeril).
matr(edson,issa).
madre(elvira,dely).
madre(elvira,pedro).
madre(elvira,brizna).
madre(elvira,ricardo).
madre(elvira,pelona).
madre(elvira,rico).
madre(elvira,ernesto).
madre(elvira,victor).
madre(margarita,manolo).
madre(margarita,rosio).
madre(dely,issa).
madre(dely,ayrton).
madre(carmen,yeril).
madre(carmen,takeshi).
madre(carmen,sherlyn).
madre(brizna,brisnita).
madre(carolina,antony).
madre(pelona,maely).
madre(pelona,junior).
madre(noheisa,sayuri).
madre(mercedes,anahi).
madre(mercedes,ruddy).
madre(mercedes,robert).
madre(juanita,sebastian).
madre(rosio,flavia).
madre(yeril,jeinalis).
madre(issa,valentina).
padre(X,Y):-madre(Z,Y),matr(X,Z).
abuela(X,Y):-madre(X,Z),madre(Z,Y);padre(X,Z),madre(Z,Y).
abuelo(X,Y):-madre(X,Z),padre(Z,Y);padre(X,Z),padre(Z,Y).
hermano(X,Y):-madre(Z,X),madre(Z,Y),hombre(X).
hermana(X,Y):-madre(Z,X),madre(Z,Y),mujer(X).
tio(X,Y):-hermano(X,Z),padre(Z,Y);hermano(X,Z),madre(Z,Y);matr(X,Z),hermana(Z,M),padre(M,Y);matr(X,Z),hermana(Z,M),madre(M,Y).
tia(X,Y):-hermana(X,Z),padre(Z,Y);hermana(X,Z),madre(Z,Y);matr(Z,X),hermano(Z,M),padre(M,Y);matr(Z,X),hermano(Z,M),madre(M,Y).
primo(X,Y):-madre(Z,X),tia(Z,Y),hombre(X).
prima(X,Y):-madre(Z,X),tia(Z,Y),mujer(X).
suegra(X,Y):-madre(X,Z),matr(Z,Y);madre(X,Z),matr(Y,Z).
suegro(X,Y):-padre(X,Z),matr(Z,Y);padre(X,Z),matr(Y,Z).
nuera(X,Y):-madre(Y,Z),matr(Z,X);padre(Y,Z),matr(Z,X).
yerno(X,Y):-madre(Y,Z),matr(X,Z);padre(Y,Z),matr(X,Z).
hijo(X,Y):-madre(Y,X),hombre(X);padre(Y,X),hombre(X).
hija(X,Y):-madre(Y,X),mujer(X);padre(Y,X),mujer(X).
sobrino(X,Y):-tio(Y,X),hombre(X);tia(Y,X),hombre(X).
sobrina(X,Y):-tio(Y,X),mujer(X);tia(Y,X),mujer(X).
nieto(X,Y):-abuelo(Y,X),hombre(X);abuela(Y,X),hombre(X).
nieta(X,Y):-abuelo(Y,X),mujer(X);abuela(Y,X),mujer(X).
bisabuela(X,Y):-madre(X,Z),abuela(Z,Y);madre(X,Z),abuelo(Z,Y).
bisabuelo(X,Y):-padre(X,Z),abuela(Z,Y);padre(X,Z),abuelo(Z,Y).
bisnieto(X,Y):-bisabuelo(Y,X),hombre(X);bisabuela(Y,X),hombre(X).
bisnieta(X,Y):-bisabuelo(Y,X),mujer(X);bisabuela(Y,X),mujer(X).
cu�ado(X,Y):-hermano(X,Z),matr(Y,Z);hermano(X,Z),matr(Z,Y);matr(X,Z),hermana(Z,Y).
cu�ada(X,Y):-hermana(X,Z),matr(Y,Z);hermana(X,Z),matr(Z,Y);matr(Z,X),hermano(Z,Y).
