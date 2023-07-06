structure pl0 = struct
  (* open AST; *)

  structure pl0LrVals =
    pl0LrValsFun(structure Token = LrParser.Token)

  structure pl0Lex =
    pl0LexFun(structure Tokens = pl0LrVals.Tokens);

  structure pl0Parser =
    Join(structure LrParser = LrParser
        structure ParserData = pl0LrVals.ParserData
        structure Lex = pl0Lex)

  val invoke = fn lexstream => (* The invoke function invokes the parser given a lexer *)
    let val print_error = fn (str,pos,_) =>
        TextIO.output(TextIO.stdOut,
          "***pl0 Parser Error at character position " ^ (Int.toString(pos+1))
          ^ "***\n" ^ str^ "\n")
    in pl0Parser.parse(0,lexstream,print_error,())
  end

  fun newLexer fcn = (* newLexer creates a lexer from a given input-reading function *)
    let val lexer = pl0Parser.makeLexer fcn
      (* val _ = pl0Lex.UserDeclarations.init()  *)
    in lexer
  end

  fun stringToLexer str = (* creates a lexer from a string *)
    let val done = ref false
    in newLexer (fn n => if (!done) then " " else (done := true; str))
  end

  fun fileToLexer filename = (* creates a lexer from a file *)
    let val inStream = TextIO.openIn(filename)
    in newLexer (fn n => TextIO.inputAll(inStream))
  end

  fun lexerToParser (lexer) = (* creates a parser from a lexer *)
    let val dummyEOF = pl0LrVals.Tokens.EOF(0,0)
      val (result,lexer) = invoke lexer
      val (nextToken,lexer) = pl0Parser.Stream.get lexer
    in if pl0Parser.sameToken(nextToken,dummyEOF) then
        result
      else (TextIO.output(TextIO.stdOut,
                    "*** INTEXP PARSER WARNING -- unconsumed input ***\n");
                    result)
  end

  fun invoke lexstream =
      let fun print_error (s,i:int,_) =
              TextIO.output(TextIO.stdOut,
                            "Error, line " ^ (Int.toString(i + 1)) ^ ", " ^ s ^ "\n")
      in pl0Parser.parse(0,lexstream,print_error,())
      end

  val parseString = lexerToParser o stringToLexer (* parses a string *)

  val parseFile = lexerToParser o fileToLexer (* parses a file *)

end