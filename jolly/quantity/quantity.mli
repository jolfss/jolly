type 'a quantity

val map : ('a -> (string*int) list -> 'b) -> 'a quantity -> 'b quantity
(** [map fn_position_value quantity] applies [fn_pos_value] to every element of [quantity], where the position is derived from the element's location in [quantity].*)

val from_value : Space.space -> 'a -> 'a quantity
(** [from_value space value] is a quantity with all elements equal to [value]*)

val from_index : Space.space -> (int -> 'a) -> 'a quantity
(** [from_index space fn_of_index] is a quantity with each element equal to [fn_of_index index_of_element].*)

val from_position : Space.space -> ((string * int) list -> 'a) -> 'a quantity
(** [from_position space fn_of_position] is a quantity with each element equal to [fn_of_position position_of_element].*)

