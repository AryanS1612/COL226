signature BIGINT = 
    sig
        type bigint
        exception BIGINTerror 
        val identity : bigint
        val zero : bigint
        val make_int : string -> bigint
        val addi : bigint * bigint -> bigint
        val sub : bigint * bigint -> bigint
        val mul : bigint * bigint -> bigint
        val divi : bigint * bigint -> bigint
        val equali : bigint * bigint -> bool (* checks equality *)
        val lessi : bigint * bigint -> bool (* returns true if first argument less than second argument *)
        val negi : bigint -> bigint (* returns -a *)
        val remi : bigint * bigint -> bigint (* returns the remainder of a when divided by b *)
        val gcd : bigint * bigint -> bigint
        val showint : bigint -> string
        val leftshift : bigint -> bigint
end

structure BigInt : BIGINT = 

struct
    
    type bigint = int list;

    exception BIGINTerror;

    val identity : bigint = [1]

    val zero : bigint = []

    fun make_int_help(a : char list, b : int list) = 
        if (null a) then
            b
        else if((ord(hd a) - ord#"0") > ~1) andalso ((ord(hd a) - ord#"0") < 10) then
            make_int_help(tl a,(ord(hd a) - ord#"0") :: b)
        else 
            make_int_help(tl a, b)


    fun remove_zeros(num : int list) = 
        if null num then
            []
        else
            if(hd num = 0) then
                remove_zeros(tl num)
            else
                num

    fun reverse_help(num : int list, ans : int list) = 
    (* Reverse a list *)
        if null num then 
            ans
        else 
            let 
                val a = hd num
                val num = tl num
                val ans = a :: ans
            in 
                reverse_help(num, ans)
            end;   

    fun reverse(num : int list) = 
    (* Reverse a list *)
        reverse_help(num, [])

    fun neg_cascade(num : int list, ans : int list) = 
        if null num then
            remove_zeros(ans)
        else
            if null (tl num) then
                let
                    val a = hd num
                    val rem  = if ((a mod 10) > 0) then (a mod 10) - 10 else (a mod 10)
                    val toadd = (a-rem) div 10
                in
                    if(toadd = 0) then
                        neg_cascade(tl num, rem :: ans)
                    else
                        neg_cascade(toadd :: (tl num), rem :: ans)
                end
            else
                let
                    val a = hd num
                    val rem  = if ((a mod 10) > 0) then (a mod 10) - 10 else (a mod 10)
                    val toadd = (a-rem) div 10
                    val nxt = hd ( tl num)
                in 
                    neg_cascade((nxt + toadd) :: tl(tl num), rem :: ans)
                end

    fun pos_cascade(num : int list, ans : int list) = 
        if null num then
            remove_zeros(ans)
        else
            if null (tl num) then
                let
                    val a = hd num
                    val rem  = a mod 10
                    val toadd = (a-rem) div 10
                in
                    if(toadd = 0) then
                        pos_cascade(tl num, rem :: ans)
                    else
                        pos_cascade(toadd :: (tl num), rem :: ans)
                end
            else
                let
                    val a = hd num
                    val rem  = a mod 10
                    val toadd = (a-rem) div 10
                    val nxt = hd ( tl num)
                in 
                    pos_cascade((nxt + toadd) :: tl(tl num), rem :: ans)
                end


    fun cascade(num : int list) = 
    (* it is assumed that the input list does not have any leading zeros *)
        if null num  then
            []
        else 
            if(hd num < 0) then
                neg_cascade(reverse(num), [])
            else 
                pos_cascade(reverse(num), [])

    fun check_ineq_help(a : int list, b : int list) = 
        if (null a andalso null b) then
            true
        else
            let     
                val x = hd a
                val y = hd b
                val a = tl a
                val b = tl b
            in 
                (x > y) orelse ((x = y) andalso check_ineq_help(a, b))
            end

    fun check_ineq(a : int list, b : int list) = 
    (* checks for inequality between a and b, evaluates to true if a >= b else false *)
        let
            val lena = length a
            val lenb = length b
        in 
            if((lena > lenb) orelse ((lena = lenb) andalso check_ineq_help(a, b))) then
                true
            else
                false
        end

    fun add_help(a : int list, b : int list, ans : int list) = 
        if null a then
            if null b then
                ans
            else
                add_help(a, tl b, hd b :: ans)
        else
            if null b then
                add_help(tl a, b, hd a :: ans)
            else
                add_help(tl a, tl b, ((hd a) + (hd b)) :: ans)

    fun sub_help(a : int list, b : int list, ans : int list) = 
        if null a then
            if null b then
                ans
            else
                sub_help(a, tl b, (0-(hd b)) :: ans)
        else
            if null b then
                sub_help(tl a, b, hd a :: ans)
            else
                sub_help(tl a, tl b, ((hd a) - (hd b)) :: ans)

    fun singlemul(num : int list, a : int, ans : int list) =
        if null num then
            cascade(ans)
        else
            singlemul(tl num, a, ((hd num)*a) :: ans)

    fun addi(a : bigint, b : bigint) = 
        cascade(remove_zeros(add_help(reverse(a), reverse(b), [])))

    fun sub(a : bigint, b : bigint) = 
        cascade(remove_zeros(sub_help(reverse(a), reverse(b), [])))

    fun negi(a : bigint) = 
        sub(zero, a)

    fun mul_help(a : int list, b : int list, ans : int list) = 
        if null b then
            ans
        else
            let 
                val prod = hd b
            in
                mul_help(0 :: a, tl b, addi(singlemul(a, prod, []), ans))
            end

    fun mul(a : bigint, b : bigint) =
        mul_help(reverse(a), reverse(b), [])

    fun find_match(a : int list, b : int, match : int list) = 
        let 
            val x = check_ineq(match, singlemul(a, b, []))
        in
            if x then   
                b
            else
                find_match(a,b-1,match)
        end

    fun lesszero(a : int list) = 
        if(a = zero) then
            false
        else
            if(hd a < 0) then
                true
            else 
                false

    fun div_help(a : int list, b : int list, rem : int list, ans : int list) = 
        if null a then
            remove_zeros(reverse(ans))
        else
            let
                val rem = hd(a) :: rem
                val rem = reverse(rem)
                val match = find_match(b, 9, rem)
                val rem = reverse(sub(rem, singlemul(b, match, [])))
            in  
                div_help(tl a, b, rem, match :: ans)
            end

    fun remain_help(a : int list, b : int list, rem : int list) = 
        if null a then
            remove_zeros(reverse(rem))
        else
            let
                val rem = hd(a) :: rem
                val rem = reverse(rem)
                val match = find_match(b, 9, rem)
                val rem = reverse(sub(rem, singlemul(b, match, [])))
            in  
                remain_help(tl a, b, rem)
            end

    fun divi(a : bigint, b : bigint) = 
        if(remove_zeros(b) = zero) then
            raise BIGINTerror
        else
            if(lesszero(a)) then
                if(lesszero(b)) then
                    div_help(negi(a), reverse(negi(b)), [], [])
                else
                    negi(div_help(negi(a), reverse(b), [], []))
            else
                if(lesszero(b)) then
                    negi(div_help(a, reverse(negi(b)), [], []))
                else
                    div_help(a, reverse(b), [], [])

    fun remi(a : bigint, b : bigint) = 
        remain_help(a, reverse(b), [])

    fun equali(a : bigint, b : bigint) = 
        if(sub(a, b) = zero) then
            true
        else
            false

    fun lessi(a : bigint, b : bigint) = 
        if(lesszero(a)) then
            if(lesszero(b)) then
                check_ineq(negi(a), negi(b))
            else
                true
        else
            if(lesszero(b)) then
                false
            else
                not(check_ineq(a, b))

    fun gcd_help(a : bigint, b : bigint) = 
        if (a = zero) then
            if (b = zero) then
                raise BIGINTerror
            else
                b
        else 
            if (b = zero) then
                a
            else 
                gcd_help(b, remi(a, b))

    fun gcd(a : int list, b : int list) =
        if(lesszero(a)) then
            if(lesszero(b)) then
                negi(gcd_help(negi(a), negi(b)))
            else
                gcd_help(negi(a), b)
        else    
            if(lesszero(b)) then
                gcd_help(a, negi(b))
            else
                gcd_help(a, b)

    fun make_int(a : string) = 
        let 
            val char_list = explode a
        in
            if(hd char_list = #"~") then
                negi(remove_zeros(reverse(make_int_help(tl char_list, []))))
            else
                remove_zeros(reverse(make_int_help(char_list, [])))
        end

    fun showint(a : bigint) =
        if(a = zero) then
            "0"
        else    
            if(hd a < 0) then
                let
                    val a = negi(a)
                in
                    "~"^showint(a)
                end
            else
                List.foldr (fn (x,y) => x^y) "" (List.map Int.toString(a))

    fun leftshift(a : bigint) =
        a @ [0]
end;

open BigInt;

fun cmdLine() =
    let val a = valOf(TextIO.inputLine TextIO.stdIn)
    in
        make_int(a)
    end;