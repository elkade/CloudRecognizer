cloud(X) :-
	retractall(known(Y,A)),
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

	
	
cloudBuf(laysan_albatross):-
	ask(albatross),
	ask(white).
cloudBuf(black_footed_albatross):-
	ask(albatross),
	ask(dark).
cloudBuf(whistling_swan) :-
	ask(swan),
	ask(muffled_musical_whistle).
cloudBuf(trumpeter_swan) :-
	ask(swan),
	ask(loud_trumpeting).