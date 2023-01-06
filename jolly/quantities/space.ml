open Exceptions
open Util

type space = Subspace.subspace list

let labels (space : space) = List.fold_left (fun accumulator subspace -> Subspace.labels subspace :: accumulator) [] space

let lengths (space : space) = List.fold_left (fun accumulator subspace -> Subspace.lengths subspace :: accumulator) [] space

let empty_space () : space = []

let zip_space labels lengths : space = [Subspace.zip labels lengths]

let space_of_subspace subspace : space = [subspace]

let subdivide subspace space : space =
  let label_collision = 
    find_shared 
    (subspace |> Subspace.labels) 
    (space |> labels |> List.flatten) 
  in
  match label_collision with
  | Some label -> raise @@ Label_collision label
  | None -> space @ [subspace]

let string_of_space (space:space) =
  if space == [] then "[[]]" else
  let rec append_subspaces accumulator = function
    | subspace :: [] -> accumulator^","^Subspace.string_of_subspace subspace
    | subspace :: more -> append_subspaces (accumulator^","^Subspace.string_of_subspace subspace) more
    | [] -> "" in
  "["^(Subspace.string_of_subspace (List.hd space))^(append_subspaces "" (List.tl space))^"]"

let size (space:space) = if space == [] then 0 else List.fold_left (fun accumulator subspace -> accumulator * (Subspace.size subspace)) 1 space

let index_weights space =
  let flat_lengths = lengths space |> List.flatten in
  let flat_labels = labels space |> List.flatten in
  List.fold_left2 
  (fun accumulator label length -> 
    let next_multiplier = (match accumulator with (_, prev_product) :: _ -> prev_product | [] -> 1) * length in
    (label, next_multiplier) :: accumulator
  )
  [(List.hd flat_labels, 1)]  (List.tl flat_labels) (List.tl flat_lengths)

let index_from_position (space : space) : (string * int)  list -> int = 
  let index_assoc = index_weights space in 
    List.fold_left 
    (fun accumulator (label, position) -> accumulator + 
      (match List.assoc_opt label index_assoc with
        | Some multiplier ->  accumulator + multiplier*position
        | None -> raise @@ Label_not_found label)
    )
    0

let position_from_index (space : space) index : (string * int) list = 
  let rec get_next_label_component accumulator remainder = function
    | (label, length) :: more -> get_next_label_component 
    ((label,remainder mod length) :: accumulator)
    (remainder / length)
    more 
    | [] -> accumulator |> List.rev
  in
  get_next_label_component [] index (index_weights space)
