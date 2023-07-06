structure Evaluator = struct
    open AST;
    open Table;
    val file : TextIO.outstream option ref = ref NONE;

    fun reverse(a : char list, b : char list) = 
        if( null a ) then           
            b
        else 
            reverse(tl a, (hd a) :: b) 

    fun clean(a : char list , b: char list ) =
        if( null a ) then
            String.implode(reverse(b, []))
        else if (hd(a) = #"\n") orelse (hd(a) = #" ") orelse (hd(a) = #"\t") then
            clean(tl a, b)
        else 
            clean(tl a, (hd a):: b)

    fun AddInttoTable(ls) =
        if not(null ls) then 
            let
                val i = make_int("0")
            in
                (((update(hd ls, IntVal i); AddInttoTable(tl ls))))
            end
        else 
            ()

    fun AddRattoTable(ls) = 
        if not(null ls) then 
            let
                val i = fromDecimal("0.(0)")
            in
                (((update(hd ls, RatVal i); AddRattoTable(tl ls))))
            end
        else 
            ()

    fun AddBooltoTable(ls) = 
        if not(null ls) then 
            (((update(hd ls, BoolVal false); AddBooltoTable(tl ls))))
        else 
            ()

    fun evalBinExp(node1, optr, node2) = 
        case (optr, node1, node2) of
            (IntAdd, IntVal Int1, IntVal Int2) => (IntVal (addi(Int1, Int2)))
        | (IntSub, IntVal Int1, IntVal Int2) => (IntVal (sub(Int1, Int2)))
        | (IntMul, IntVal Int1, IntVal Int2) => (IntVal (mul(Int1, Int2)))
        | (IntDiv, IntVal Int1, IntVal Int2) => (IntVal (divi(Int1, Int2)))
        | (IntMod, IntVal Int1, IntVal Int2) => (IntVal (remi(Int1, Int2)))
        | (MakeRat, IntVal Int1, IntVal Int2) => (RatVal (make_rat(Int1, Int2)))
        | (Equal, IntVal Int1, IntVal Int2) =>  (BoolVal (equali(Int1, Int2)))
        | (Equal, BoolVal Bool1, BoolVal Bool2) => (BoolVal (Bool1 = Bool2))
        | (Equal, RatVal Rat1, RatVal Rat2) =>  (BoolVal (equal(Rat1, Rat2)))
        | (NotEqual, IntVal Int1, IntVal Int2) =>  (BoolVal (not(equali(Int1, Int2))))
        | (NotEqual, BoolVal Bool1, BoolVal Bool2) => (BoolVal (not(Bool1 = Bool2)))
        | (NotEqual, RatVal Rat1, RatVal Rat2) =>  (BoolVal (not(equal(Rat1, Rat2))))
        | (LT, IntVal Int1, IntVal Int2)=> (BoolVal (lessi(Int1, Int2)))
        | (LTE, IntVal Int1, IntVal Int2)=> (BoolVal (lessi(Int1, Int2) orelse equali(Int1, Int2)))
        | (GT, IntVal Int1, IntVal Int2) => (BoolVal (lessi(Int2, Int1)))
        | (GTE, IntVal Int1, IntVal Int2) => (BoolVal (lessi(Int2, Int1) orelse equali(Int1, Int2)))
        | (LT, RatVal Rat1, RatVal Rat2)=> (BoolVal (less(Rat1, Rat2)))
        | (LTE, RatVal Rat1, RatVal Rat2)=> (BoolVal (less(Rat1, Rat2) orelse equal(Rat1, Rat2)))
        | (GT, RatVal Rat1, RatVal Rat2) => (BoolVal (less(Rat2, Rat1)))
        | (GTE, RatVal Rat1, RatVal Rat2) => (BoolVal (less(Rat2, Rat1) orelse equal(Rat1, Rat2)))
        | (RatAdd, RatVal Rat1, RatVal Rat2) => (RatVal (R.add(Rat1, Rat2)))
        | (RatSub, RatVal Rat1, RatVal Rat2) => (RatVal (subtract(Rat1, Rat2)))
        | (RatMul, RatVal Rat1, RatVal Rat2) => (RatVal (multiply(Rat1, Rat2)))
        | (RatDiv, RatVal Rat1, RatVal Rat2) => (RatVal (divide(Rat1, Rat2)))
        | (And, BoolVal Bool1, BoolVal Bool2) => (BoolVal ((Bool1) andalso Bool2))
        | (Or, BoolVal Bool1, BoolVal Bool2) => (BoolVal ((Bool1) orelse Bool2))
        | _ =>  raise Fail "***ERROR : Wrong Type Assignment***"

    and evalUniExp(optr, node) = 
        case (optr, node) of
            (Neg, RatVal Rat) => RatVal (neg(Rat))
          | (RatInv, RatVal Rat) => RatVal (inverse(Rat))
          | (Neg, IntVal Int) => IntVal (negi(Int))
          | (BoolNeg, BoolVal Bool) => BoolVal (not(Bool))
          | (FromDecimal, RatVal Rat) => RatVal(Rat)

    and evalExp(node : exp) = 
        case node of 
            IntExp i   => (IntVal i)
            | BoolExp i => (BoolVal i)
            | RatExp i => (RatVal i) 
            | VarExp i => find(i)
            | BinExp(node1, binoptr, node2) => evalBinExp(evalExp(node1), binoptr, evalExp(node2))
            | UniExp(unioptr, node1) => evalUniExp(unioptr, evalExp(node1))


    and evalcmd(node : cmd) = 
    (* (TextIO.output(TextIO.stdOut, "hi"); *)
        case node of 
            multicmd(node1, node2) => (evalcmd(node1); evalcmd(node2))
        | nullcmd(node1) => ()
        | WhileCmd(node1, node2) => evalWhileCmd(node1, node2)
        | IteCmd(node1, node2, node3) => 
        (
            case evalExp(node1) of
                BoolVal i => if(i) then evalcmd(node2) else evalcmd(node3)
        )
        | AssignCmd(identifier, bincmdoptr, exp) => (update(identifier, evalExp(exp)))
        | UniOpCmd(cmdunioptr, exp) => evalUniOpCmd(cmdunioptr, exp)

    and evalWhileCmd(node1, node2) = 
        case evalExp(node1) of
            BoolVal i => if(i) then (evalcmd(node2); evalWhileCmd(node1, node2)) else ()
          | _ => raise Fail "***ERROR : Incorrect type of expression after while***"

    and evalUniOpCmd(cmdunioptr, node) = 
        case cmdunioptr of 
            Print => 
            (
                case evalExp(node) of 
                    IntVal i => TextIO.output(valOf(!file), showint(i)^"\n")
                  | BoolVal i => TextIO.output(valOf(!file), if(i) then "tt\n" else "ff\n")
                  | RatVal i => TextIO.output(valOf(!file), showDecimal(i)^"\n")
                  | _ => raise Fail "***ERROR : Invalid argument to Print***"
            )
          | Call => 
          (
                case evalExp(node) of
                ProcVal node1 =>  (beginproc();evalBlock(node1);endproc())
                | _ => raise Fail "***ERROR : Invalid argument to Call***"
          )
          | Read =>
          (  
                case (node, evalExp(node)) of 
                    (VarExp i, IntVal j) => 
                    (
                        let 
                            val a = valOf(TextIO.inputLine TextIO.stdIn)
                        in
                            update(i, IntVal(make_int(a)))
                        end
                    )
                  | (VarExp i, BoolVal j) =>
                  (
                    let 
                        val a = clean(explode(valOf(TextIO.inputLine TextIO.stdIn)), [])
                    in
                        if(a = "tt") then
                            update(i, BoolVal true)
                        else 
                            update(i, BoolVal false)
                    end
                  ) 
                  | (VarExp i, RatVal j) => 
                  (
                    let
                        val a = valOf(TextIO.inputLine TextIO.stdIn)
                    in
                        update(i, RatVal(fromDecimal(a)))
                    end
                  )
                  | _ => raise Fail "***ERROR : Invalid argument to Read***"
          )

    and evalIdent(node) = 
        case node of
            uniident(identifier, node1) => [identifier]
          | multiident(identifier, node1) => identifier :: evalIdent(node1)

    and evalRatdecls(node) =
        case node of
            ratdecls(node1) => AddRattoTable(evalIdent(node1))
          | nullratdecls(node1) => ()

    and evalIntdecls(node) =
        case node of
            intdecls(node1) => AddInttoTable(evalIdent(node1))
          | nullintdecls(node1) => ()

    and evalBooldecls(node) =
        case node of
            booldecls(node1) => AddBooltoTable(evalIdent(node1))
          | nullbooldecls(node1) => ()

    and evalVardecls(node) =
        case node of 
            vardecls(node1, node2, node3) => (evalRatdecls(node1), evalIntdecls(node2), evalBooldecls(node3))

    and evalprocdecls(node) =
        case node of 
            multiprocdecls(identifier, node1, node2) => (update(identifier, ProcVal node1);evalprocdecls(node2))
          | nullprocdecls(node1) => ()
    
    and evalDecls(node) = 
        (* (TextIO.output(TextIO.stdOut, "hi"); *)
        case node of 
            decls(node1, node2) => (evalVardecls(node1); evalprocdecls(node2))

    and evalBlock(node) = 
        case node of 
            block(node1, node2) => (evalDecls(node1); evalcmd(node2))
        
end