open Core

let square_of_sum num =
  let rec calculate num sum = match num with
    | 0 -> sum
    | n -> calculate (num - 1) (sum + num)
  in
  let sum = calculate num 0 in
  sum * sum

let sum_of_squares num =
  let rec calculate num sum = match num with
    | 0 -> sum
    | n -> calculate (num - 1) (sum + num * num)
  in
    calculate num 0

let difference_of_squares num =
  square_of_sum (num) - sum_of_squares (num)
