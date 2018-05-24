module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit =
  let
    numbers = [1..limit - 1]
    onlyFactors = filter (matchesFactors factors) numbers
  in
    sum onlyFactors

matchesFactors factors num =
  any (\factor -> num `mod` factor == 0) factors
