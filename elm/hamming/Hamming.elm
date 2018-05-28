module Hamming exposing (distance)

distance : String -> String -> Result String Int
distance left right =
  let
    calculate left right distance =
      case (left, right) of
        ([], []) ->
          Ok distance
        (a :: aTail, b :: bTail) ->
          if a == b then
            calculate aTail bTail distance
          else
            calculate aTail bTail (distance + 1)
        _ ->
          Err "left and right strands must be of equal length"
  in
    calculate (String.toList left) (String.toList right) 0
