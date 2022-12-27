
val find_shared : 'a list -> 'a list -> 'a option
(**[find_shared any in] is [Some elem] where [elem] is the first shared element between [any] and [in] and [None] if the lists have no intersection.*)

val find_duplicate : 'a list -> 'a option
(**[find_duplicate list] is [Some elem] where [elem] is the first element which appears twice in [list] and [None] if [list] has no duplicate elements.*)
