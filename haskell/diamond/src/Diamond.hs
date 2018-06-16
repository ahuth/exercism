module Diamond (diamond) where

import Data.List (takeWhile)
import Data.List.Index (imap)
import Debug.Trace

diamond :: Char -> Maybe [String]
diamond char =
  let
    letters = takeWhile (<= char) alphabet
    forwards = imap (makeLine (length forwards)) letters
    backwards = drop 1 (reverse forwards)
    result = forwards ++ backwards
  in
    Just result

alphabet :: String
alphabet =
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

makeLine :: Int -> Int -> Char -> String
makeLine limit index letter =
  let
    outer = replicate (limit - index - 1) ' '
    inner = replicate (2 * index - 1) ' '
  in
    case letter of
      'A' -> outer ++ "A" ++ outer
      _ -> outer ++ [letter] ++ inner ++ [letter] ++ outer
