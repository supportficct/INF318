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


hombresimp(franz,aracely).
hombresimp(franz,boris).
hombresimp(amarjit,benita).

mujersimp(aracely,franz).
mujersimp(aracely,benita).
mujersimp(ceferina,franz).
mujersimp(benita,amarjit).

matr(amarjit,benita).
matr(leonidas,nora).

mtrsimp(X,Y):- hombresimp(X,Y), mujersimp(Y,X),matr(X,Y).
hsimpmcasada(X,Y):- hombresimp(X,Y),matr(_,Y).
mtrsimpnoc(X,Y):- hombresimp(X,Y), mujersimp(Y,X),not(matr(X,Y)).
mtrnotsimp(X,Y):-not(hombresimp(X,Y));not(mujersimp(Y,X)),matr(X,Y)./


cerveza(duft).
cerveza(pacenia).
cerveza(ducal).
cerveza(crucenia).

bebedor(franz).
bebedor(boris).
bebedor(nora).
bebedor(benita).
bebedor(ceferina).

bar(mous).
bar(vicecity).
bar(lacede).
bar(litos).

gusta(franz,duft).
gusta(nora,pacenia).
gusta(ceferina,ducal).

sirve(mous,duft).
sirve(vicecity,ducal).
sirve(lacede,crucenia).

frec(franz,mous).
frec(nora,mous).
frec(ceferina,lacede).

hnoferecbar(X):- hombre(X), not(frec(X,_)).
pnogustacer(X):- (hombre(X);mujer(X)),not(gusta(X,_)).
bebedoresfrec(X):- bebedor(X),frec(X,Z),gusta(X,W),sirve(Z,W).
cervezaquenosirveb(X):- cerveza(X),not(sirve(_,X)).
barnotfrec(X):- bar(X),not(frec(_,X)).




