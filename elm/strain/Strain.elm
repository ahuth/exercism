module Strain exposing (discard, keep)

import List exposing (reverse)


keep : (a -> Bool) -> List a -> List a
keep predicate list =
    calculate predicate list []


discard : (a -> Bool) -> List a -> List a
discard predicate list =
    calculate (predicate >> not) list []


calculate : (a -> Bool) -> List a -> List a -> List a
calculate predicate list acc =
    case list of
      [] ->
        reverse acc
      x :: xs ->
        if predicate x then
          calculate predicate xs (x :: acc)
        else
          calculate predicate xs acc
