module Pangram (isPangram) where

import Data.Char (isLetter, toLower)
import Data.List (filter)
import Data.List.Unique (sortUniq)

isPangram :: String -> Bool
isPangram text =
  (sortUniq (map toLower (filter isLetter text))) == "abcdefghijklmnopqrstuvwxyz"
