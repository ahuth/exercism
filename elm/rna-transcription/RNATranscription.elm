module RNATranscription exposing (toRNA)

toRNA : String -> Result Char String
toRNA dna =
  Ok (String.map convert dna)

convert : Char -> Char
convert nucleotide =
  case nucleotide of
    'G' -> 'C'
    'C' -> 'G'
    'T' -> 'A'
    'A' -> 'U'
    _ -> '?'
