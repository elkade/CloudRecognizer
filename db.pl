cloudBuf(nimbostratus):-
	ask(deszcz),
	ask(zaslania_cale_niebo).
	
cloudBuf(cumulonimbus):-
	ask(deszcz).

cloudBuf(stratus) :-
	ask(jest_nisko),
	ask(zaslania_cale_niebo),
	ask(jest_zwarta).
	
cloudBuf(stratocumulus) :-
	ask(jest_nisko),
	ask(zaslania_cale_niebo).
	
cloudBuf(cumulus) :-
	ask(jest_nisko).
cloudBuf(stratus) :-ask(zaslania_cale_niebo),
!.