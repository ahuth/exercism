module Grains (square, total) where

import Data.Maybe (fromMaybe)

square :: Integer -> Maybe Integer
square n
  | n <= 0 = Nothing
  | n >= 65 = Nothing
  | otherwise = Just (2 ^ (n - 1))

total :: Integer
total = fromMaybe 0 (square 64) * 2 - 1
