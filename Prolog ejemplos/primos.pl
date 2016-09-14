primo(N):-primoR(N,2).
primoR(N,I):-I>N//2,!.
primoR(N,I):-	N mod I =\= 0,
				I1 is I+1,
				primoR(N,I1).

primos(A,B):-	A=:=B,!.				
primos(A,B):-	primo(A),
				write(A), nl,
				A1 is A+1,
				primos(A1,B).
primos(A,B):-	A1 is A+1,
				primos(A1,B).
				
siguientePrimoN(N):-	primo(N),
						write(N),nl,!.
siguientePrimoN(N):-	N1 is N+1,
						siguientePrimoN(N1).
						
anteriorPrimoN(N):-	primo(N),
						write(N),nl,!.
anteriorPrimoN(N):-	N1 is N-1,
						anteriorPrimoN(N1).						
						
esDivisorPrimo(N,I):-	N mod I =:= 0,
						primo(I).
						
divisoresPrimos(N):-	divisoresPrimosR(N,1).

divisoresPrimosR(N,I):-	N=:=I,
						primo(N),
						write(N),nl,!.
divisoresPrimosR(N,I):-	N=:=I,!.
divisoresPrimosR(N,I):-	esDivisorPrimo(N,I),
						write(I),nl,
						I1 is I+1,
						divisoresPrimosR(N,I1).
divisoresPrimosR(N,I):-	I1 is I+1,
						divisoresPrimosR(N,I1).