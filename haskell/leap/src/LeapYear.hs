module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = year `mod` 4 == 0 && not (isCentury year) || isExceptional year

isCentury :: Integer -> Bool
isCentury year = year `mod` 100 == 0

isExceptional :: Integer -> Bool
isExceptional year = year `mod` 400 == 0
