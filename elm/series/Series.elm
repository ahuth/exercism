module Series exposing (slices)

import Char

type alias Slice = List Int
type alias Slices = List Slice

slices : Int -> String -> Result String Slices
slices size input =
    if size < 1 then
      Err ("Invalid size: " ++ toString size)
    else if size > String.length input then
      Ok []
    else if not (String.all Char.isDigit input) then
      Err "could not convert string 'a' to an Int"
    else
      let
        list = String.toList input
        digits = List.map toInt list
      in
        Ok (calculate size [] digits)

calculate : Int -> Slices -> Slice -> Slices
calculate size output input =
  if size > List.length input then
    List.reverse output
  else
    case input of
      (_ :: tail) ->
        let
          slice = List.take size input
        in
          calculate size (slice :: output) tail
      _ ->
        []

toInt : Char -> Int
toInt char =
  case String.toInt (String.fromChar char) of
    Ok num ->
      num
    Err _ ->
      0
