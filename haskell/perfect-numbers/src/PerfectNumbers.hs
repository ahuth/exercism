module PerfectNumbers (classify, Classification(..)) where

import Debug.Trace

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify num
  | num <= 0 = Nothing
  | total < num = Just Deficient
  | total == num = Just Perfect
  | otherwise = Just Abundant
  where
    total = sum (factorsOf num);

factorsOf num =
  let
    createList possibleFactor acc
      | possibleFactor <= num `div` 2 =
        if isFactor possibleFactor num then
          createList (possibleFactor + 1) (possibleFactor:acc)
        else
          createList (possibleFactor + 1) acc
      | otherwise = acc
  in
    createList 1 [0]

isFactor factor num = num `mod` factor == 0
