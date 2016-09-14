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


segmayor(A,B,C,M1):- mayor(A,B,C,M2),A=:=M2,mayor(B,C,M1),!.
segmayor(A,B,C,M1):- mayor(A,B,C,M2),B=:=M2,mayor(A,C,M1),!.
segmayor(A,B,C,M1):- mayor(A,B,M1).

segmayor(A,B,C,D,M1):- mayor(A,B,C,D,M2),A=:=M2,mayor(B,C,D,M1);mayor(A,B,C,D,M2),B=:=M2,mayor(A,C,D,M1);mayor(A,B,C,D,M2),C=:=M2,mayor(A,B,D,M1);
mayor(A,B,C,M1).

segmayor(A,B,C,D,E,M1):- mayor(A,B,C,D,E,M2),A=:=M2,mayor(B,C,D,E,M1);mayor(A,B,C,D,E,M2),B=:=M2,mayor(A,C,D,E,M1);mayor(A,B,C,D,E,M2),C=:=M2,mayor(A,B,D,E,M1);
mayor(A,B,C,D,E,M2),D=:=M2,mayor(A,B,C,E,M1);mayor(A,B,C,D,M1).

diferencia(A,B,M1):- A<B M1 is B-A,!.
diferencia(A,B,M1):- M1 is A-B.
menordif(A,B,C,D1):- diferencia(A,B,D2),diferencia(A,C,D3),diferencia(B,C,D4),menor(D2,D3,D4,D1).