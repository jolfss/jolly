type 'a quantity

val map : ('a -> (string*int) list -> 'b) -> 'a quantity -> 'b quantity
(** [map fn_position_value quantity] applies [fn_pos_value] to every element of [quantity], where the position is derived from the element's location in [quantity].*)

val from_value : Space.space -> 'a -> 'a quantity
(** [from_value space value] is a quantity with all elements equal to [value]*)

val from_index : Space.space -> (int -> 'a) -> 'a quantity
(** [from_index space fn_of_index] is a quantity with each element equal to [fn_of_index index_of_element].*)

val from_position : Space.space -> ((string * int) list -> 'a) -> 'a quantity
(** [from_position space fn_of_position] is a quantity with each element equal to [fn_of_position position_of_element].*)

val at_index : int -> 'a quantity -> 'a
(** [at_index index quantity] is the value at [index] in [quantity].*)

val pair : 'a quantity -> ('a -> 'b -> 'c) -> 'b quantity -> 'c quantity
(** [pair quantity_a a_op_b quantity_b] is a new quantity with the same space as [quantity_a]
where all values are [a a_op_b b] where values [a] [b] are taken from the same index. 
Spaces need not be the same, just have the same number of elements.*) 

val (#+) : int quantity -> int quantity -> int quantity

val (#-) : int quantity -> int quantity -> int quantity

val (#*) : int quantity -> int quantity -> int quantity

val (#/) : int quantity -> int quantity -> int quantity

val (#+.) : float quantity -> float quantity -> float quantity

val (#-.) : float quantity -> float quantity -> float quantity

val (#*.) : float quantity -> float quantity -> float quantity

val (#/.) : float quantity -> float quantity -> float quantity
