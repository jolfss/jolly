open Quantities

let sub_a = Subspace.zip ["x";"y";"z"] [10;10;10]
let sub_b = Subspace.zip ["a";"b"] [30;30]

let sp_a = Space.space_of_subspace sub_a
let sp_b = Space.space_of_subspace sub_b
let sp_ab = sp_a |> Space.subdivide sub_b
let sp_ba = sp_b |> Space.subdivide sub_a

let rec eval_spaces = function 
  | space :: more -> print_endline (Space.string_of_space space); eval_spaces more;
  | [] -> ()


let _ = (
  eval_spaces [sp_a; sp_b; sp_ab; sp_ba];
  )
