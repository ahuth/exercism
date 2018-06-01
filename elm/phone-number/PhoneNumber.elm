module PhoneNumber exposing (getNumber)

import Char exposing (isDigit)
import Maybe exposing (andThen)

getNumber : String -> Maybe String
getNumber phoneNumber =
  clean phoneNumber
    |> andThen validateLength
    |> andThen (validateIndex 0)
    |> andThen (validateIndex 3)

clean : String -> Maybe String
clean string =
  let
    filtered = String.filter isDigit string
  in
    case String.uncons filtered of
      Just ('1', rest) ->
        Just rest
      Just _ ->
        Just filtered
      Nothing ->
        Nothing

validateLength : String -> Maybe String
validateLength string =
  case String.length string of
    10 ->
      Just string
    _ ->
      Nothing

validateIndex : Int -> String -> Maybe String
validateIndex index string =
  case String.slice index (index + 1) string of
    "0" ->
      Nothing
    "1" ->
      Nothing
    _ ->
      Just string
