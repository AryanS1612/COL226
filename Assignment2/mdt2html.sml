(* 
Features to be accounted for:
    (e) Every > represents start of blockquote.
*)

fun charListToString charList =
    let
        fun loop [] acc = acc
          | loop (c :: cs) acc = loop cs (acc ^ (String.str c))
    in
        loop charList ""
    end;

fun reverse(num : char list, ans : char list) = 
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

fun get_html_name(name : char list) = 
    let 
        val temp = reverse(name,[])
        val temp = tl(temp)
        val temp = tl(temp)
        val temp = tl(temp)
        val temp = [#"l",#"m",#"t",#"h"]@temp
        val temp = reverse(temp,[])
    in
        temp
    end

fun read_file(file_ptr : TextIO.instream) =
    case TextIO.inputLine file_ptr of
      NONE => []
    | SOME line => (explode line) @ read_file(file_ptr);

fun write_file(file_ptr : TextIO.outstream, char_list : char list) =
    if null char_list then
        (TextIO.closeOut file_ptr; [])
    else
        let 
            val c = hd(char_list)
            val temp = TextIO.output(file_ptr, String.str c)
            (* val vec = Vector.fromList [c] *)
        in 
            write_file(file_ptr, tl(char_list))
        end
        
fun process_till_robracket(file : char list, name : char list) = 
    let
        val c = hd(file)
    in 
        if(c = #")") then
            (tl(file), name)
        else
            process_till_robracket(tl(file), c::name)
    end

fun process_till_sqbracket(file : char list, name : char list) = 
    let
        val c = hd(file)
    in
        if(c = #"]") then
            (tl(file),name)
        else
            process_till_sqbracket(tl(file), c::name)
    end

fun process_link(file : char list) = 
    let 
        val (a, b) = process_till_sqbracket(file, [])
        val (c, d) = process_till_robracket(tl(a), []) 
    in
        (c, b, d)
    end

fun check_name(name1 : char list, name2 : char list, len : int) = 
    if(len = 0) then
        true
    else
        let 
            val a = hd(name1)
            val b = hd(name2)
        in
            if(a = b) then
                check_name(tl(name1), tl(name2), len-1)
            else 
                false
        end

fun get_name(file : char list, len : int, name : char list) = 
    if null file then
        if (len = 0) then
            (true, name)
        else
            (false, [])
    else
        if (len = 0) then   
            (true, name)
        else
            get_name(tl(file), len-1, hd(file) :: name)

fun check_link(file : char list) = 
    let 
        val (a, b) = get_name(file, 4, [])
    in
        if a then
            if check_name(b, [#"p", #"t", #"t", #"h"], 4) then
                true
            else
                false
        else
            false
    end

fun link_simple(file : char list, link : char list) = 
    let 
        val c = hd(file)
    in
        if(c = #">") then
            (tl(file), link)
        else 
            link_simple(tl(file), c::link)
    end

fun remove_space(file : char list) = 
    let 
        val c = hd(file)
    in  
        if (c = #" ") orelse (c = #"\t") then   
            remove_space(tl file)
        else
            ([#"\n"]@file, c)
    end

fun check_for_table(file : char list) = 
    let 
        val (a,b) = get_name(file, 3, [])
    in
        if a then
            if check_name(b, [#"\n",#"<",#"<"], 3) then
                true
            else
                false
        else
            false
    end

fun remove_chars(file : char list, count : int) = 
    if (count = 0) then
        file
    else
        remove_chars(tl file, count-1)

fun correct_space(file : char list) = 
    if(hd file = #" ") orelse (hd file = #"\t") then
        correct_space(tl file)
    else
        file

fun table_started(file : char list, ans : char list) = 
    let 
        val c = hd(file)
        val c_next = hd(tl(file))
    in
        if(c = #"|") then
            table_started(tl file, [#">",#"D",#"T",#"<",#">",#"D",#"T",#"/",#"<"]@ans)
        else if (c = #"\n") then
            table_started(tl file, [#">",#"D",#"T",#"<",#">",#"R",#"T",#"<",#"\n",#">",#"R",#"T",#"/",#"<",#">",#"D",#"T",#"/",#"<"]@ans)
        else if (c = #">") then
            if(c_next = #">") then
                let
                    val temp = "</TABLE></CENTER>"
                    val temp  = explode temp
                in
                    (tl(tl file), reverse(temp, [])@remove_chars(correct_space(ans), 8))
                end
            else
                table_started(tl file, c::ans)
        else
            table_started(tl file, c::ans)
    end

fun process_table(file : char list, ans : char list) = 
    if null file then 
        ans
    else
        if check_for_table(file) then
            let
                val temp = "<CENTER><TABLE border=\"1\">"
                val temp  = explode temp
                val temp1 = "<TR><TD>"
                val temp1 = explode temp1
                val (a, b) = table_started(tl(tl(tl(file))), reverse(temp1, [])@[#"\n"]@reverse(temp, []))
            in
                process_table(a, b@ans)
            end
        else
            process_table(tl file, (hd file)::ans)

fun process(file : char list, bold : bool, under : bool, italic : bool, ruling : int, heading : int, ans : char list) = 
    if null file then
        reverse([#">",#"p",#"/",#"<"]@ans, [])
    else if null(tl(file)) then 
            let
                val c = hd(file)
            in
                if(c = #"*") then
                    if italic then
                        process(tl(file), bold, under, false, ruling, heading, [#">",#"m",#"e",#"/",#"<"]@ans)
                    else
                        process(tl(file), bold, under, italic, ruling, heading, c::ans)
                else
                    process(tl(file), bold, under, italic, ruling, heading, c::ans)
            end
    else
        let 
            val c = hd(file)
            val c_next = hd(tl(file))
        in
            if (c = #"-") then
                if (ruling = 0) then 
                    process(tl(file), bold, under, italic, ruling+1, heading, ans)
                else if (ruling = 1) then
                    process(tl(file), bold, under, italic, ruling+1, heading, ans)
                else if (ruling = 2) then
                    process(tl(file), bold, under, italic, ruling+1, heading, [#">",#"r",#"h",#"<"]@ans)
                else 
                    process(tl(file), bold, under, italic, ruling, heading, ans)
            else if (ruling > 0) then
                if (ruling = 1) then 
                    process(file, bold, under, italic, 0, heading, [#"-"]@ans)
                else if (ruling = 2) then
                    process(file, bold, under, italic, 0, heading, [#"-",#"-"]@ans)
                else
                    process(file, bold, under, italic, 0, heading, ans)
            else if (c = #"#") then
                if (c_next = #"#") then
                    process(tl(file), bold, under, italic, ruling, heading+1, ans)
                else
                    process(tl(file), bold, under, italic, ruling, heading + 1, [#">",Char.chr (heading+49),#"h",#"<"]@ans)
            else if(c = #"*") then
                if(c_next = #"*") then
                    if bold then
                        process(tl(tl(file)), false, under, italic, ruling, heading, [#">",#"b",#"/",#"<"]@ans)
                    else
                        process(tl(tl(file)), true, under, italic, ruling, heading, [#">",#"b",#"<"]@ans)
                else
                    if italic then
                        process(tl(file), bold, under, false, ruling, heading, [#">",#"m",#"e",#"/",#"<"]@ans)
                    else
                        process(tl(file), bold, under, true, ruling, heading, [#">",#"m",#"e",#"<"]@ans)
            else if (c = #"_") then
                if under then
                    if(c_next = #" ") then
                        process(tl(tl(file)), bold, false, italic, ruling, heading, [#">",#"u",#"/",#"<"]@ans)
                    else
                        process(tl(tl(file)), bold, true, italic, ruling, heading, [c_next,#" "]@ans)
                else
                    process(tl(file), bold, true, italic, ruling, heading, [#">",#"u",#"<"]@ans)
            else if (c = #"\n") then
                let
                    val (file, c_next) = remove_space(tl file)
                in
                    if (c_next = #"\n") then
                        if(heading > 0) then
                            process(tl(file), bold, under, italic, ruling, 0, [#">",#"p",#"<",#"\n",#">",#"p",#"/",#"<",#">",Char.chr (heading+48),#"h",#"/",#"<"]@ans)
                        else
                            process(tl(tl(file)), bold, under, italic, ruling, heading, [#">",#"p",#"<",#"\n",#">",#"p",#"/",#"<"]@ans)
                    else 
                        if (heading > 0) then
                            process(tl(file), bold, under, italic, ruling, heading, [c,#">",Char.chr (heading+48),#"h",#"/",#"<"]@ans)
                        else
                            process(tl(file), bold, under, italic, ruling, heading, c::ans)
                end
            else if (c = #"[") then
                let 
                    val (new_file, name, link) = process_link(tl(file))
                in
                    process(new_file, bold, under, italic, ruling, heading, [#">",#"a",#"/",#"<"]@name@[#">",#"\""]@link@[#"\"",#"=",#"f",#"e",#"r",#"h", #" ", #"a",#"<"]@ans)
                end
            else if (c = #"<") then
                if(check_link(tl(file))) then
                    let
                        val (new_file, link) = link_simple(tl(file), [])
                    in
                        process(new_file, bold, under, italic, ruling, heading, [#">",#"a",#"/",#"<"]@link@[#">",#"\""]@link@[#"\"",#"=",#"f",#"e",#"r",#"h", #" ", #"a",#"<"]@ans)
                    end
                else
                    process(tl(tl(file)), bold, under, italic, ruling, heading, c_next::c::ans)
            else if (c = #"\\") then
                process(tl(tl(file)), bold, under, italic, ruling, heading, c_next::ans)
            else 
                process(tl(file), bold, under, italic, ruling, heading, c::ans)
        end

fun mdt2html(name : string) = 
    let
        val char_name = explode name
        val char_name = get_html_name char_name
        val out_string = charListToString(char_name)
        val file_ptr = TextIO.openIn name
        val char_list = read_file(file_ptr)
        val out_ptr = TextIO.openOut out_string
        val char_list = process_table(char_list, [])
        val html_list = process(reverse(char_list, []), false, false, false, 0, 0,[#">",#"p",#"<"])
        val var = write_file(out_ptr, html_list)
    in
        []
    end