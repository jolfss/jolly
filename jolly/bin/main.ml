open Jolly

let sub_a = Subspace.zip [10;10;10] ["x";"y";"z"]
let sub_b = Subspace.zip [30;30] ["a";"b"]

let sp_a = Space.space_of_subspace sub_a
let sp_b = Space.space_of_subspace sub_b
let sp_ab = sp_a |> Space.subdivide sub_b
let sp_ba = sp_b |> Space.subdivide sub_a
