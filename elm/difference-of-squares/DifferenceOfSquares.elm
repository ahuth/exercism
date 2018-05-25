module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)


squareOfSum : Int -> Int
squareOfSum n =
    let
      total = List.sum (List.range 1 n)
    in
      total * total


sumOfSquares : Int -> Int
sumOfSquares n =
    List.range 1 n
    |> List.map (\n -> n * n)
    |> List.sum


difference : Int -> Int
difference n =
    squareOfSum n - sumOfSquares n
