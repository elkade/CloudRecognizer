(rule CUMULONIMBUS => (PADA_DESZCZ) (ZASLANIA_CALE_NIEBO) )
(rule NIMBOSTRATUS => (PADA_DESZCZ ZASLANIA_CALE_NIEBO)  () )

(rule CUMULUS => (JEST_NISKO)  (PADA_DESZCZ ZASLANIA_CALE_NIEBO) )
(rule STRATUS => (JEST_NISKO ZASLANIA_CALE_NIEBO JEST_ZWARTA)  (PADA_DESZCZ) )
(rule STRATOCUMULUS => (JEST_NISKO ZASLANIA_CALE_NIEBO) (PADA_DESZCZ JEST_ZWARTA))

(rule ALTOSTRATUS => (JEST_GLADKA POKRYWA_WIEKSZOSC_NIEBA) (PADA_DESZCZ JEST_NISKO))
(rule CIRROSTRATUS => (JEST_GLADKA JEST_ZWARTA) (PADA_DESZCZ JEST_NISKO POKRYWA_WIEKSZOSC_NIEBA))
(rule CIRRUS => (JEST_GLADKA) (PADA_DESZCZ JEST_NISKO POKRYWA_WIEKSZOSC_NIEBA JEST_ZWARTA))

(rule ALTOCUMULUS => (POKRYWA_WIEKSZOSC_NIEBA) (PADA_DESZCZ JEST_NISKO JEST_GLADKA))

;(RULE CIRROCUMULUS => NIL (PADA_DESZCZ JEST_NISKO JEST_GLADKA POKRYWA_WIEKSZOSC_NIEBA))

(MANY-RULES
(CUMULONIMBUS => (PADA_DESZCZ) (ZASLANIA_CALE_NIEBO) )
(NIMBOSTRATUS => (PADA_DESZCZ ZASLANIA_CALE_NIEBO)  () )
)
(RULE CIRROCUMULUS => NIL (PADA_DESZCZ JEST_NISKO JEST_GLADKA POKRYWA_WIEKSZOSC_NIEBA))
