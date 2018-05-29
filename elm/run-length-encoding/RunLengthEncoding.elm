module RunLengthEncoding exposing (decode, encode, version)

import List.Extra exposing (group)

version =
    2

encode : String -> String
encode string =
    string
    |> String.toList
    |> group
    |> List.map encodeChunk
    |> String.join ""

decode : String -> String
decode string =
    Debug.crash "Please implement this function"

encodeChunk : List Char -> String
encodeChunk chunk =
    let
      count = List.length chunk
      maybeChar = List.head chunk
    in
      case maybeChar of
        Nothing ->
          ""
        Just char ->
          if count == 1 then
            String.fromList [char]
          else
            (toString count) ++ (String.fromList [char])
