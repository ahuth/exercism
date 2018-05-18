open Core

let square_of_sum num =
  let list = List.range 1 (num + 1) in
  let sum = List.fold_left ~f:(+) ~init:0 list in
  sum * sum

let sum_of_squares num =
  let list = List.range 1 (num + 1) in
  let squares = List.map ~f:(fun x -> x * x) list in
  List.fold_left ~f:(+) ~init:0 squares

let difference_of_squares num =
  square_of_sum (num) - sum_of_squares (num)
