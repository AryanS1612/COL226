CM.make("$/basis.cm");
CM.make("$/ml-yacc-lib.cm");

use "rational.sml";
open R;
open I;
use "AST.sml";
open AST;
use "SymbolTable.sml";
open Table;
use "pl0.yacc.sig";
use "pl0.yacc.sml";
use "pl0.lex.sml";
use "load.sml";
Control.Print.printLength := 1000; (* set printing parameters so that *)
Control.Print.printDepth := 1000; (* we’ll see all details of parse trees *)
Control.Print.stringDepth := 1000; (* and strings *)
open pl0;
use "evaluator.sml";
open Evaluator;
fun interpret(a : string, b : string) = 
    (file := SOME(TextIO.openOut b);
    evalBlock(parseFile(a)); TextIO.closeOut(valOf(!file)))
(* parseFile("f.txt"); *)