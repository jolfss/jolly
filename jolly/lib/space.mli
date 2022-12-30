open Subspace
type space
(** A [space] is an n-dimensional 'layered' lattice. The space can be thought of as a subspace of subspaces where this can recurse for as many subspaces are in the space.
 For example, the space represented by subdividing a [6] lattice with a [3;3] lattice may represent a rubix cube--six faces which each contain a 3x3 grid.*)

val empty_space : unit -> space
(** [empty_space ()] is the space which contains no elements.*)

val space_of_subspace : subspace -> space
(** [space_of_subspace subspace] is a space which has the dimensions of [subspace]*)

val zip_space : string list -> int list -> space
(** [zip_space labels lengths] is a space of (label,length) pairs for its dimensions.*)

val subdivide : subspace -> space -> space
(** [subdivide subspace space] is [space] with its deepest layer subdivided by [subspace]
Raises [Label_collision label] where [label] is the first label in [subspace] already reserved in [space].*)

val labels : space -> string list list
(** [labels space] is a list of all dimension names in space; these are unique. *)

val lengths : space -> int list list
(** [lengths space] is a list of all the lengths that constitute this space.*)

val string_of_space : space -> string
(** [string_of_space space] is the string representation of [space]. Represented by stringifying all subspaces and putting them in a list.*)

val size : space -> int
(** [size space] is the number of elements that this space can contain.*)

val index_weights : space -> (string*int) list
(**[index_weights space] is a list containing pairs (string,weight) where [weight] represents how far to step along the 1D index axis to increment [label] by one.*)

val index_from_position : space -> (string*int) list -> int
(**[index_from_position space] is the index of [position] in the specified space.*)

val position_from_index : space -> int -> (string*int) list 
(**[position_from_index space index] is the position at the [index] in [space]*)
