module Accumulate exposing (accumulate)

import List exposing (reverse)

accumulate : (a -> b) -> List a -> List b
accumulate func input =
  let
    process input output =
      case input of
        [] -> reverse output
        head::tail -> process tail ((func head)::output)
  in
    process input []
