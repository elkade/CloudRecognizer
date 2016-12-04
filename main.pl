cloud(X) :-
	retractall(known(Y,A)),
	consult('c:/users/lukas/desktop/magisterka zima/prolog/cloudrecognizer/db.pl'),
	cloudBuf(X).

:- dynamic known/2.
	
ask(A, V):-
	known(V, A),
	!.
ask(A, V):-
	known(_, A),
	!,
	fail.
ask(A, V):- 
	known(V2, A),
	V \== V2,
	!,
	fail.
ask(A, V):-
	write(A),
	write('? : '),
	read(Y),
	asserta(known(Y, A)),
	Y == V.

save_fact(Cloud,FeaturesList, NonFeaturesList) :-
	writeEx(["\ncloudBuf("]),
	writeEx([Cloud]),
	writeEx([") :-"]),
	writeEx2(FeaturesList, y),
	writeEx2(NonFeaturesList, n),
	writeEx(["!."]).

writeEx([]).
writeEx([H|T]):-
	open('c:/users/lukas/desktop/magisterka zima/prolog/cloudrecognizer/db.pl',append,Stream),
	write(Stream, H),
	close(Stream),
	writeEx(T).
	
	
writeEx2([], A).
writeEx2([H|T], A):-
	open('c:/users/lukas/desktop/magisterka zima/prolog/cloudrecognizer/db.pl',append,Stream),
	write(Stream, 'ask('),
	write(Stream, H),
	write(Stream, ', '),
	write(Stream, A),
	write(Stream, '),'),
	nl(Stream),
	close(Stream),
	writeEx2(T, A).
