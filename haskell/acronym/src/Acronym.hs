module Acronym (abbreviate) where

import Data.Char (isLetter, isUpper, toUpper)
import Data.Maybe (mapMaybe)

abbreviate :: String -> String
abbreviate xs =
  let
    offset = (' ':xs)
    pairs = zip offset xs
    getAcronymChar (prev, current)
      | not (isLetter prev) && (isLetter current) = Just (toUpper current)
      | not (isUpper prev) && (isUpper current) = Just current
      | otherwise = Nothing
  in
    mapMaybe getAcronymChar pairs
