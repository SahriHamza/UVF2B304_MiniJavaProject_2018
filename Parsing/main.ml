open Lexer
open Parser
open ErrorHandler
<<<<<<< HEAD


let rec lexAllBuf lexbuf = 
let tok = Lexer.read lexbuf in 
match tok with 
| EOF -> ()
| _ -> print_token tok; print_string " "; lexAllBuf lexbuf
=======
open Lexing

(*
let rec lexAllBuf lexbuf =
let lex = Lexer.read lexbuf in
match lex with
| EOF -> ()
| _ -> print_token lex; print_string " "; lexAllBuf lexbuf
*)

>>>>>>> sahri_test
let compile file =
print_string ("File "^file^" is being treated!\n");
try
	let input_file = open_in file in
	let lexbuf = Lexing.from_channel input_file in
	try
<<<<<<< HEAD
		lexAllBuf lexbuf;
		print_newline ();
		close_in (input_file);
	with
	| Errord (kind, debut, fin) -> 
		close_in (input_file);
		report_error kind; 
		print_position debut fin;                                                                                            
		print_newline ();
		close_in (input_file);
=======
<<<<<<< HEAD
			Parser.prog Lexer.read lexbuf;
			print_newline ();
=======
	Parser.prog Lexer.read lexbuf;
	print_newline ();
>>>>>>> 506b23a2a57d2ae5a1c3b559c1117ccbd4eb1eef
	with
	| Errord (kind, debut, fin) ->
		close_in (input_file);
		report_error kind;
		print_position debut fin;
		print_newline ();
		close_in (input_file);
	| Parser.Error ->
		print_string "parsing error :";
		print_position (lexeme_start_p lexbuf) (lexeme_end_p lexbuf)
>>>>>>> sahri_test

with Sys_error s -> print_endline ("Can’t find file ’" ^ file ^ "’")
let _ = Arg.parse [] compile ""
