module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys =
  let
    calculate a b count =
      case (a, b) of
        ([], []) ->
          Just count
        ((a:aTail), (b:bTail)) ->
          calculate aTail bTail (if a == b then count else count + 1)
        _ ->
          Nothing
  in
    calculate xs ys 0
