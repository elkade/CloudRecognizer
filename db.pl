cloudBuf(nimbostratus):-
	ask(pada_deszcz, y),
	ask(zaslania_cale_niebo, y).
	
cloudBuf(cumulonimbus):-
	ask(pada_deszcz, y).

cloudBuf(stratus) :-
	ask(jest_nisko, y),
	ask(zaslania_cale_niebo, y),
	ask(jest_zwarta, y).
	
cloudBuf(stratocumulus) :-
	ask(jest_nisko, y),
	ask(zaslania_cale_niebo, y).
	
cloudBuf(altostratus) :-
	ask(jest_gladka, y),
	ask(pokrywa_wiekszosc_nieba, y).
	
cloudBuf(cirrostratus) :-
	ask(jest_gladka, y),
	ask(jest_zwarta, y).
	
cloudBuf(cirrus) :-
	ask(jest_gladka, y).
	
cloudBuf(altocumulus) :-
	ask(pokrywa_wiekszosc_nieba, y).


cloudBuf(tecza) :-ask(jest_kolorowa, y),
!.