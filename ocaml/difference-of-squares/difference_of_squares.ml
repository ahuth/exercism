open Core

let square_of_sum num =
  let list = List.range 1 (num + 1) in
  let sum = List.fold_left ~f:(+) ~init:0 list in
  (float_of_int sum) ** 2. |> int_of_float

let sum_of_squares num =
  let list = List.range 1 (num + 1) in
  let sum = List.map ~f:(float_of_int) list in
  let squares = List.map ~f:(fun x -> x ** 2.) sum in
  let summed = List.fold_left ~f:(+.) ~init:0. squares in
  int_of_float summed

let difference_of_squares num =
  square_of_sum (num) - sum_of_squares (num)
