module PhoneNumber exposing (getNumber)

import Char exposing (isDigit)
import Maybe exposing (andThen)

getNumber : String -> Maybe String
getNumber phoneNumber =
  clean phoneNumber
    |> andThen validateLength
    |> andThen validateAreaCode
    |> andThen validateExchangeCode

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

validateAreaCode : String -> Maybe String
validateAreaCode string =
  case String.slice 0 1 string of
    "0" ->
      Nothing
    "1" ->
      Nothing
    _ ->
      Just string

validateExchangeCode : String -> Maybe String
validateExchangeCode string =
  case String.slice 3 4 string of
    "0" ->
      Nothing
    "1" ->
      Nothing
    _ ->
      Just string
