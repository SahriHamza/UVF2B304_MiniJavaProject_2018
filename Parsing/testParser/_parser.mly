(* @authors : Robin You - Achibane Hamza - Hamza Sahri - Khaled Bousrih - Khalid Majdoub *)

(* Literals *)
%token <bool> BOOLEANLIT
%token <float> FLOATLIT
%token <int> INTEGERLIT
%token <string> STRINGLIT

(* Infix Operators*)
%token PLUS MINUS TIMES
%token DIV AND OR XOR
%token MOD INF SUP
%token ISEQUAL ISNOTEQUAL
%token SUPEQUAL INFEQUAL
%token CONDOR CONDAND COND
%token LSHIFT RSHIFT USHIFT
(* Prefix Operators*)
%token INCR DECR EXCL TILDE
(* Assignment Operators*)
%token EQUAL PLUSEQUAL MINUSEQUAL TIMESEQUAL
%token DIVEQUAL ANDEQUAL OREQUAL XOREQUAL
%token MODEQUAL LSHIFTEQUAL RSHIFTEQUAL USHIFTEQUAL
(* Delimitors*)
%token POINT SEMICOLON COMMA COLON LBRACE
%token RBRACE LPAREN RPAREN LBRACK RBRACK
(* Modifiers*)
%token ABSTRACT PRIVATE PROTECTED PUBLIC
%token STATIC STRICTFP SYNCHRONIZED
%token VOLATILE TRANSIENT NATIVE FINAL
(* Basic Types*)
%token BYTE SHORT CHAR INT
%token LONG FLOAT DOUBLE BOOLEAN
(* Other Keywords*)
%token ASSERT BREAK CASE CATCH CLASS
%token CONTINUE DO DEFAULT ELSE ENUM
%token FINALLY FOR IF IMPLEMENTS
%token INSTANCEOF INTERFACE NEW PACKAGE
%token SUPER SWITCH THIS THROW RETURN EXTENDS
%token AROBAS THROWS TRY VOID WHILE IMPORT
(* Special Tokens *)
%token EOF
%token <string> IDENT
%token NULL
%token <string> COMMENT

%start prog
%type <unit> prog
%%

prog:
	| LBRACE blockStatements_opt RBRACE {}

blockStatements_opt :
  	| {}
  	| blockStatements {}

blockStatements:
	| blockStatement {}
	| blockStatements blockStatement {}

blockStatement:
	| statement {}

statement:
	| emptyStatement {}
	| whileStatement {}

emptyStatement :
	| SEMICOLON {}


whileStatement:
	| WHILE LPAREN expression RPAREN statement {}

(* 15.27 Expression *)
expression:
  | assignmentExpression {}

assignmentExpression:
	| assignment {}

assignment:
	| leftHandSide {}
	| leftHandSide assignmentOperator assignmentExpression {}
assignmentOperator_opt:
	| {}
	| assignmentOperator {}

assignmentExpression_opt:
	| {}
	| assignmentExpression {}

leftHandSide:
	| expressionName {}

expressionName:
	| identifier {}

identifier:
	| IDENT {}

assignmentOperator:
	| PLUSEQUAL {}
	| MINUSEQUAL {}
	| TIMESEQUAL {}
	| DIVEQUAL {}
	| ANDEQUAL {}
	| OREQUAL {}
	| XOREQUAL {}
	| MODEQUAL {}
	| LSHIFTEQUAL {}
	| RSHIFTEQUAL {}
	| USHIFTEQUAL {}
	| EQUAL {}





%%
