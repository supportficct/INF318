menor(A,B,A):- A<B,!.
menor(A,B,B).	
menor(A,B,C,M1):- menor(A,B,M2),menor(C,M2,M1).
menor(A,B,C,D,M1):-menor(A,B,C,M2),menor(D,M2,M1).
menor(A,B,C,D,E,M1):- menor(A,B,C,D,M2),menor(E,M2,M1).

mayor(A,B,A):- A>B,!.
mayor(A,B,B).			
mayor(A,B,C,M1):- mayor(A,B,M2),mayor(C,M2,M1).
mayor(A,B,C,D,M1):-mayor(A,B,C,M2),mayor(D,M2,M1).
mayor(A,B,C,D,E,M1):- mayor(A,B,C,D,M2),mayor(E,M2,M1).

segmenor(A,B,A):- A>=B,!.
segmenor(A,B,B).
segmenor(A,B,C,Me):-menor(A,B,C,Me1),iguales(A,Me1),menor(B,C,Me),!.
segmenor(A,B,C,Me):-menor(A,B,C,Me1),iguales(B,Me1),menor(A,C,Me),!.
segmenor(A,B,C,Me):-menor(A,B,C,Me1),iguales(C,Me1),menor(A,B,Me).
segmenor(A,B,C,D,Me):-menor(A,B,C,D,Me1),iguales(A,Me1),menor(B,C,D,Me),!.
segmenor(A,B,C,D,Me):-menor(A,B,C,D,Me1),iguales(B,Me1),menor(A,C,D,Me),!.
segmenor(A,B,C,D,Me):-menor(A,B,C,D,Me1),iguales(C,Me1),menor(A,B,D,Me),!.
segmenor(A,B,C,D,Me):-menor(A,B,C,D,Me1),iguales(D,Me1),menor(A,B,C,Me).
segmenor(A,B,C,D,E,Me):-menor(A,B,C,D,E,Me1),iguales(A,Me1),menor(B,C,D,E,Me),!.
segmenor(A,B,C,D,E,Me):-menor(A,B,C,D,E,Me1),iguales(B,Me1),menor(A,C,D,E,Me),!.
segmenor(A,B,C,D,E,Me):-menor(A,B,C,D,E,Me1),iguales(C,Me1),menor(A,B,D,E,Me),!.
segmenor(A,B,C,D,E,Me):-menor(A,B,C,D,E,Me1),iguales(D,Me1),menor(A,B,C,E,Me),!.
segmenor(A,B,C,D,E,Me):-menor(A,B,C,D,E,Me1),iguales(E,Me1),menor(A,B,C,D,Me).

segmayor(A,B,A):- A<=B,!.
segmayor(A,B,B).
segmayor(A,B,C,Me):-mayor(A,B,C,Me1),iguales(A,Me1),mayor(B,C,Me),!.
segmayor(A,B,C,Me):-mayor(A,B,C,Me1),iguales(B,Me1),mayor(A,C,Me),!.
segmayor(A,B,C,Me):-mayor(A,B,C,Me1),iguales(C,Me1),mayor(A,B,Me).
segmayor(A,B,C,D,Me):-mayor(A,B,C,D,Me1),iguales(A,Me1),mayor(B,C,D,Me),!.
segmayor(A,B,C,D,Me):-mayor(A,B,C,D,Me1),iguales(B,Me1),mayor(A,C,D,Me),!.
segmayor(A,B,C,D,Me):-mayor(A,B,C,D,Me1),iguales(C,Me1),mayor(A,B,D,Me),!.
segmayor(A,B,C,D,Me):-mayor(A,B,C,D,Me1),iguales(D,Me1),mayor(A,B,C,Me).
segmayor(A,B,C,D,E,Me):-mayor(A,B,C,D,E,Me1),iguales(A,Me1),mayor(B,C,D,E,Me),!.
segmayor(A,B,C,D,E,Me):-mayor(A,B,C,D,E,Me1),iguales(B,Me1),mayor(A,C,D,E,Me),!.
segmayor(A,B,C,D,E,Me):-mayor(A,B,C,D,E,Me1),iguales(C,Me1),mayor(A,B,D,E,Me),!.
segmayor(A,B,C,D,E,Me):-mayor(A,B,C,D,E,Me1),iguales(D,Me1),mayor(A,B,C,E,Me),!.
segmayor(A,B,C,D,E,Me):-mayor(A,B,C,D,E,Me1),iguales(E,Me1),mayor(A,B,C,D,Me).

