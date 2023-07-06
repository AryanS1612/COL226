(* Sample interactive calculator for ML-Yacc *)

val vallist  : rational list ref = ref [];
val namelist : string list ref = ref [];

fun lookup_help(x : string, a : string list, b : rational list) =
  if (null(a)) then
    raise rat_error
  else if (x = hd a) then
    (hd b)
  else
    lookup_help(x,tl a, tl b)

fun lookup(x : string) = 
  let
    val b = !vallist
    val a = !namelist
  in
    lookup_help(x, a, b)
  end

fun addsym(id : string, ration : rational) =
  (vallist := (ration) :: !vallist;
  namelist := (id) :: !namelist;
  id ^ " = " ^ showDecimal(ration))

%%

%eop EOF SEMI

(* %pos declares the type of positions for terminals.
   Each symbol has an associated left and right position. *)

%pos int

%left SUB PLUS
%left TIMES DIV

%term ID of string | NUM of rational | PLUS | TIMES | PRINT |
      SEMI | EOF | DIV | SUB | RATIONAL | DECIMAL | LPAREN | RPAREN |
      EQUAL | LESS | GREATER | ASSIGN
%nonterm EXP of rational | START of string

%name Calc

%subst PRINT for ID
%prefer PLUS SUB TIMES DIV
%keyword RATIONAL DECIMAL

%noshift EOF
%value ID ("bogus")
%nodefault
%verbose
%%

(* the parser returns the value associated with the expression *)

  START :DECIMAL EXP    (showDecimal(EXP1))
        | RATIONAL EXP  (showRat(EXP1))
        | EXP           (showRat(EXP1))
        | EXP EQUAL EXP (Bool.toString(equal(EXP1, EXP2)))
        | EXP LESS EXP  (Bool.toString(less(EXP1, EXP2)))
        | EXP GREATER EXP     (Bool.toString(less(EXP2, EXP1)))
        | ID ASSIGN EXP (addsym(ID1, EXP1))
  EXP : NUM             (NUM)
      | ID              (lookup(ID1))
      | EXP PLUS EXP    (add(EXP1, EXP2))
      | EXP SUB EXP     (subtract(EXP1, EXP2))
      | EXP TIMES EXP   (multiply(EXP1, EXP2))
      | EXP DIV EXP     (divide(EXP1, EXP2))
      | LPAREN EXP RPAREN (EXP)