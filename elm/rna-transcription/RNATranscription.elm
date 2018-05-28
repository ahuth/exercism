module RNATranscription exposing (toRNA)

toRNA : String -> Result Char String
toRNA dna =
  dna
  |> String.toList
  |> List.map convert
  -- Incomplete

convert : Char -> Result Char Char
convert nucleotide =
  case nucleotide of
    'G' -> Ok 'C'
    'C' -> Ok 'G'
    'T' -> Ok 'A'
    'A' -> Ok 'U'
    _ -> Err nucleotide
