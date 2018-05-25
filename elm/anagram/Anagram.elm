module Anagram exposing (detect)

import String exposing (toList, toLower)
import List exposing (filter, sort)

detect : String -> List String -> List String
detect word candidates =
  filter (isAnagram word) (removeWord candidates word)

isAnagram word candidate =
  normalize word == normalize candidate

normalize word =
  word
  |> toLower
  |> toList
  |> sort

removeWord list word =
  filter (\w -> not (toLower w == toLower word)) list
