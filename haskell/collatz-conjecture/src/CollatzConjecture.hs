module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0 = Nothing
  | n == 1 = Just 0
  | otherwise = Just (calculate n 0)

calculate 1 steps = steps
calculate num steps
  | even num = calculate (num `quot` 2) (steps + 1)
  | otherwise = calculate (3 * num + 1) (steps + 1)
