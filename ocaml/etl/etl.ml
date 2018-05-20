open Base

let transform list = list
  |> List.concat_map ~f:(fun (score, letters) ->
    List.map letters ~f:(fun char -> (Char.lowercase char, score)))
  |> List.sort ~compare:(fun a b ->
    let (a', _) = a in
    let (b', _) = b in
    Char.compare a' b')
