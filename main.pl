cloud(X) :-
	retractall(known(Y,A)),
	consult('c:/users/lukas/desktop/magisterka zima/prolog/cloudrecognizer/db.pl'),
	cloudBuf(X).

:- dynamic known/2.
	
ask(A):-
	known(yes, A), % succeed if true
	!. % stop looking
ask(A):-
	known(_, A), % fail if false
	!,
	fail.
ask(A):-
	write(A), % ask user
	write('? : '),
	read(Y), % get the answer
	asserta(known(Y, A)), % remember it
	Y == yes. % succeed or fail

save_fact(Cloud,FeaturesList) :-
	go(["cloudBuf("]),
	go([Cloud]),
	go([") :-"]),
	go2(FeaturesList),
	go(["!."]).

go([]).
go([H|T]):-
	open('c:/users/lukas/desktop/magisterka zima/prolog/cloudrecognizer/db.pl',append,Stream),
	write(Stream, H),
	close(Stream),
	go(T).
	
	
go2([]).
go2([H|T]):-
	open('c:/users/lukas/desktop/magisterka zima/prolog/cloudrecognizer/db.pl',append,Stream),
	write(Stream, 'ask('),
	write(Stream, H),
	write(Stream, '),'),
	nl(Stream),
	close(Stream),
	go2(T).
