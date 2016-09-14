hombre(pepe).
hombre(juan).
hombre(jose).
hombre(arnold).
hombre(pedro).
hombre(raul).
hombre(mario).
hombre(ronald).
hombre(jorge).
hombre(pablo).

mujer(lucia).
mujer(ana).
mujer(maria).
mujer(jessica).
mujer(susy).
mujer(angelica).
mujer(tania).
mujer(alejandra).
mujer(fabiana).
mujer(renata).

cerveza(pace�a).
cerveza(ducal).
cerveza(duff).
cerveza(taqui�a).
cerveza(huari).
cerveza(wisky).
cerveza(corona).

bar(mou).
bar(caballito).
bar(nave).
bar(pescadito).
bar(quijote).
bar(flow).
bar(american).

bebedor(pepe).
bebedor(juan).
bebedor(jose).
bebedor(arnold).
bebedor(pedro).
bebedor(mario).
bebedor(ana).
bebedor(lucia).
bebedor(susy).
bebedor(angelica).
bebedor(alejandra).
bebedor(fabiana).

gusta(pepe,pace�a).
gusta(juan,ducal).
gusta(jose,duff).
gusta(arnold,taqui�a).
gusta(pedro,duff).
gusta(mario,huari).
gusta(ana,wisky).
gusta(lucia,corona).
gusta(susy,huari).
gusta(angelica,corona).
gusta(alejandra,ducal).
gusta(fabiana,pace�a).

sirve(mou,duff).
sirve(mou,pace�a).
sirve(caballito,pace�a).
sirve(caballito,ducal).
sirve(nave,pace�a).
sirve(nave,taqui�a).
sirve(pescadito,huari).
sirve(pescadito,wisky).
sirve(quijote,taqui�a).
sirve(quijote,pace�a).
sirve(flow,pace�a).
sirve(flow,huari).
sirve(american,wisky).
sirve(american,corona).

frec(pepe,mou).
frec(pepe,caballito).
frec(juan,caballito).
frec(jose,nave).
frec(arnold,pescadito).
frec(pedro,quijote).
frec(mario,flow).
frec(ana,american).
frec(lucia,flow).
frec(susy,mou).
frec(angelica,quijote).
frec(alejandra,nave).
frec(fabiana,mou).

persona(X):- hombre(X) ; mujer(X).

hombrenofrecuentabar(X):- hombre(X), not(frec(X,_)).

personanobebedora(X):- persona(X), not(gusta(X,_)).

bebedorfrecuentabar(X,Y):- persona(X), bar(Y), 
				frec(X,Y), sirve(Y,Z), gusta(X,Z).

cervezanosirvebar(X,Y):- bar(X), cerveza(Y), not(sirve(X,Y)).

nofrec(X,Y):- bebedor(X), bar(Y), not(frec(X,Y)).

barsirvecervezagusta(X,Z):- bebedor(X), bar(Z), 
				gusta(X,Y), sirve(Z,Y).

frecsirvesucerveza(X,Z):- bebedor(X), cerveza(Z) 
		            ,frec(X,Y), sirve(Y,Z).

