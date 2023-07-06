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
%header (functor CalcLexFun(structure Tokens: Calc_TOKENS));
alpha=[A-Za-z];
digit=[0-9];
ws = [\ \t];
%%
\n       => (pos := (!pos) + 1; lex());
{ws}+    => (lex());
"Decimal" => (Tokens.DECIMAL(!pos, !pos));
"Rational" => (Tokens.RATIONAL(!pos, !pos));
"~"?{digit}+ => (Tokens.NUM
                  (fromInt(yytext), !pos, !pos));
"~"?{digit}*"."{digit}*"("{digit}+")" => (Tokens.NUM
                (fromDecimal(yytext),
                  !pos,!pos));
"~"?{digit}+"/"{digit}+ => (Tokens.NUM
                (fromFrac(yytext),
                !pos, !pos));
"(" => (Tokens.LPAREN(!pos, !pos));
")" => (Tokens.RPAREN(!pos, !pos));
"==" => (Tokens.EQUAL(!pos, !pos));
"<" => (Tokens.LESS(!pos, !pos));
">" => (Tokens.GREATER(!pos, !pos));
{alpha}+ => (Tokens.ID
              (yytext, !pos, !pos));
"=" => (Tokens.ASSIGN(!pos, !pos));
"+"      => (Tokens.PLUS(!pos,!pos));
"*"      => (Tokens.TIMES(!pos,!pos));
";"      => (Tokens.SEMI(!pos,!pos));
"-"      => (Tokens.SUB(!pos,!pos));
"/"      => (Tokens.DIV(!pos,!pos));
"."      => (error ("ignoring bad character "^yytext);
             lex());