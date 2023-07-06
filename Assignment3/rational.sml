CM.make("$/basis.cm");
CM.make("$/ml-yacc-lib.cm");

use "rational_sig.sml";
open R;
use "calc.yacc.sig";
use "calc.yacc.sml";
use "calc.lex.sml";
use "load-calc.sml";

parse();