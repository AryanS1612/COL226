signature pl0_TOKENS =
sig
type ('a,'b) token
type svalue
val COMMENT:  'a * 'a -> (svalue,'a) token
val CRPAREN:  'a * 'a -> (svalue,'a) token
val CLPAREN:  'a * 'a -> (svalue,'a) token
val ID: (AST.id) *  'a * 'a -> (svalue,'a) token
val EOF:  'a * 'a -> (svalue,'a) token
val RATNUM: (rational) *  'a * 'a -> (svalue,'a) token
val NOTEQUAL:  'a * 'a -> (svalue,'a) token
val INTNUM: (bigint) *  'a * 'a -> (svalue,'a) token
val COMMA:  'a * 'a -> (svalue,'a) token
val SEMI:  'a * 'a -> (svalue,'a) token
val RPAREN:  'a * 'a -> (svalue,'a) token
val LPAREN:  'a * 'a -> (svalue,'a) token
val ASSIGN:  'a * 'a -> (svalue,'a) token
val GTE:  'a * 'a -> (svalue,'a) token
val GT:  'a * 'a -> (svalue,'a) token
val LTE:  'a * 'a -> (svalue,'a) token
val LT:  'a * 'a -> (svalue,'a) token
val EQUAL:  'a * 'a -> (svalue,'a) token
val BOOLOR:  'a * 'a -> (svalue,'a) token
val BOOLAND:  'a * 'a -> (svalue,'a) token
val BOOLNEG:  'a * 'a -> (svalue,'a) token
val INTMOD:  'a * 'a -> (svalue,'a) token
val INTDIV:  'a * 'a -> (svalue,'a) token
val INTMUL:  'a * 'a -> (svalue,'a) token
val INTSUB:  'a * 'a -> (svalue,'a) token
val INTPLUS:  'a * 'a -> (svalue,'a) token
val INTNEG:  'a * 'a -> (svalue,'a) token
val TODECI:  'a * 'a -> (svalue,'a) token
val FROMDECI:  'a * 'a -> (svalue,'a) token
val SHOWDECI:  'a * 'a -> (svalue,'a) token
val SHOWRAT:  'a * 'a -> (svalue,'a) token
val MAKERAT:  'a * 'a -> (svalue,'a) token
val RATDIV:  'a * 'a -> (svalue,'a) token
val RATMUL:  'a * 'a -> (svalue,'a) token
val RATSUB:  'a * 'a -> (svalue,'a) token
val RATPLUS:  'a * 'a -> (svalue,'a) token
val RATINV:  'a * 'a -> (svalue,'a) token
val RATPOS:  'a * 'a -> (svalue,'a) token
val CALL:  'a * 'a -> (svalue,'a) token
val READ:  'a * 'a -> (svalue,'a) token
val PRINT:  'a * 'a -> (svalue,'a) token
val PROC:  'a * 'a -> (svalue,'a) token
val OD:  'a * 'a -> (svalue,'a) token
val DO:  'a * 'a -> (svalue,'a) token
val WHILE:  'a * 'a -> (svalue,'a) token
val FI:  'a * 'a -> (svalue,'a) token
val ELSE:  'a * 'a -> (svalue,'a) token
val THEN:  'a * 'a -> (svalue,'a) token
val IF:  'a * 'a -> (svalue,'a) token
val BOOLNUM: (bool) *  'a * 'a -> (svalue,'a) token
val BOOL:  'a * 'a -> (svalue,'a) token
val INT:  'a * 'a -> (svalue,'a) token
val RAT:  'a * 'a -> (svalue,'a) token
end
signature pl0_LRVALS=
sig
structure Tokens : pl0_TOKENS
structure ParserData:PARSER_DATA
sharing type ParserData.Token.token = Tokens.token
sharing type ParserData.svalue = Tokens.svalue
end
