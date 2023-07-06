structure Tokens = Tokens

type pos = int
type svalue = Tokens.svalue
type ('a,'b) token = ('a,'b) Tokens.token
type lexresult= (svalue,pos) token

val pos = ref 0
val eof = fn () => Tokens.EOF(!pos,!pos)
val error = fn (e) =>
              print(e)
%%
%header (functor pl0LexFun(structure Tokens: pl0_TOKENS));
all = [A-Za-z0-9];
alpha=[A-Za-z];
digit=[0-9];
ws = [\ \t];
%%
"\n"       => (pos := (!pos) + 1; lex());
{ws}+    => (lex());
"rational" => (Tokens.RAT(!pos, !pos));
"integer" => (Tokens.INT(!pos, !pos));
"boolean" => (Tokens.BOOL(!pos, !pos));
"if" => (Tokens.IF(!pos, !pos));
"then" => (Tokens.THEN(!pos, !pos));
"else" => (Tokens.ELSE(!pos, !pos));
"fi" => (Tokens.FI(!pos, !pos));
"while" => (Tokens.WHILE(!pos, !pos));
"do" => (Tokens.DO(!pos, !pos));
"od" => (Tokens.OD(!pos, !pos));
"procedure" => (Tokens.PROC(!pos, !pos));
"print" => (Tokens.PRINT(!pos, !pos));
"read" => (Tokens.READ(!pos, !pos));
"call" => (Tokens.CALL(!pos, !pos));

"inverse"=> (Tokens.RATINV(!pos, !pos));
".+."   => (Tokens.RATPLUS(!pos, !pos));
".-."   => (Tokens.RATSUB(!pos, !pos));
".*."   => (Tokens.RATMUL(!pos, !pos));
"./."   => (Tokens.RATDIV(!pos, !pos));
"make_rat" => (Tokens.MAKERAT(!pos, !pos));
"showRat"  => (Tokens.SHOWRAT(!pos, !pos));
"showDecimal"=> (Tokens.SHOWDECI(!pos, !pos));
"fromDecimal"=> (Tokens.FROMDECI(!pos, !pos));
"toDecimal"  => (Tokens.TODECI(!pos, !pos));

"~"      => (Tokens.INTNEG(!pos, !pos));
"+"   => (Tokens.INTPLUS(!pos, !pos));
"-"   => (Tokens.INTSUB(!pos, !pos));
"*"   => (Tokens.INTMUL(!pos, !pos));
"/"   => (Tokens.INTDIV(!pos, !pos));
"%"   => (Tokens.INTMOD(!pos, !pos));

"!"   => (Tokens.BOOLNEG(!pos, !pos));
"&&"  => (Tokens.BOOLAND(!pos, !pos));
"||"  => (Tokens.BOOLOR(!pos, !pos));

"=" => (Tokens.EQUAL(!pos, !pos));
"<>" => (Tokens.NOTEQUAL(!pos, !pos));
"<" => (Tokens.LT(!pos, !pos));
"<=" => (Tokens.LTE(!pos, !pos));
">" => (Tokens.GT(!pos, !pos));
">=" => (Tokens.GTE(!pos, !pos));

":=" => (Tokens.ASSIGN(!pos, !pos));

"(" => (Tokens.LPAREN(!pos, !pos));
")" => (Tokens.RPAREN(!pos, !pos));
"{" => (Tokens.CLPAREN(!pos, !pos));
"}" => (Tokens.CRPAREN(!pos, !pos));

";"      => (Tokens.SEMI(!pos,!pos));
","      => (Tokens.COMMA(!pos, !pos));

"tt" => (Tokens.BOOLNUM(true, !pos, !pos));
"ff" => (Tokens.BOOLNUM(false, !pos, !pos));
{alpha}{all}* => (Tokens.ID(yytext, !pos, !pos));

"~"?{digit}+ => (Tokens.INTNUM
                  (make_int(yytext), !pos, !pos));
"~"?{digit}*"."{digit}*"("{digit}+")" => (Tokens.RATNUM
                (fromDecimal(yytext),
                  !pos,!pos));

"(*"[^]*"*)" => (Tokens.COMMENT(!pos, !pos));
"."      => (error ("ignoring bad character "^yytext);
             lex());