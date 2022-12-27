let rec find_shared any_list in_list = 
  match any_list with
  | any_elem :: any_more -> 
      (match List.find_opt (fun in_elem -> in_elem == any_elem) in_list with 
      | None -> find_shared any_more in_list
      | shared_elem -> shared_elem
      )
  | [] -> None

let rec find_duplicate list = 
  match list with 
  | some :: more -> 
      (match List.find_opt (fun elem -> elem == some) more with
      | None -> find_duplicate more
      | some_duplicate -> some_duplicate
      )
  | [] -> None

