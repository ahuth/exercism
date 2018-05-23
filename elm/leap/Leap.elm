module Leap exposing (isLeapYear)

isLeapYear : Int -> Bool
isLeapYear year =
  rem year 4 == 0 && not (rem year 100 == 0) || rem year 400 == 0
