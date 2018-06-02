module Allergies exposing (isAllergicTo, toList)

import Bitwise
import Dict exposing (Dict)

isAllergicTo : String -> Int -> Bool
isAllergicTo name score =
    let
      bit = Maybe.withDefault -1 (Dict.get name bits)
    in
      (Bitwise.and score bit) == bit

toList : Int -> List String
toList score =
    Dict.keys bits
      |> List.filterMap (possibleAllergy score)

bits : Dict String Int
bits =
    Dict.fromList
      [ ("eggs", 1)
      , ("peanuts", 2)
      , ("shellfish", 4)
      , ("strawberries", 8)
      , ("tomatoes", 16)
      , ("chocolate", 32)
      , ("pollen", 64)
      , ("cats", 128)
      ]

possibleAllergy : Int -> String -> Maybe String
possibleAllergy score name =
    case isAllergicTo name score of
      True ->
        Just name
      _ ->
        Nothing
