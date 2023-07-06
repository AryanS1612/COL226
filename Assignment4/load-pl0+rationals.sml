structure pl0LrVals =
  pl0LrValsFun(structure Token = LrParser.Token)

structure pl0Lex =
  pl0LexFun(structure Tokens = pl0LrVals.Tokens);

structure pl0Parser =
  Join(structure LrParser = LrParser
       structure ParserData = pl0LrVals.ParserData
       structure Lex = pl0Lex)

fun invoke lexstream =
    let fun print_error (s,i:int,_) =
            TextIO.output(TextIO.stdOut,
                          "Error, line " ^ (Int.toString i) ^ ", " ^ s ^ "\n")
     in pl0Parser.parse(0,lexstream,print_error,())
    end


fun parse () = 
    let val lexer = pl0Parser.makeLexer
                      (fn _ => Option.getOpt(TextIO.inputLine TextIO.stdIn, ""))
        val dummyEOF = pl0LrVals.Tokens.EOF(0,0)
        val dummySEMI = pl0LrVals.Tokens.SEMI(0,0)
        fun loop lexer =
            let val (result,lexer) = invoke lexer
                val (nextToken,lexer) = pl0Parser.Stream.get lexer
             in case result
                  of r =>
                      TextIO.output(TextIO.stdOut,
                            r ^ "\n");
                if pl0Parser.sameToken(nextToken,dummyEOF) then ()
                else loop lexer
            end
     in loop lexer
    end