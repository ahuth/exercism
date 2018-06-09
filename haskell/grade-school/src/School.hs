module School (School, add, empty, grade, sorted) where

import Data.Map (Map)
import qualified Data.Map as Map
import qualified Data.List as List

type School = Map Int Students
type Students = [String]

add :: Int -> String -> School -> School
add gradeNum student school =
  let
    sortTogether a b = List.sort (a ++ b)
  in
    Map.insertWith sortTogether gradeNum [student] school

empty :: School
empty =
  Map.empty

grade :: Int -> School -> Students
grade gradeNum school =
  Map.findWithDefault [] gradeNum school

sorted :: School -> [(Int, Students)]
sorted school =
  Map.toAscList school
