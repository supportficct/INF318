hombre(juan).
hombre(jose).
hombre(jorge).
hombre(raul).
hombre(jaime).
hombre(cesar).
hombre(pedro).
hombre(mario).
hombre(ronald).
hombre(pablo).

mujer(ely).
mujer(eva).
mujer(ana).
mujer(lucia).
mujer(carla).
mujer(susy).
mujer(tania).
mujer(alejandra).
mujer(fabiana).
mujer(renata).

matr(juan,ely).
matr(jose,ana).
matr(raul,lucia).
matr(jaime,eva).

hombreSimp(juan,ely).
hombreSimp(jose,ana).
hombreSimp(raul,lucia).
hombreSimp(jaime,eva).
hombreSimp(jose,ely).
hombreSimp(juan,eva).
hombreSimp(cesar,ana).
hombreSimp(raul,ana).
hombreSimp(jorge,eva).

mujerSimp(ely,juan).
mujerSimp(ana,jose).
mujerSimp(lucia,raul).
mujerSimp(eva,jaime).
mujerSimp(ana,jose).
mujerSimp(lucia,cesar).
mujerSimp(eva,juan).
mujerSimp(carla,jose).
mujerSimp(ely,cesar).
mujerSimp(eva,jorge).


casado(X):- hombre(X), mujer(Y), matr(X,Y).

casada(Y):- mujer(Y), hombre(X), matr(X,Y).


parejasimp(X,Y):- hombre(X), mujer(Y), matr(X,Y), hombreSimp(X,Y), mujerSimp(Y,X).

hombresimpcasada(X,Y):- hombre(X), casada(Y), hombreSimp(X,Y).

personasimpnocasado(X,Y):- not(casado(X)), not(casada(Y)), 
				hombreSimp(X,Y), mujerSimp(Y,X).

mujercasadaSimpHombreSol(Y,X):- casada(Y), not(casado(X)), mujerSimp(Y,X).

hombrecasadoSimpMujerSol(X,Y):- casado(X), not(casada(Y)), hombreSimp(X,Y).

