
exception Length_mismatch of int
(** [Length_mismatch diff] is thrown if the lengths of two lists differ by [diff] when they should be equal in length.*)

exception Label_collision of string
(** [Label_collision label] is thrown if a [label] is already reserved and an attempt is made to bind something to it.*)

exception Label_not_found of string
(** [Label_not_found label] is thrown if [label] is expected to exist and does not.*)

exception Quantity_mismatch of string * string
(** [Quantity_mismatch (string_1, string_2)] is thrown when the quantity represented by string_1 is not compatible with the quantity represented by string_2.*)
