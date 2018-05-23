module Pangram exposing (isPangram)
import Set

isPangram : String -> Bool
isPangram sentence =
  let length = sentence
    |> String.toLower
    |> String.split ""
    |> List.filter isLetter
    |> Set.fromList
    |> Set.toList
    |> List.length
  in length == 26

isLetter : String -> Bool
isLetter char =
  List.member char alphabet

alphabet = ["a" ,"b" ,"c" ,"d" ,"e" ,"f" ,"g" ,"h" ,"i" ,"j" ,"k" ,"l" ,"m" ,"n" ,"o" ,"p" ,"q" ,"r" ,"s" ,"t" ,"u" ,"v" ,"w" ,"x" ,"y" ,"z"]
