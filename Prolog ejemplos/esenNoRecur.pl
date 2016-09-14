mostrarDivisores:-	read(N),
					ciclo(N,1).
ciclo(N,I):-I>N,!.
ciclo(N,I):-N mod I=:=0,
			write(I),nl,
			I1 is I+1,
			ciclo(N,I1),!.
ciclo(N,I):-I1 is I + 1,
			ciclo(N,I1).
			
mostrarDivCom:-	read(N),
				read(M),
				ciclo2(N,M,1).

ciclo2(N,M,I):-	I>N; I>M,!.
ciclo2(N,M,I):-	N mod I=:=0,
				M mod I=:=0,
				write(I), nl,
				I1 is I+1,
				ciclo2(N,M,I1).
ciclo2(N,M,I):-	I1 is I+1,
				ciclo2(N,M,I1).