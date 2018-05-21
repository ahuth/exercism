open Core

type school = string list Int.Map.t

let empty_school = Int.Map.empty

let add name grade school =
  Map.add_multi school ~key:grade  ~data:name

let grade grade school =
  match Map.find school grade with
    | None -> []
    | Some list -> list

let sorted school =
  Map.map school ~f:(fun list -> List.sort list ~compare:String.compare)
