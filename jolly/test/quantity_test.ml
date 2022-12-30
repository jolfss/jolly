open OUnit2
open Jolly

let twenty_million_sized = Space.zip_space ["a";"b";"c";"d"] [100;100;100;20] 

let quantity_suite = "quantity_suite" >::: [
]

let () = OUnit2.run_test_tt_main quantity_suite


let _ = Quantity.from_value twenty_million_sized 5
