module Bob (responseFor) where

import Data.Char (isAlpha, isLower, isSpace)
import qualified Data.Text as T
import Flow

responseFor :: String -> String
responseFor xs
  | isSilence xs = "Fine. Be that way!"
  | isShout xs = "Whoa, chill out!"
  | isQuestion xs = "Sure."
  | otherwise = "Whatever."

isShout :: String -> Bool
isShout xs = any isAlpha xs && not (any isLower xs)

isSilence :: String -> Bool
isSilence xs = all isSpace xs

isQuestion :: String -> Bool
isQuestion xs = last (trim xs) == '?'

trim :: String -> String
trim xs = xs |> T.pack |> T.strip |> T.unpack
