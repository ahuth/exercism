module AtbashCipher exposing (decode, encode)

import Char exposing (isDigit, isLower)
import String exposing (dropLeft, filter, left, length, join, map, toLower)

encode : String -> String
encode plain = plain
    |> toLower
    |> filter isAlphaNumeric
    |> map convert
    |> chunk 5
    |> join " "

decode : String -> String
decode cipher = cipher
    |> filter isAlphaNumeric
    |> map convert

chunk : Int -> String -> List String
chunk size string =
    if (length string) > size then
      let
        currentChunk = left size string
        unprocessed = dropLeft size string
      in
        currentChunk :: chunk size unprocessed
    else
      [string]

isAlphaNumeric : Char -> Bool
isAlphaNumeric char =
    isLower char || isDigit char

convert : Char -> Char
convert char =
    case char of
      'a' -> 'z'
      'b' -> 'y'
      'c' -> 'x'
      'd' -> 'w'
      'e' -> 'v'
      'f' -> 'u'
      'g' -> 't'
      'h' -> 's'
      'i' -> 'r'
      'j' -> 'q'
      'k' -> 'p'
      'l' -> 'o'
      'm' -> 'n'
      'n' -> 'm'
      'o' -> 'l'
      'p' -> 'k'
      'q' -> 'j'
      'r' -> 'i'
      's' -> 'h'
      't' -> 'g'
      'u' -> 'f'
      'v' -> 'e'
      'w' -> 'd'
      'x' -> 'c'
      'y' -> 'b'
      'z' -> 'a'
      _ -> char
