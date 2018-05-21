module DNA (toRNA) where

toRNA :: String -> Maybe String
toRNA dna = mapM convert dna

convert 'G' = Just 'C'
convert 'C' = Just 'G'
convert 'T' = Just 'A'
convert 'A' = Just 'U'
convert _ = Nothing
