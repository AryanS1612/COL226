(* use "BIGINT.sml";
use "rational.sml";
open I;
open R; *)

structure AST = struct

    type id = string

    datatype empty = Empty

    datatype binop = IntAdd | IntSub | IntMul | IntDiv | IntMod | Equal | NotEqual | LT
                        | LTE | GT | GTE | RatAdd | RatSub | RatMul | RatDiv | And | Or | MakeRat

    datatype cmdbinop = Assign 

    datatype cmduniop = Print | Call | Read

    datatype uniop = Neg | RatInv | ShowRat | ShowDecimal | FromDecimal | 
                        toDecimal | BoolNeg 


    datatype exp = IntExp of bigint
                 | RatExp of rational
                 | BoolExp of bool
                 | VarExp of id
                 | BinExp of exp*binop*exp
                 | UniExp of uniop*exp
                 | useless of empty

    and cmd =      multicmd of cmd*cmd
                 | nullcmd of empty
                 | WhileCmd of exp*cmd
                 | IteCmd of exp*cmd*cmd
                 | AssignCmd of id*cmdbinop*exp
                 | UniOpCmd of cmduniop*exp

    and ident = uniident of id*empty
              | multiident of id*ident

    and Ratdecls =  ratdecls of ident
                  | nullratdecls of empty

    and Intdecls =  intdecls of ident
                  | nullintdecls of empty

    and Booldecls =  booldecls of ident
                  | nullbooldecls of empty

    and Vardecls = vardecls of Ratdecls*Intdecls*Booldecls

    and procdecls = multiprocdecls of id*Block*procdecls
                  | nullprocdecls of empty
    
    and Decls = decls of Vardecls*procdecls

    and Block = block of Decls*cmd

end
