bird(X) :-
	retractall(known(Y,A,V)),
	birdA(X).

birdA(laysan_albatross):-
	family(albatross),
	color(white).
birdA(black_footed_albatross):-
	family(albatross),
	color(dark).
birdA(whistling_swan) :-
	family(swan),
	voice(muffled_musical_whistle).
birdA(trumpeter_swan) :-
	family(swan),
	voice(loud_trumpeting).

order(tubenose) :-
	nostrils(external_tubular),
	live(at_sea),
	bill(hooked).
order(waterfowl) :-
	feet(webbed),
	bill(flat).
family(albatross) :-
	order(tubenose),
	size(large),
	wings(long_narrow).
family(swan) :-
	order(waterfowl),
	neck(long),
	color(white),
	flight(ponderous).

:- dynamic known/3.
	
ask(A, V):-
	known(yes, A, V), % succeed if true
	!. % stop looking
ask(A, V):-
	known(_, A, V), % fail if false
	!,
	fail.
ask(A, V):-
	write(A:V), % ask user
	write('? : '),
	read(Y), % get the answer
	asserta(known(Y, A, V)), % remember it
	Y == yes. % succeed or fail
	
nostrils(X):- ask(nostrils, X).
live(X):- ask(live, X).
bill(X):- ask(bill, X).
size(X):- ask(size, X).
wings(X):- ask(wings, X).
color(X):- ask(color, X).
feet(X):- ask(feet, X).