open Base

let extract result (score, letters) =
  List.fold letters ~init:result ~f:(fun acc letter ->
    let lower_letter = Char.lowercase letter in
    (lower_letter, score)::acc)

let transform list = list
  |> List.fold ~init:[] ~f:extract
  |> List.sort ~compare:(fun a b ->
    let (a', _) = a in
    let (b', _) = b in
    Char.compare a' b')
