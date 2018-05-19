open Core_kernel

let count strand nucleotide =
  String.count strand ~f:((=) nucleotide)

let nucleotide_counts strand =
  ['A'; 'C'; 'G'; 'T']
  |> List.filter ~f:(fun c -> String.contains strand c)
  |> List.map ~f:(fun nucleotide -> (nucleotide, count strand nucleotide))
  |> Char.Map.of_alist_exn
