open Subspace


type space
(** A [space] is a lattice.*)

val empty_space : unit -> space

val space_of_subspace : subspace -> space

val zip_space : string list -> int list -> space

val subdivide : subspace -> space -> space

val labels : space -> string list list

val lengths : space -> int list list

val string_of_space : space -> string

val size : space -> int


val index_weight_association : space -> (string*int) list

val index_function : space -> (string*int) list -> int
