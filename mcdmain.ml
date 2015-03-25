open Types

(* string -> string *)
let string_of_file_in file_name_in =
  let str_in = ref "" in
  let chnl_in = open_in file_name_in in
  let cat_sub () =
    while true do
      str_in := !str_in ^ (String.make 1 (input_char chnl_in))
    done
  in
    try (cat_sub () ; "") with
      End_of_file -> ( close_in chnl_in ; !str_in )

(* string -> string -> unit *)
let file_out_of_string file_name_out content_out =
  let chnl_out = open_out file_name_out in
    output_string chnl_out content_out ;
    close_out chnl_out

let main file_name_header file_name_in file_name_out =

  let content_in = (string_of_file_in file_name_header) ^ (string_of_file_in file_name_in) in
  let lexed = Mcdlexer.mcdlex content_in in
  let parsed = Mcdparser.mcdparser lexed in
  let absed = Mcdabs.concrete_to_abstract parsed in
  let semed = Mcdsemantics.semantics absed in
  let content_out = Mcdout.mcdout semed in
    file_out_of_string file_name_out content_out

let _ = main Sys.argv.(1) Sys.argv.(2) Sys.argv.(3)
