type nucleotide = A | C | G | T

let hamming_distance first second =
  if List.length first != List.length second then None
  else let rec calculate first second distance =
    match first, second with
      | [], _ -> distance
      | a::a_tail, b::b_tail when a == b -> calculate a_tail b_tail distance
      | _::a_tail, _::b_tail -> calculate a_tail b_tail (distance + 1)
      | _ -> assert false
    in
      let distance = calculate first second 0 in
      Some (distance)
