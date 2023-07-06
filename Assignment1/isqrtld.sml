fun remove_zeros(a : int list) = 
(* Removes leading zeros *)
    if (null a) then
        a
    else
        let 
            val x = hd a
            val b = tl a
        in
            if (x = 0) then
                remove_zeros(b)
            else
                a
        end;

fun reverse(num : int list, ans : int list) = 
(* Reverse a list *)
    if null num then 
        ans
    else 
        let 
            val a = hd num
            val num = tl num
            val ans = a :: ans
        in 
            reverse(num, ans)
        end;       

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
        end;

fun check_ineq(a : int list, b : int list) = 
(* checks for inequality between a and b, evaluates to true if a >= b else false *)
    let
        val lena = length a
        val lenb = length b
    in 
        (lena > lenb) orelse ((lena = lenb) andalso check_ineq_help(a, b))
    end;

fun mult_list_int_help(num : int list, b : int, c : int, ans : int list) = 
    if null num then
        if (c = 0) then
            ans
        else 
            c :: ans
    else
        let 
            val a = hd num
            val num = tl num
            val ans = (((a*b) + c) mod 10) :: ans
            val c = ((a*b) + c) div 10
        in 
            mult_list_int_help(num, b, c, ans)
        end;

fun mult_list_int(num : int list, b : int, c : int, ans : int list) = 
(* Multiplies list with an integer *)
    let 
        val num = reverse(num,[])
        val num = b :: num
    in
        if (b = 0) then
            []
        else
            mult_list_int_help(num, b, c, ans)
    end;

fun add_help(num : int list, c : int, ans : int list) = 
    if null num then
        if (c = 0) then 
            ans
        else
            c :: ans
    else
        let
            val a = hd num
            val num = tl num
            val ans =  ((a+c) mod 10) :: ans
            val c  = (a+c) div 10
        in 
            add_help(num, c, ans)
        end;

fun add(num : int list, b : int, c : int, ans : int list) = 
(* adds list with a single digit integer *)
    let 
        val num = reverse(num, [])
        val d = hd num
        val num = tl num
        val carry = (d+b+c) div 10
        val dig = (d+b+c) mod 10
        val ans = [dig]
    in 
        add_help(num, carry, ans)
    end;

fun sub_help(a : int list, b : int list, c : int, ans : int list) = 
    if null b then
        if null a then
            ans
        else
            sub_help(tl a, b, 0, ((hd a)-c) :: ans)
    else
        let 
            val x = hd a
            val y = hd b
            val carry = if (x = 0) andalso (c = 1) then 1 else 0
            val x = if (x = 0) andalso (c = 1) then 9 else x-c
            val a = tl a
            val b = tl b
        in
            if(x >= y) then
                sub_help(a, b, carry, (x-y) :: ans)
            else
                sub_help(a, b, 1, (10+x-y) :: ans)
        end;

fun sub(a : int list, b: int list) = 
(* subtracts two lists representing numbers *)
    let 
        val a = reverse(a,[])
        val b = reverse(b,[])
    in
        remove_zeros(sub_help(a, b, 0, []))
    end;

fun find_match(a : int list, b : int, match : int list) = 
    let 
        val x = check_ineq(match, mult_list_int(a,b,0,[]))
    in
        if x then   
            b
        else
            find_match(a,b-1,match)
    end;

fun isqrtld_helper(num : int list, rem : int list, isqrt : int list) = 
    if null(num) then
    (* Conversion of list of integers to string *)
        if null(rem) then
            (List.foldr (fn (x,y) => x^y) "" (List.map Int.toString(reverse(isqrt,[]))), "0") 
        else
            (List.foldr (fn (x,y) => x^y) "" (List.map Int.toString(reverse(isqrt,[]))), List.foldr (fn (x,y) => x^y) "" (List.map Int.toString rem))
    else
        let
            val a = hd num
            val num = tl num
            val b = hd num
            val num = tl num
            val ans = mult_list_int_help(isqrt, 2, 0, [])
            val rem = remove_zeros((rem@[a, b]))
            val prod = find_match(ans, 9, rem)
            val rem = sub(rem, mult_list_int(ans, prod, 0, []))
            val isqrt = prod :: isqrt
        in 
            isqrtld_helper(num, rem, isqrt)
        end;

fun isqrtld(num) =   
    let
        val char_list = explode num
        (* Conversion of string to list of integers *)
        val num_list = List.map (fn x => ord x - ord #"0") char_list
        val len = length num_list
    in
        if len mod 2 = 0 then
            isqrtld_helper(num_list,[],[])
        else
            let
                val x = find_match([], 9, [hd num_list])
                val rem = sub([hd num_list], mult_list_int([], x, 0, []))
                val num_list = tl num_list
                val isqrt = [x]
            in
                isqrtld_helper(num_list, rem, isqrt)
            end
    end;