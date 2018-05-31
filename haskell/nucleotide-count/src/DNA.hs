module DNA (nucleotideCounts) where

import Data.Map (Map)
import qualified Data.Map as Map

nucleotideCounts :: String -> Either String (Map Char Int)
nucleotideCounts xs
  | not (isValid xs) = Left "Not valid"
  | otherwise =
    let
      counts = Map.fromList
        [ ('A', count 'A' xs)
        , ('C', count 'C' xs)
        , ('G', count 'G' xs)
        , ('T', count 'T' xs)
        ]
    in
      Right counts

count :: Char -> String -> Int
count nucleotide sequence =
  length (filter ((==) nucleotide) sequence)

isValid :: String -> Bool
isValid xs =
  all isNucleotide xs

isNucleotide :: Char -> Bool
isNucleotide 'A' = True
isNucleotide 'C' = True
isNucleotide 'G' = True
isNucleotide 'T' = True
isNucleotide _ = False
