iguaes(A,A,A,A,A).
mayor(A,B,A):- A>B,!.
mayor(A,B,B).
mayor(A,B,C,M1):-mayor(A,B,M2),mayor(C,M2,M1).
mayor(A,B,C,D,E,M1):- mayor(A,B,C,M2),mayor(D,E,M2,M1).

menor(A,B,A):- A<B,!.
menor(A,B,B).
menor(A,B,C,M1):-menor(A,B,M2),menor(C,M2,M1).
menor(A,B,C,D,E,M1):- menor(A,B,C,M2),menor(D,E,M2,M1).

dif(A,B,M1):- B>A, M1 is B-A,!.
dif(A,B,M1):- A-B.

maydif(A,B,C,D,E,M1):-mayor(A,B,C,D,E,M2),menor(A,B,C,D,E,M3),dif(M2,M3,M1).

diferentes(A,B,C,D,E):-A=/=B,A=/=c,A=/=D,A=/=E,B=/=C,B=/=D,B=/=E,C=/=D,C=/=E,D=/=E.