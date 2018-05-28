module Squares (difference, squareOfSums, sumOfSquares) where

difference :: Integral a => a -> a
difference n = squareOfSums n - sumOfSquares n

squareOfSums :: Integral a => a -> a
squareOfSums n =
  let total = sum [1..n]
  in total ^ 2

sumOfSquares :: Integral a => a -> a
sumOfSquares n =
  let squares = map (^2) [1..n]
  in sum squares
