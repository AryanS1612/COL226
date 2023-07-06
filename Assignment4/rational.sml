use "BIGINT.sml";
functor MakeRational(BigInt : BIGINT) :
    sig
        type rational
        exception rat_error
        exception brac_error
        exception deci_error
        val make_rat: BigInt.bigint * BigInt.bigint -> rational
        val rat: BigInt.bigint -> rational 
        val reci: BigInt.bigint -> rational 
        val neg: rational -> rational
        val inverse : rational -> rational 
        val equal : rational * rational -> bool (* equality *)
        val less : rational * rational -> bool (* less than *)
        val add : rational * rational -> rational (* addition *)
        val subtract : rational * rational -> rational (* subtraction *)
        val multiply : rational * rational -> rational (* multiplication *)
        val divide : rational * rational -> rational (* division *)
        val showRat : rational -> string
        val showDecimal : rational -> string
        val fromDecimal : string -> rational
        val fromFrac : string -> rational
        val fromInt : string -> rational
    end
=
    struct  
        open BigInt
        type rational = bigint list
        exception rat_error
        exception brac_error
        exception deci_error

        fun reverse_help(num : char list, ans : char list) = 
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

        fun reverse(num : char list) = 
        (* Reverse a list *)
            reverse_help(num, [])

        fun make_rat(a : bigint, b : bigint) = 
            if(equali(b, zero)) then
                raise rat_error
            else
                if(lessi(b, zero)) then
                    make_rat(negi(a), negi(b))
                else 
                    let 
                        val common = gcd(a, b)
                    in
                        if(equali(common, identity)) then
                            [a, b]
                        else
                            [divi(a, common), divi(b, common)]
                    end

        fun rat(a : bigint) = 
            [a, identity]

        fun reci(a : bigint) = 
            if(lessi(a, zero)) then
                [negi(identity), negi(a)]
            else if (equali(a, zero)) then
                raise rat_error
            else
                [identity, a]

        fun neg(a : rational) =
            let 
                val num = hd a
            in 
                negi(num) :: tl a
            end

        fun inverse(a : rational) =
            let 
                val num = hd a
                val den = hd ( tl a)
            in 
                [den, num]
            end

        fun equal(a : rational, b : rational) =
            (equali(hd a, hd b)) andalso (equali(hd(tl a), hd(tl b)))

        fun less(a : rational, b : rational) = 
            lessi(mul(hd a, hd(tl b)), mul(hd(tl a), hd b))

        fun add(a : rational, b : rational) = 
            let 
                val num = addi(mul(hd a, hd(tl b)), mul(hd b, hd(tl a)))
                val den = mul(hd(tl a), hd(tl b))
            in
                make_rat(num, den)
            end

        fun subtract(a : rational, b : rational) = 
            let 
                val num = sub(mul(hd a, hd(tl b)), mul(hd b, hd(tl a)))
                val den = mul(hd(tl a), hd(tl b))
            in
                make_rat(num, den)
            end

        fun multiply(a : rational, b : rational) = 
            let 
                val num = mul(hd a, hd b)
                val den = mul(hd(tl a), hd(tl b))
            in  
                make_rat(num, den)
            end

        fun divide(a : rational, b : rational) = 
            if(equali(hd b, zero)) then
                raise rat_error
            else    
                let
                    val num = mul(hd a, hd(tl b))
                    val den = mul(hd b, hd(tl a))
                in
                    make_rat(num, den)
                end

        fun showRat(a : rational) = 
            if(equali(hd a, zero)) then
                "0/1"
            else
                showint(hd a)^"/"^showint(hd(tl a))
        
        fun check_brac(a : char list, bracopen : int, bracclosed : int) = 
            if null a then
                if (bracopen = 1) andalso (bracclosed = 1) then
                    true
                else 
                    false
            else 
                if(hd a = #"(") then
                    check_brac(tl a, bracopen + 1, bracclosed)
                else if (hd a = #")") then
                    check_brac(tl a, bracopen, bracclosed + 1)
                else
                    check_brac(tl a, bracopen, bracclosed)

        fun check_deci(a : char list, count) = 
            if null a then 
                if(count = 1) then
                    true
                else
                    false
            else
                if(hd a = #".") then
                    check_deci(tl a, count + 1)
                else
                    check_deci(tl a, count)

        fun fromDecimal_help(a : char list, first : char list, second : char list, divfirst : char list, divsecond : char list, deci : bool, brac : bool) = 
            if null a then
                make_rat(sub(make_int(String.implode(reverse(second))), make_int(String.implode(reverse(first)))), sub(make_int(String.implode(reverse(divsecond))), make_int(String.implode(reverse(divfirst)))))
            else
                if(hd a = #"(") then
                    fromDecimal_help(tl a, first, second, divfirst, divsecond, deci, true)
                else if (hd a = #".") then
                    fromDecimal_help(tl a, first, second, divfirst, divsecond, true, brac)
                else if (hd a = #")") then
                    fromDecimal_help(tl a, first, second, divfirst, divsecond, deci, false)
                else
                    if deci then
                        if brac then    
                            fromDecimal_help(tl a, first, (hd a) :: second, divfirst, #"0" :: divsecond, true, true)
                        else
                            fromDecimal_help(tl a, (hd a) :: first, (hd a) :: second, #"0" :: divfirst, #"0" :: divsecond, true, false)
                    else   
                        fromDecimal_help(tl a, (hd a) :: first, (hd a) :: second, divfirst, divsecond, false, brac)
        
            (* reverse(tl(reverse(explode a))) *)

        fun clean(a : char list, b : char list) = 
            if (null a ) then
                reverse(b)
            else if(hd a = #"\t") orelse (hd a = #" ") orelse (hd a = #"\n") then
                clean(tl a, b)
            else 
                clean(tl a, (hd a) :: b)

        fun fromDecimal(a : string) = 
            let 
                val num = clean(explode a, [])
            in
                if(hd num = #"~") then  
                    if(check_brac(tl num, 0, 0)) andalso (check_deci(tl num, 0)) then
                        neg(fromDecimal_help(tl num, [], [], [#"1"], [#"1"], false, false))
                    else 
                        if(check_brac(tl num, 0, 0) = false) then 
                            raise brac_error
                        else
                            raise deci_error
                else
                    fromDecimal_help(num, [], [], [#"1"], [#"1"], false, false)
            end

        fun fromInt(a : string) = 
            make_rat(make_int(a), identity)

        fun check_rep(a : bigint list, b : bigint) = 
            if null a then
                false
            else
                let 
                    val temp = hd a
                in
                    if(equali(temp, b)) then
                        true
                    else
                        check_rep(tl a, b)
                end

        fun remrecur(a : bigint, b : bigint, replist : bigint list, ans : bigint list) =  
            let
                val rem = remi(leftshift(a), b)
            in  
                if(check_rep(replist, a)) then
                    (ans, a, replist)
                else
                    remrecur(rem, b, a :: replist, divi(leftshift(a),b) :: ans)
            end

        fun revlis(a : 'b list, ans : 'b list) = 
            if null a then
                ans
            else
                revlis(tl a, (hd a) :: ans)

        fun getnum(num : bigint list, ans : char list) = 
            if null num then
                implode(revlis(ans, []))
            else
                getnum(tl num, explode(showint(hd num)) @ ans)

        fun getaftdec(num : bigint list, rep : bigint, replist : bigint list, nonrec : bigint list) =
            if equali(rep, hd replist) then
                (getnum(revlis(nonrec, []), []), getnum(num, []))
            else
                let 
                    val x = hd num :: nonrec
                in  
                    getaftdec(tl num, rep, tl replist, x)
                end 

        fun showDecimal_help(a : rational) = 
            let 
                val num = hd a
                val den = hd(tl a)
                val quo = divi(num, den)
                val rem = remi(num, den)
                val res = remrecur(rem, den, [], [])
            in
                (quo, #1(res), #2(res), #3(res))
            end

        fun showDecimal(a : rational) =
            if(less(a, [zero, identity])) then
                let 
                    val a = neg(a)
                    val res = showDecimal_help(a)
                    val befpnt = showint(#1(res))
                    val num =   revlis(#2(res), [])
                    val rep = #3(res)
                    val replist = revlis(#4(res), [])
                    val newres = getaftdec(num, rep, replist, [])
                    val nonrec = #1(newres)
                    val recur = #2(newres)
                in
                    "~"^befpnt^"."^nonrec^"("^recur^")"
                end
            else
                let
                    val res = showDecimal_help(a)
                    val befpnt = showint(#1(res))
                    val num =   revlis(#2(res), [])
                    val rep = #3(res)
                    val replist = revlis(#4(res), [])
                    val newres = getaftdec(num, rep, replist, [])
                    val nonrec = #1(newres)
                    val recur = #2(newres)
                in
                    befpnt^"."^nonrec^"("^recur^")"
                end

        fun sep(a : char list, first : char list) =    
            if(hd a = #"/") then
                (revlis(first, []), tl a)
            else
                sep(tl a, hd a :: first)

        fun fromFrac(a : string) = 
            let
                val charlist = explode a
            in
                if(hd charlist = #"~") then
                    neg(make_rat((make_int(implode(#1(sep(tl charlist, [])))), make_int(implode(#2(sep(tl charlist, [])))))))
                else
                    make_rat((make_int(implode(#1(sep(charlist, [])))), make_int(implode(#2(sep(charlist, []))))))
            end
    end;

structure R = MakeRational(BigInt);
structure I = BigInt;