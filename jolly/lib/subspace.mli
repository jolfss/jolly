type subspace

val empty_subspace : unit -> subspace

val labels : subspace -> string list

val lengths : subspace -> int list

val zip : string list -> int list -> subspace

val subdivide : subspace -> subspace -> subspace

val string_of_subspace : subspace -> string 

val size : subspace -> int
