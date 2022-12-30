type subspace
(**A [subspace] is an n-Dimensional labeled lattice.*)

val empty_subspace : unit -> subspace
(** [empty_subspace ()] is a subspace which has the empty lattice.*)

val labels : subspace -> string list
(** [labels subspace] is a list of labels that characterize this dimension; same order as [lengths].*)

val lengths : subspace -> int list
(** [lengths subspace] is a list of the dimension lengths that characterize this dimension; same order as [labels].*)

val zip : string list -> int list -> subspace
(** [zip labels lengths] is a subspace with (label, length) pairs for its dimensions.
 Raises [Length_mismatch difference] if the lengths of the label and length lists are not equal.
 Raises [Label_collision] if [labels] contains any duplicates.*)

val subdivide : subspace -> subspace -> subspace
(** [subdivide subspace subspace] is the subspace which is a union of the first and second subspaces.
 Raises [Label_collision first_collision] for the first, if any, label that collides between the subspaces.*)

val string_of_subspace : subspace -> string
(** [string_of_subspace subspace] represents [subspace] as [len_1^label_1; len_2^label_2 ... len_n^label_n].
 E.g. [20x;10y;3z]*)

val size : subspace -> int
(** [size subspace] is the number of elements that fit in [subspace].*)
