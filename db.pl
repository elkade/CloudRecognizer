cloudBuf(nimbostratus):-
	ask(pada_deszcz),
	ask(zaslania_cale_niebo).
	
cloudBuf(cumulonimbus):-
	ask(pada_deszcz).

cloudBuf(stratus) :-
	ask(jest_nisko),
	ask(zaslania_cale_niebo),
	ask(jest_zwarta).
	
cloudBuf(stratocumulus) :-
	ask(jest_nisko),
	ask(zaslania_cale_niebo).
	
cloudBuf(altostratus) :-
	ask(jest_gladka),
	ask(pokrywa_wiekszosc_nieba).
	
cloudBuf(cirrostratus) :-
	ask(jest_gladka),
	ask(jest_zwarta).
	
cloudBuf(cirrus) :-
	ask(jest_gladka).
	
cloudBuf(altocumulus) :-
	ask(pokrywa_wiekszosc_nieba).
	
cloudBuf(cirrocumulus).