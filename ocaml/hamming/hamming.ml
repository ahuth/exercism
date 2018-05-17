type nucleotide = A | C | G | T

let hamming_distance first second =
  let rec calculate first second distance =
    match first, second with
      | [], [] -> Some distance
      | a::a_tail, b::b_tail -> calculate a_tail b_tail (distance + (if a = b then 0 else 1))
      | _ -> None
    in
      calculate first second 0
