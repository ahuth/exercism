-module(rna_transcription).

-export([to_rna/1]).

to_rna(Strand) -> [convert(N) || N <- Strand].

convert($G) -> $C;
convert($C) -> $G;
convert($T) -> $A;
convert($A) -> $U.
