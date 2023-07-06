functor CalcLrValsFun(structure Token : TOKEN)
 : sig structure ParserData : PARSER_DATA
       structure Tokens : Calc_TOKENS
   end
 = 
struct
structure ParserData=
struct
structure Header = 
struct
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


end
structure LrTable = Token.LrTable
structure Token = Token
local open LrTable in 
val table=let val actionRows =
"\
\\001\000\001\000\008\000\002\000\007\000\010\000\006\000\011\000\005\000\
\\012\000\004\000\000\000\
\\001\000\001\000\017\000\002\000\007\000\012\000\004\000\000\000\
\\001\000\003\000\038\000\004\000\038\000\006\000\038\000\007\000\038\000\
\\008\000\038\000\009\000\038\000\013\000\038\000\014\000\038\000\
\\015\000\038\000\016\000\038\000\000\000\
\\001\000\003\000\039\000\004\000\039\000\006\000\039\000\007\000\039\000\
\\008\000\039\000\009\000\039\000\013\000\039\000\014\000\039\000\
\\015\000\039\000\016\000\039\000\000\000\
\\001\000\003\000\039\000\004\000\039\000\006\000\039\000\007\000\039\000\
\\008\000\039\000\009\000\039\000\014\000\039\000\015\000\039\000\
\\016\000\039\000\017\000\020\000\000\000\
\\001\000\003\000\040\000\004\000\014\000\006\000\040\000\007\000\040\000\
\\008\000\013\000\009\000\040\000\013\000\040\000\014\000\040\000\
\\015\000\040\000\016\000\040\000\000\000\
\\001\000\003\000\041\000\004\000\014\000\006\000\041\000\007\000\041\000\
\\008\000\013\000\009\000\041\000\013\000\041\000\014\000\041\000\
\\015\000\041\000\016\000\041\000\000\000\
\\001\000\003\000\042\000\004\000\042\000\006\000\042\000\007\000\042\000\
\\008\000\042\000\009\000\042\000\013\000\042\000\014\000\042\000\
\\015\000\042\000\016\000\042\000\000\000\
\\001\000\003\000\043\000\004\000\043\000\006\000\043\000\007\000\043\000\
\\008\000\043\000\009\000\043\000\013\000\043\000\014\000\043\000\
\\015\000\043\000\016\000\043\000\000\000\
\\001\000\003\000\044\000\004\000\044\000\006\000\044\000\007\000\044\000\
\\008\000\044\000\009\000\044\000\013\000\044\000\014\000\044\000\
\\015\000\044\000\016\000\044\000\000\000\
\\001\000\003\000\015\000\004\000\014\000\006\000\031\000\007\000\031\000\
\\008\000\013\000\009\000\012\000\000\000\
\\001\000\003\000\015\000\004\000\014\000\006\000\032\000\007\000\032\000\
\\008\000\013\000\009\000\012\000\000\000\
\\001\000\003\000\015\000\004\000\014\000\006\000\033\000\007\000\033\000\
\\008\000\013\000\009\000\012\000\014\000\011\000\015\000\010\000\
\\016\000\009\000\000\000\
\\001\000\003\000\015\000\004\000\014\000\006\000\034\000\007\000\034\000\
\\008\000\013\000\009\000\012\000\000\000\
\\001\000\003\000\015\000\004\000\014\000\006\000\035\000\007\000\035\000\
\\008\000\013\000\009\000\012\000\000\000\
\\001\000\003\000\015\000\004\000\014\000\006\000\036\000\007\000\036\000\
\\008\000\013\000\009\000\012\000\000\000\
\\001\000\003\000\015\000\004\000\014\000\006\000\037\000\007\000\037\000\
\\008\000\013\000\009\000\012\000\000\000\
\\001\000\003\000\015\000\004\000\014\000\008\000\013\000\009\000\012\000\
\\013\000\028\000\000\000\
\\001\000\006\000\000\000\007\000\000\000\000\000\
\"
val actionRowNumbers =
"\000\000\012\000\001\000\001\000\
\\001\000\002\000\004\000\001\000\
\\001\000\001\000\001\000\001\000\
\\001\000\001\000\017\000\003\000\
\\010\000\011\000\001\000\015\000\
\\014\000\013\000\006\000\008\000\
\\007\000\005\000\009\000\016\000\
\\018\000"
val gotoT =
"\
\\001\000\001\000\002\000\028\000\000\000\
\\000\000\
\\001\000\014\000\000\000\
\\001\000\016\000\000\000\
\\001\000\017\000\000\000\
\\000\000\
\\000\000\
\\001\000\019\000\000\000\
\\001\000\020\000\000\000\
\\001\000\021\000\000\000\
\\001\000\022\000\000\000\
\\001\000\023\000\000\000\
\\001\000\024\000\000\000\
\\001\000\025\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\001\000\027\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\"
val numstates = 29
val numrules = 14
val s = ref "" and index = ref 0
val string_to_int = fn () => 
let val i = !index
in index := i+2; Char.ord(String.sub(!s,i)) + Char.ord(String.sub(!s,i+1)) * 256
end
val string_to_list = fn s' =>
    let val len = String.size s'
        fun f () =
           if !index < len then string_to_int() :: f()
           else nil
   in index := 0; s := s'; f ()
   end