tercerMenor(A,B,C,M1):-  mayor(A,B,C,M1).
tercerMenor(A,B,C,D,M1):-  tercerMenor(A,B,C,M),D>M,M1 is M,!;
                               
tercerMenor(A,C,D,M1),B>M1,M is M1,!;
			       
tercerMenor(B,C,D,M1),A>M1,M is M1,!;
			       
tercerMenor(A,B,D,M1),C>M1,M is M1,!.

tercerMayor(A,B,C,M):- menor(A,B,C,M).
tercerMayor(A,B,C,D,M):- tercerMayor(A,B,C,M1),D<M1,M is M1,!;
                                
tercerMayor(A,C,D,M1),B<M1,M is M1,!;
				
tercerMayor(B,C,D,M1),A<M1,M is M1,!;
				
tercerMayor(A,B,D,M1),C<M1,M is M1,!.
tercerMayor(A,B,C,D,E,M) :- tercerMayor(A,B,C,D,M1),mayor(A,B,C,D,M2),E>M2,M is M1,!;
                                
tercerMayor(A,B,C,E,M1),mayor(A,B,C,D,M2),D>M2,M is M1,!;
				
tercerMayor(A,B,E,D,M1),mayor(A,B,C,D,M2),C>M2,M is M1,!;
				
tercerMayor(A,E,C,D,M1),mayor(A,B,C,D,M2),B>M2,M is M1,!;
				
tercerMayor(E,B,C,D,M1),mayor(A,B,C,D,M2),A>M2,M is M1,!;


diferencia(A,B,M1):- A<B, M1 is B-A,!.
diferencia(A,B,M1):- M1 is A-B.

menordif(A,B,D1):-diferencia(A,B,D1).
menordif(A,B,C,D1):- diferencia(A,B,D2),diferencia(A,C,D3),diferencia(B,C,D4),menor(D2,D3,D4,D1).
menordif(A,B,C,D,D1):- diferencia(A,B,C,D2),diferencia(A,C,D,D3),diferencia(B,C,D,D4),diferencia(A,B,D,E,D5),menor(D2,D3,D4,D5,D1).
menordif(A,B,C,D,E,D1):- diferencia(A,B,C,D,D2),diferencia(A,C,D,E,D3),diferencia(A,B,D,E,D4),diferencia(A,B,C,E,D5),diferencia(B,C,D,E,D6),menor(D2,D3,D4,D5,D6,D1).

mayordif(A,B,D1):-diferencia(A,B,D1).
mayordif(A,B,C,D1):- diferencia(A,B,D2),diferencia(A,C,D3),diferencia(B,C,D4),mayor(D2,D3,D4,D1).
mayordif(A,B,C,D,D1):- diferencia(A,B,C,D2),diferencia(A,C,D,D3),diferencia(B,C,D,D4),diferencia(A,B,D,E,D5),mayor(D2,D3,D4,D5,D1).
mayordif(A,B,C,D,E,D1):- diferencia(A,B,C,D,D2),diferencia(A,C,D,E,D3),diferencia(A,B,D,E,D4),diferencia(A,B,C,E,D5),diferencia(B,C,D,E,D6),mayor(D2,D3,D4,D5,D6,D1).

iguales(A,A).
iguales(A,A,A).
iguales(A,A,A,A).
iguales(A,A,A,A,A).

diferentes(A,B):- not(igual(A,B)).
diferentes(A,B,C):- dif(A,B), dif(B,C), dif(A,C).
diferentes(A,B,C,D):- dif(A,B,C), dif(B,C,D), dif(C,D,A).
diferentes(A,B,C,D,E):- dif(A,B,C,D), dif(B,C,D,E), dif(C,D,E,A),
			dif(D,E,A,B), dif(E,A,B,C).
