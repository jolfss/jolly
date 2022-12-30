type 'a quantity = {
  space : Space.space;
  indexer : (string * int) list -> int;
  values : 'a list
}

let map function_of_value_and_position = function
  {space; indexer; values} -> 
    let positions = List.init (Space.size space) (fun index -> Space.position_from_index space index) in 
    {space=space; indexer=indexer; values=List.map2 (fun value position -> function_of_value_and_position value position) values positions}

let from_value space value = {space=space; indexer=Space.index_from_position space; values=List.init (Space.size space) (fun _ -> value)}

let from_index space function_of_index = {space=space; indexer=Space.index_from_position space; values = List.init (Space.size space) function_of_index}

let from_position space function_of_position =
  let positions = List.init (Space.size space) (fun index -> Space.position_from_index space index) in
  {space=space; indexer=Space.index_from_position space; values=List.map function_of_position positions}


