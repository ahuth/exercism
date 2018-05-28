module SumOfMultiples exposing (sumOfMultiples)

sumOfMultiples : List Int -> Int -> Int
sumOfMultiples multiples limit =
  let
    numbers = List.range 1 (limit - 1)
    onlyFactors = List.filter (matchesFactors multiples) numbers
  in
    List.sum onlyFactors

matchesFactors factors num =
  List.any (\factor -> num % factor == 0) factors