val string_to_pairlist = fn (conv_key,conv_entry) =>
     let fun f () =
         case string_to_int()
         of 0 => EMPTY
          | n => PAIR(conv_key (n-1),conv_entry (string_to_int()),f())
     in f
     end
val string_to_pairlist_default = fn (conv_key,conv_entry) =>
    let val conv_row = string_to_pairlist(conv_key,conv_entry)
    in fn () =>
       let val default = conv_entry(string_to_int())
           val row = conv_row()
       in (row,default)
       end
   end
val string_to_table = fn (convert_row,s') =>
    let val len = String.size s'
        fun f ()=
           if !index < len then convert_row() :: f()
           else nil
     in (s := s'; index := 0; f ())
     end
local
  val memo = Array.array(numstates+numrules,ERROR)
  val _ =let fun g i=(Array.update(memo,i,REDUCE(i-numstates)); g(i+1))
       fun f i =
            if i=numstates then g i
            else (Array.update(memo,i,SHIFT (STATE i)); f (i+1))
          in f 0 handle General.Subscript => ()
          end
in
val entry_to_action = fn 0 => ACCEPT | 1 => ERROR | j => Array.sub(memo,(j-2))
end
val gotoT=Array.fromList(string_to_table(string_to_pairlist(NT,STATE),gotoT))
val actionRows=string_to_table(string_to_pairlist_default(T,entry_to_action),actionRows)
val actionRowNumbers = string_to_list actionRowNumbers
val actionT = let val actionRowLookUp=
let val a=Array.fromList(actionRows) in fn i=>Array.sub(a,i) end
in Array.fromList(List.map actionRowLookUp actionRowNumbers)
end
in LrTable.mkLrTable {actions=actionT,gotos=gotoT,numRules=numrules,
numStates=numstates,initialState=STATE 0}
end
end
local open Header in
type pos = int
type arg = unit
structure MlyValue = 
struct
datatype svalue = VOID | ntVOID of unit ->  unit
 | NUM of unit ->  (rational) | ID of unit ->  (string)
 | START of unit ->  (string) | EXP of unit ->  (rational)
end
type svalue = MlyValue.svalue
type result = string
end
structure EC=
struct
open LrTable
infix 5 $$
fun x $$ y = y::x
val is_keyword =
fn (T 9) => true | (T 10) => true | _ => false
val preferred_change : (term list * term list) list = 
(nil
 $$ (T 0),nil
 $$ (T 4))::
(nil
,nil
 $$ (T 2))::
(nil
,nil
 $$ (T 8))::
(nil
,nil
 $$ (T 3))::
(nil
,nil
 $$ (T 7))::
nil
val noShift = 
fn (T 6) => true | _ => false
val showTerminal =
fn (T 0) => "ID"
  | (T 1) => "NUM"
  | (T 2) => "PLUS"
  | (T 3) => "TIMES"
  | (T 4) => "PRINT"
  | (T 5) => "SEMI"
  | (T 6) => "EOF"
  | (T 7) => "DIV"
  | (T 8) => "SUB"
  | (T 9) => "RATIONAL"
  | (T 10) => "DECIMAL"
  | (T 11) => "LPAREN"
  | (T 12) => "RPAREN"
  | (T 13) => "EQUAL"
  | (T 14) => "LESS"
  | (T 15) => "GREATER"
  | (T 16) => "ASSIGN"
  | _ => "bogus-term"
local open Header in
val errtermvalue=
fn (T 0) => MlyValue.ID(fn () => ("bogus")) | 
_ => MlyValue.VOID
end
val terms : term list = nil
 $$ (T 16) $$ (T 15) $$ (T 14) $$ (T 13) $$ (T 12) $$ (T 11) $$ (T 10)
 $$ (T 9) $$ (T 8) $$ (T 7) $$ (T 6) $$ (T 5) $$ (T 4) $$ (T 3) $$ (T 
2)end
structure Actions =
struct 
exception mlyAction of int
local open Header in
val actions = 
fn (i392,defaultPos,stack,
    (()):arg) =>
case (i392,stack)
of  ( 0, ( ( _, ( MlyValue.EXP EXP1, _, EXP1right)) :: ( _, ( _, 
DECIMAL1left, _)) :: rest671)) => let val  result = MlyValue.START (fn
 _ => let val  EXP1 = EXP1 ()
 in (showDecimal(EXP1))
end)
 in ( LrTable.NT 1, ( result, DECIMAL1left, EXP1right), rest671)
end
|  ( 1, ( ( _, ( MlyValue.EXP EXP1, _, EXP1right)) :: ( _, ( _, 
RATIONAL1left, _)) :: rest671)) => let val  result = MlyValue.START
 (fn _ => let val  EXP1 = EXP1 ()
 in (showRat(EXP1))
end)
 in ( LrTable.NT 1, ( result, RATIONAL1left, EXP1right), rest671)
end
|  ( 2, ( ( _, ( MlyValue.EXP EXP1, EXP1left, EXP1right)) :: rest671))
 => let val  result = MlyValue.START (fn _ => let val  EXP1 = EXP1 ()
 in (showRat(EXP1))
end)
 in ( LrTable.NT 1, ( result, EXP1left, EXP1right), rest671)
end
|  ( 3, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.START (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (Bool.toString(equal(EXP1, EXP2)))
end)
 in ( LrTable.NT 1, ( result, EXP1left, EXP2right), rest671)
end
|  ( 4, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.START (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (Bool.toString(less(EXP1, EXP2)))
end)
 in ( LrTable.NT 1, ( result, EXP1left, EXP2right), rest671)
end
|  ( 5, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.START (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (Bool.toString(less(EXP2, EXP1)))
end)
 in ( LrTable.NT 1, ( result, EXP1left, EXP2right), rest671)
end
|  ( 6, ( ( _, ( MlyValue.EXP EXP1, _, EXP1right)) :: _ :: ( _, ( 
MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = 
MlyValue.START (fn _ => let val  ID1 = ID1 ()
 val  EXP1 = EXP1 ()
 in (addsym(ID1, EXP1))
end)
 in ( LrTable.NT 1, ( result, ID1left, EXP1right), rest671)
end
|  ( 7, ( ( _, ( MlyValue.NUM NUM1, NUM1left, NUM1right)) :: rest671))
 => let val  result = MlyValue.EXP (fn _ => let val  (NUM as NUM1) = 
NUM1 ()
 in (NUM)
end)
 in ( LrTable.NT 0, ( result, NUM1left, NUM1right), rest671)
end
|  ( 8, ( ( _, ( MlyValue.ID ID1, ID1left, ID1right)) :: rest671)) =>
 let val  result = MlyValue.EXP (fn _ => let val  ID1 = ID1 ()
 in (lookup(ID1))
end)
 in ( LrTable.NT 0, ( result, ID1left, ID1right), rest671)
end
|  ( 9, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (add(EXP1, EXP2))
end)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 10, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (subtract(EXP1, EXP2))
end)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 11, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (multiply(EXP1, EXP2))
end)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 12, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (divide(EXP1, EXP2))
end)
 in ( LrTable.NT 0, ( result, EXP1left, EXP2right), rest671)
end
|  ( 13, ( ( _, ( _, _, RPAREN1right)) :: ( _, ( MlyValue.EXP EXP1, _,
 _)) :: ( _, ( _, LPAREN1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  (EXP as EXP1) = EXP1 ()
 in (EXP)
end)
 in ( LrTable.NT 0, ( result, LPAREN1left, RPAREN1right), rest671)
end
| _ => raise (mlyAction i392)
end
val void = MlyValue.VOID
val extract = fn a => (fn MlyValue.START x => x
| _ => let exception ParseInternal
	in raise ParseInternal end) a ()
end
end
structure Tokens : Calc_TOKENS =
struct
type svalue = ParserData.svalue
type ('a,'b) token = ('a,'b) Token.token
fun ID (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 0,(
ParserData.MlyValue.ID (fn () => i),p1,p2))
fun NUM (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 1,(
ParserData.MlyValue.NUM (fn () => i),p1,p2))
fun PLUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 2,(
ParserData.MlyValue.VOID,p1,p2))
fun TIMES (p1,p2) = Token.TOKEN (ParserData.LrTable.T 3,(
ParserData.MlyValue.VOID,p1,p2))
fun PRINT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 4,(
ParserData.MlyValue.VOID,p1,p2))
fun SEMI (p1,p2) = Token.TOKEN (ParserData.LrTable.T 5,(
ParserData.MlyValue.VOID,p1,p2))
fun EOF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 6,(
ParserData.MlyValue.VOID,p1,p2))
fun DIV (p1,p2) = Token.TOKEN (ParserData.LrTable.T 7,(
ParserData.MlyValue.VOID,p1,p2))
fun SUB (p1,p2) = Token.TOKEN (ParserData.LrTable.T 8,(
ParserData.MlyValue.VOID,p1,p2))
fun RATIONAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 9,(
ParserData.MlyValue.VOID,p1,p2))
fun DECIMAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 10,(
ParserData.MlyValue.VOID,p1,p2))
fun LPAREN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 11,(
ParserData.MlyValue.VOID,p1,p2))
fun RPAREN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 12,(
ParserData.MlyValue.VOID,p1,p2))
fun EQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 13,(
ParserData.MlyValue.VOID,p1,p2))
fun LESS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 14,(
ParserData.MlyValue.VOID,p1,p2))
fun GREATER (p1,p2) = Token.TOKEN (ParserData.LrTable.T 15,(
ParserData.MlyValue.VOID,p1,p2))
fun ASSIGN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 16,(
ParserData.MlyValue.VOID,p1,p2))
end
end
