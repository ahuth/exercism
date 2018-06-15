module Isogram (isIsogram) where

import Data.Char (isLetter, toLower)
import Data.List (nub)

isIsogram :: String -> Bool
isIsogram string =
  let
    lowerCase = map toLower string
    letters = filter isLetter lowerCase
    unique = nub letters
  in
    length unique == length letters
