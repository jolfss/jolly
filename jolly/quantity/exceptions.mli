
exception Length_mismatch of int
(** [Length_mismatch diff] is thrown if the lengths of two lists differ by [diff] when they should be equal in length.*)

exception Label_collision of string
(** [Label_collision label] is thrown if a [label] is already reserved and an attempt is made to bind something to it.*)

exception Label_not_found of string
(** [Label_not_found label] is thrown if [label] is expected to exist and does not.*)
