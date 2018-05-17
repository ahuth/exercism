type nucleotide = A | C | G | T

let hamming_distance first second =
  let rec calculate first second distance =
    match first, second with
      | [], [] -> Some distance
      | a::a_tail, b::b_tail when a == b -> calculate a_tail b_tail distance
      | _::a_tail, _::b_tail -> calculate a_tail b_tail (distance + 1)
      | _ -> None
    in
      calculate first second 0
