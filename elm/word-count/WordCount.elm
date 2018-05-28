module WordCount exposing (wordCount)

import Dict exposing (Dict)
import Char exposing (isDigit, isLower, toLower)

wordCount : String -> Dict String Int
wordCount sentence =
    sentence
    |> String.map toLower
    |> String.filter isLetterOrSpace
    |> String.split " "
    |> List.filter (\word -> not (String.isEmpty word))
    |> List.foldl update Dict.empty

isLetterOrSpace : Char -> Bool
isLetterOrSpace char =
    isLower char || isDigit char || char == ' '

update : String -> Dict String Int -> Dict String Int
update word acc =
    Dict.update word add acc

add : Maybe Int -> Maybe Int
add item =
    case item of
      Nothing ->
        Just 1
      Just count ->
        Just (count + 1)
