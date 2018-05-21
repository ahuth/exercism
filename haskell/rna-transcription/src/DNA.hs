module DNA (toRNA) where

toRNA :: String -> Maybe String
toRNA dna = complement dna ""

complement "" rna = Just (reverse rna)
complement (h:tail) rna =
  case convert h of
    Nothing -> Nothing
    Just nucleotide -> complement tail (nucleotide:rna)

convert 'G' = Just 'C'
convert 'C' = Just 'G'
convert 'T' = Just 'A'
convert 'A' = Just 'U'
convert _ = Nothing
