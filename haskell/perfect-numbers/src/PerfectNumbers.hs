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
  filter (\factor -> num `mod` factor == 0) [1..(num `div` 2)]
