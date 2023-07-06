(* use "rational.sml";
use "BIGINT.sml";
use "AST.sml";
open I; open R;
open AST; *)

(* Idea is to have a relating table which tells which scope has which parent scope, and another stack for when the calls are made *)



structure Table = 
struct

  datatype typ = RatVal of rational
               | IntVal of bigint
               | ProcVal of Block
               | BoolVal of bool

  type scope = string*typ*string

  type callStack = string list

  val ProcTable : table list list ref = ref []

  val env : table list ref = ref []

  exception NotFound

  fun getTable() = 
    let
      fun help(ls) = 
        if not(null ls) then
          (
            case (hd ls) of 
                (str, IntVal i) => (TextIO.output(TextIO.stdOut, str^" : ");TextIO.output(TextIO.stdOut, showint(i)^"\n"); help(tl ls))
              | (str, BoolVal i) => (TextIO.output(TextIO.stdOut, str^" : ");TextIO.output(TextIO.stdOut, if(i) then "tt\n" else "ff\n"); help(tl ls))
              | (str, RatVal i )=> (TextIO.output(TextIO.stdOut, str^" : ");TextIO.output(TextIO.stdOut, showDecimal(i)^"\n"); help(tl ls))
              | (str, ProcVal i) => (TextIO.output(TextIO.stdOut, str^" : ");TextIO.output(TextIO.stdOut, "Block\n"); help(tl ls))
          )
        else 
          ()

      fun mulhelp(ls) = 
        if not(null ls) then
          (TextIO.output(TextIO.stdOut, "Environment Begins\n"); help(hd ls); TextIO.output(TextIO.stdOut, "Environment Ends\n"); mulhelp(tl ls))
        else 
          ()
      in
        (TextIO.output(TextIO.stdOut, "Printing Environments\n"); mulhelp(!env :: !ProcTable); TextIO.output(TextIO.stdOut, "Printing Ends\n"))
      end


  fun exists(ls : table list, name : string) =
      List.exists (fn (n, v) => (n = name)) ls

  fun lookup(dict : table list, name : string) =
      if(null dict) then
        raise NotFound
      else if(#1 (hd(dict)) = name) then
        #2(hd(dict))
      else 
        lookup(tl dict, name)

  fun recexists(ls : table list list, name : string) = 
    if(null ls) then
      false
    else 
      exists(hd ls, name) orelse recexists(tl ls, name)

  fun recfind(ls, name) = 
    if(null ls) then
        raise NotFound
    else if(exists(hd(ls), name)) then
      lookup(hd ls, name)
    else 
      recfind(tl ls, name)

  fun find(name) = 
    recfind(!env :: !ProcTable, name)

  fun add(name : string, value : typ, finder : table list) = 
    (name, value) :: finder

  fun remove(name : string, finder : table list, answer : table list) = 
    if(#1(hd(finder)) = name) then 
      (tl finder)@answer
    else
      remove(name, tl finder, (hd finder):: answer)

  fun reverse(ls : table list list, answer : table list list) = 
    if (null ls) then 
      answer
    else  
      reverse(tl ls, (hd ls) :: answer)

  fun recupdate(name : string, value : typ, ls : table list list, ans : table list list) = 
    if(exists(hd ls, name)) then
      let
        val a = remove(name, hd ls, [])
        val b = add(name, value, a)
      in
        (reverse(b :: ans, [])) @ (tl ls)
      end
    else 
      let val a = hd ls
      in
        recupdate(name, value, tl ls, a :: ans)
      end

  fun newadd(name, value) = 
    env := (name, value) :: !env

  fun update(name : string, value : typ) =
    if(recexists(!env :: !ProcTable, name)) then
      let val a = recupdate(name, value, !env :: !ProcTable, [])
      in
        (env := hd a; ProcTable := tl a)
      end
    else
      env := (name, value) :: !env  

  fun beginproc() = 
    (ProcTable := (!env) :: (!ProcTable); env := [])

  fun endproc() = 
    (env  := hd(!ProcTable); ProcTable := tl(!ProcTable))

end;

(* open Table; *)