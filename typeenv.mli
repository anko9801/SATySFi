open Types

type t

val empty : t

val to_list : t -> (var_name * type_struct) list

val from_list : (var_name * type_struct) list -> t

val add : t -> var_name -> type_struct -> t

val find : t -> var_name -> type_struct

val overwrite_range_of_type : type_struct -> Range.t -> type_struct

val erase_range_of_type : type_struct -> type_struct

val find_in_type_struct : Tyvarid.t -> type_struct -> bool

val find_in_type_environment : Tyvarid.t -> t -> bool

val make_forall_type : type_struct -> t -> type_struct

val string_of_type_environment : t -> string -> string

val string_of_control_sequence_type : t -> string

val replace_id : (Tyvarid.t * type_struct) list -> type_struct -> type_struct

val make_bounded_free : Tyvarid.quantifiability -> type_struct -> type_struct * (type_struct list)