dosIguales(A,A).
dosIguales(A,A,B):- not(iguales(A,B)),!.
dosIguales(B,A,A):- not(iguales(A,B)),!.
dosIguales(A,B,A):- not(iguales(A,B)).
dosIguales(A,A,B,C):- not(dosIguales(A,B,C)),!.
dosIguales(C,A,A,B):- not(dosIguales(A,B,C)),!.
dosIguales(B,C,A,A):- not(dosIguales(A,B,C)).
dosIguales(A,A,B,C,D):- not(dosIguales(A,B,C,D)),!.
dosIguales(D,A,A,B,C):- not(dosIguales(A,B,C,D)),!.
dosIguales(C,D,A,A,B):- not(dosIguales(A,B,C,D)),!.
dosIguales(B,C,D,A,A):- not(dosIguales(A,B,C,D)).

tresIguales(A,A,A).
tresIguales(A,A,A,B):-not(iguales(A,B)),!.
tresIguales(B,A,A,A):-not(iguales(A,B)),!.
tresIguales(A,B,A,A):-not(iguales(A,B)),!.
tresIguales(A,A,B,A):-not(iguales(A,B)).
tresIguales(A,A,A,B,C):-not(iguales(A,B,C)),!.
tresIguales(C,A,A,A,B):-not(iguales(A,B,C)),!.
tresIguales(B,C,A,A,A):-not(iguales(A,B,C)),!.
tresIguales(A,B,C,A,A):-not(iguales(A,B,C)),!.
tresIguales(A,A,B,C,A):-not(iguales(A,B,C)).

par(A):- A mod 2 =:= 0.
impar(A):- not(par(A)).

dospares(A,B):-par(A),par(B).
dospares(A,B,C):-dospares(A,B);dospares(A,C);dospares(C,B).
dospares(A,B,C,D):-dospares(A,B,C);dospares(A,C,D);dospares(B,C,D);dospares(A,B,D).
dospares(A,B,C,D,E):-dospares(A,B,C,D);dospares(A,C,D,E);dospares(A,D,E,B);dospares(A,B,C,E);dospares(E,B,C,D).

trespares(A,B,C):- par(A),par(B),par(C).
trespares(A,B,C,D):-trespares(A,B,C);trespares(A,B,D);trespares(A,C,D);trespares(B,C,D).
trespares(A,B,C,D,E):-trespares(A,B,C,D);trespares(A,C,D,E);trespares(A,B,D,E);trespares(A,B,C,E);trespares(B,C,D,E).

todospares(A,B):-par(A),par(B).
todospares(A,B,C):-par(A),par(B),par(C).
todospares(A,B,C,D):-par(A),par(B),par(C),par(D).
todospares(A,B,C,D,E):-par(A),par(B),par(C),par(D),par(E).

parimpar(A,B):- par(A),impar(B);par(B),impar(A).
parimpar(A,B,C):-parimpar(A,B);parimpar(B,C);parimpar(A,C).
parimpar(A,B,C,D):-parimpar(A,B,C);parimpar(A,C,D);parimpar(A,B,D);parimpar(D,B,C).
parimpar(A,B,C,D,E):-parimpar(A,B,C,D);parimpar(A,C,D,E);parimpar(A,D,E,B);parimpar(A,E,B,C);parimpar(E,B,C,D).

sumandos(A,B):-Sum is A+B,(Sum=:=A;Sum=:=B).
sumandos(A,B,C):-(Sum is A+B,(Sum=:=C;Sum=:=B;Sum=:=A));
		 (Sum is A+C,(Sum=:=C;Sum=:=B;Sum=:=A));	
		 (Sum is C+B,(Sum=:=C;Sum=:=B;Sum=:=A)).			
