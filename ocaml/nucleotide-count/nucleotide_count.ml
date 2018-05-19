open Core_kernel

let count strand nucleotide =
  String.count strand ~f:((=) nucleotide)

let nucleotide_counts strand =
  ['A'; 'C'; 'G'; 'T']
  |> List.filter_map ~f:(fun c -> match count strand c with
      | 0 -> None
      | n -> Some (c, n))
  |> Char.Map.of_alist_exn
