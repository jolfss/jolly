include Util
open Exceptions

type subspace = (string * int) list

let empty_subspace () : subspace = []

let lengths (subspace : subspace) = List.fold_left (fun list (_, length) -> length :: list) [] subspace |> List.rev

let labels (subspace : subspace) = List.fold_left (fun list (label, _) -> label :: list) [] subspace |> List.rev

let zip labels lengths : subspace =
  let length_difference = List.compare_lengths lengths labels in
  let label_collision = Util.find_duplicate labels in 

  if length_difference <> 0 then raise @@ Length_mismatch length_difference
  else match label_collision with 
  | Some label -> raise @@ Label_collision label
  | None -> List.fold_left2 (fun list label length -> (label, length) :: list) [] labels lengths  |> List.rev

let subdivide subdivisor_subspace subspace : subspace =
  match Util.find_shared (labels subdivisor_subspace) (labels subspace) with
  | Some label -> raise @@ Label_collision label
  | None -> subspace @ subdivisor_subspace

let string_of_subspace subspace = 
  let rec append_pairs = function
  | (label, length) :: [] -> string_of_int(length)^label
  | (label, length) :: more -> string_of_int(length)^label^","^append_pairs more
  | [] -> "[]" in 
  "["^append_pairs(subspace)^"]"

let size (subspace : subspace) = List.fold_left (fun accumulator (_, length)-> accumulator * length) 1 subspace