sumandos(A,B,C,D):-(Sum is A+B,(Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		   (Sum is A+C,(Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));	
		   (Sum is A+D,(Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		   (Sum is B+C,(Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		   (Sum is B+D,(Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		   (Sum is C+D,(Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		   (Sum is A+B+C,(Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		   (Sum is A+C+D,(Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		   (Sum is B+C+D,(Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A)).
sumandos(A,B,C,D,E):-(Sum is A+B,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		     (Sum is A+C,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));	
		     (Sum is A+D,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		     (Sum is A+E,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		     (Sum is B+C,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		     (Sum is B+D,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		     (Sum is B+E,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		     (Sum is C+D,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		     (Sum is C+E,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		     (Sum is D+E,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		     (Sum is A+B+C,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		     (Sum is A+C+D,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		     (Sum is A+D+E,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		     (Sum is B+C+D,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		     (Sum is B+D+E,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		     (Sum is C+D+E,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		     (Sum is A+C+D,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
		     (Sum is B+C+D,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
                     (Sum is A+B+C+D,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
                     (Sum is A+C+D+E,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A));
                     (Sum is B+C+D+E,(Sum=:=E;Sum=:=D;Sum=:=C;Sum=:=B;Sum=:=A)).

divEntera(A,B,C):-(Div is A/B,(Div=:=C;Div=:=B;Div=:=A));
		  (Div is A/C,(Div=:=C;Div=:=B;Div=:=A));
		  (Div is B/A,(Div=:=C;Div=:=B;Div=:=A));
		  (Div is B/C,(Div=:=C;Div=:=B;Div=:=A));	
		  (Div is C/A,(Div=:=C;Div=:=B;Div=:=A));	
		  (Div is C/B,(Div=:=C;Div=:=B;Div=:=A)).
divEntera(A,B,C,D):-(Div is A/B,(Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		    (Div is A/C,(Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		    (Div is A/D,(Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		    (Div is B/A,(Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		    (Div is B/C,(Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		    (Div is B/D,(Div=:=D;Div=:=C;Div=:=B;Div=:=A));	
		    (Div is C/A,(Div=:=D;Div=:=C;Div=:=B;Div=:=A));	
		    (Div is C/B,(Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		    (Div is C/D,(Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		    (Div is D/A,(Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		    (Div is D/B,(Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		    (Div is D/C,(Div=:=D;Div=:=C;Div=:=B;Div=:=A)).	
divEntera(A,B,C,D,E):-(Div is A/B,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		      (Div is A/C,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		      (Div is A/D,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));
                      (Div is A/E,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		      (Div is B/A,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		      (Div is B/C,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		      (Div is B/D,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));	
		      (Div is B/E,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		      (Div is C/A,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));	
		      (Div is C/B,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		      (Div is C/D,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		      (Div is C/E,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		      (Div is D/A,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		      (Div is D/B,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		      (Div is D/C,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));	
		      (Div is D/E,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		      (Div is E/A,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		      (Div is E/B,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));   
		      (Div is E/C,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A));
		      (Div is E/D,(Div=:=E;Div=:=D;Div=:=C;Div=:=B;Div=:=A)). 

residuo(A,B,C):-(Res is A//B,(Res=:=C;Res=:=B;Res=:=A));
		(Res is A//C,(Res=:=C;Res=:=B;Res=:=A));
		(Res is B//A,(Res=:=C;Res=:=B;Res=:=A));
		(Res is B//C,(Res=:=C;Res=:=B;Res=:=A));	
		(Res is C//A,(Res=:=C;Res=:=B;Res=:=A));	
		(Res is C//B,(Res=:=C;Res=:=B;Res=:=A)).
residuo(A,B,C,D):-(Res is A//B,(Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		  (Res is A//C,(Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		  (Res is A//D,(Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		  (Res is B//A,(Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		  (Res is B//C,(Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		  (Res is B//D,(Res=:=D;Res=:=C;Res=:=B;Res=:=A));	
		  (Res is C//A,(Res=:=D;Res=:=C;Res=:=B;Res=:=A));	
		  (Res is C//B,(Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		  (Res is C//D,(Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		  (Res is D//A,(Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		  (Res is D//B,(Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		  (Res is D//C,(Res=:=D;Res=:=C;Res=:=B;Res=:=A)).	
residuo(A,B,C,D,E):-(Res is A//B,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		    (Res is A//C,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		    (Res is A//D,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));
                    (Res is A//E,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		    (Res is B//A,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		    (Res is B//C,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		    (Res is B//D,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));	
		    (Res is B//E,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		    (Res is C//A,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));	
		    (Res is C//B,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		    (Res is C//D,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		    (Res is C//E,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		    (Res is D//A,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		    (Res is D//B,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		    (Res is D//C,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));	
	            (Res is D//E,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		    (Res is E//A,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		    (Res is E//B,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));   
		    (Res is E//C,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A));
		    (Res is E//D,(Res=:=E;Res=:=D;Res=:=C;Res=:=B;Res=:=A)).




