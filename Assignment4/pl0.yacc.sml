functor pl0LrValsFun(structure Token : TOKEN)
 : sig structure ParserData : PARSER_DATA
       structure Tokens : pl0_TOKENS
   end
 = 
struct
structure ParserData=
struct
structure Header = 
struct
(* Sample interactive calculator for ML-Yacc *)


end
structure LrTable = Token.LrTable
structure Token = Token
local open LrTable in 
val table=let val actionRows =
"\
\\001\000\001\000\007\000\002\000\126\000\003\000\126\000\012\000\126\000\
\\051\000\126\000\000\000\
\\001\000\002\000\125\000\003\000\125\000\012\000\125\000\051\000\125\000\000\000\
\\001\000\002\000\131\000\003\000\131\000\012\000\131\000\051\000\131\000\000\000\
\\001\000\002\000\132\000\003\000\132\000\012\000\132\000\051\000\132\000\000\000\
\\001\000\002\000\011\000\003\000\128\000\012\000\128\000\051\000\128\000\000\000\
\\001\000\003\000\127\000\012\000\127\000\051\000\127\000\000\000\
\\001\000\003\000\018\000\012\000\130\000\051\000\130\000\000\000\
\\001\000\004\000\051\000\017\000\050\000\022\000\049\000\023\000\048\000\
\\024\000\047\000\025\000\046\000\026\000\045\000\027\000\044\000\
\\033\000\043\000\042\000\042\000\046\000\041\000\048\000\040\000\
\\050\000\039\000\000\000\
\\001\000\005\000\027\000\009\000\026\000\013\000\025\000\014\000\024\000\
\\015\000\023\000\050\000\022\000\052\000\137\000\000\000\
\\001\000\006\000\144\000\010\000\144\000\018\000\144\000\019\000\144\000\
\\020\000\144\000\021\000\144\000\028\000\144\000\029\000\144\000\
\\030\000\144\000\031\000\144\000\032\000\144\000\034\000\144\000\
\\035\000\144\000\036\000\144\000\037\000\144\000\038\000\144\000\
\\039\000\144\000\040\000\144\000\043\000\144\000\044\000\144\000\
\\045\000\144\000\047\000\144\000\000\000\
\\001\000\006\000\145\000\010\000\145\000\018\000\075\000\019\000\074\000\
\\020\000\073\000\021\000\072\000\028\000\071\000\029\000\070\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\066\000\
\\035\000\065\000\036\000\064\000\037\000\063\000\038\000\062\000\
\\039\000\061\000\040\000\060\000\043\000\145\000\044\000\145\000\
\\045\000\145\000\047\000\059\000\000\000\
\\001\000\006\000\146\000\010\000\146\000\018\000\075\000\019\000\074\000\
\\020\000\073\000\021\000\072\000\028\000\146\000\029\000\146\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\146\000\
\\035\000\146\000\036\000\146\000\037\000\146\000\038\000\146\000\
\\039\000\146\000\040\000\146\000\043\000\146\000\044\000\146\000\
\\045\000\146\000\047\000\146\000\000\000\
\\001\000\006\000\147\000\010\000\147\000\018\000\075\000\019\000\074\000\
\\020\000\073\000\021\000\072\000\028\000\147\000\029\000\147\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\147\000\
\\035\000\147\000\036\000\147\000\037\000\147\000\038\000\147\000\
\\039\000\147\000\040\000\147\000\043\000\147\000\044\000\147\000\
\\045\000\147\000\047\000\147\000\000\000\
\\001\000\006\000\148\000\010\000\148\000\018\000\148\000\019\000\148\000\
\\020\000\073\000\021\000\072\000\028\000\148\000\029\000\148\000\
\\030\000\148\000\031\000\148\000\032\000\148\000\034\000\148\000\
\\035\000\148\000\036\000\148\000\037\000\148\000\038\000\148\000\
\\039\000\148\000\040\000\148\000\043\000\148\000\044\000\148\000\
\\045\000\148\000\047\000\148\000\000\000\
\\001\000\006\000\149\000\010\000\149\000\018\000\149\000\019\000\149\000\
\\020\000\073\000\021\000\072\000\028\000\149\000\029\000\149\000\
\\030\000\149\000\031\000\149\000\032\000\149\000\034\000\149\000\
\\035\000\149\000\036\000\149\000\037\000\149\000\038\000\149\000\
\\039\000\149\000\040\000\149\000\043\000\149\000\044\000\149\000\
\\045\000\149\000\047\000\149\000\000\000\
\\001\000\006\000\150\000\010\000\150\000\018\000\150\000\019\000\150\000\
\\020\000\073\000\021\000\072\000\028\000\150\000\029\000\150\000\
\\030\000\150\000\031\000\150\000\032\000\150\000\034\000\150\000\
\\035\000\150\000\036\000\150\000\037\000\150\000\038\000\150\000\
\\039\000\150\000\040\000\150\000\043\000\150\000\044\000\150\000\
\\045\000\150\000\047\000\150\000\000\000\
\\001\000\006\000\151\000\010\000\151\000\018\000\151\000\019\000\151\000\
\\020\000\151\000\021\000\151\000\028\000\151\000\029\000\151\000\
\\030\000\151\000\031\000\151\000\032\000\151\000\034\000\151\000\
\\035\000\151\000\036\000\151\000\037\000\151\000\038\000\151\000\
\\039\000\151\000\040\000\151\000\043\000\151\000\044\000\151\000\
\\045\000\151\000\047\000\151\000\000\000\
\\001\000\006\000\152\000\010\000\152\000\018\000\152\000\019\000\152\000\
\\020\000\073\000\021\000\072\000\028\000\152\000\029\000\152\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\152\000\
\\035\000\152\000\036\000\152\000\037\000\152\000\038\000\152\000\
\\039\000\152\000\040\000\152\000\043\000\152\000\044\000\152\000\
\\045\000\152\000\047\000\152\000\000\000\
\\001\000\006\000\153\000\010\000\153\000\018\000\153\000\019\000\153\000\
\\020\000\073\000\021\000\072\000\028\000\153\000\029\000\153\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\153\000\
\\035\000\153\000\036\000\153\000\037\000\153\000\038\000\153\000\
\\039\000\153\000\040\000\153\000\043\000\153\000\044\000\153\000\
\\045\000\153\000\047\000\153\000\000\000\
\\001\000\006\000\154\000\010\000\154\000\018\000\154\000\019\000\154\000\
\\020\000\154\000\021\000\154\000\028\000\154\000\029\000\154\000\
\\030\000\154\000\031\000\154\000\032\000\154\000\034\000\154\000\
\\035\000\154\000\036\000\154\000\037\000\154\000\038\000\154\000\
\\039\000\154\000\040\000\154\000\043\000\154\000\044\000\154\000\
\\045\000\154\000\047\000\154\000\000\000\
\\001\000\006\000\155\000\010\000\155\000\018\000\155\000\019\000\155\000\
\\020\000\155\000\021\000\155\000\028\000\155\000\029\000\155\000\
\\030\000\155\000\031\000\155\000\032\000\155\000\034\000\155\000\
\\035\000\155\000\036\000\155\000\037\000\155\000\038\000\155\000\
\\039\000\155\000\040\000\155\000\043\000\155\000\044\000\155\000\
\\045\000\155\000\047\000\155\000\000\000\
\\001\000\006\000\156\000\010\000\156\000\018\000\075\000\019\000\074\000\
\\020\000\073\000\021\000\072\000\028\000\071\000\029\000\070\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\066\000\
\\035\000\065\000\036\000\064\000\037\000\063\000\038\000\062\000\
\\039\000\061\000\040\000\060\000\043\000\156\000\044\000\156\000\
\\045\000\156\000\047\000\059\000\000\000\
\\001\000\006\000\157\000\010\000\157\000\018\000\157\000\019\000\157\000\
\\020\000\157\000\021\000\157\000\028\000\157\000\029\000\157\000\
\\030\000\157\000\031\000\157\000\032\000\157\000\034\000\157\000\
\\035\000\157\000\036\000\157\000\037\000\157\000\038\000\157\000\
\\039\000\157\000\040\000\157\000\043\000\157\000\044\000\157\000\
\\045\000\157\000\047\000\157\000\000\000\
\\001\000\006\000\158\000\010\000\158\000\018\000\075\000\019\000\074\000\
\\020\000\073\000\021\000\072\000\028\000\071\000\029\000\070\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\066\000\
\\035\000\065\000\036\000\064\000\037\000\063\000\038\000\062\000\
\\039\000\061\000\040\000\060\000\043\000\158\000\044\000\158\000\
\\045\000\158\000\047\000\059\000\000\000\
\\001\000\006\000\159\000\010\000\159\000\018\000\075\000\019\000\074\000\
\\020\000\073\000\021\000\072\000\028\000\071\000\029\000\070\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\066\000\
\\035\000\065\000\036\000\064\000\037\000\063\000\038\000\062\000\
\\039\000\061\000\040\000\060\000\043\000\159\000\044\000\159\000\
\\045\000\159\000\047\000\059\000\000\000\
\\001\000\006\000\160\000\010\000\160\000\018\000\160\000\019\000\160\000\
\\020\000\160\000\021\000\160\000\028\000\160\000\029\000\160\000\
\\030\000\160\000\031\000\160\000\032\000\160\000\034\000\160\000\
\\035\000\160\000\036\000\160\000\037\000\160\000\038\000\160\000\
\\039\000\160\000\040\000\160\000\043\000\160\000\044\000\160\000\
\\045\000\160\000\047\000\160\000\000\000\
\\001\000\006\000\161\000\010\000\161\000\018\000\075\000\019\000\074\000\
\\020\000\073\000\021\000\072\000\028\000\071\000\029\000\070\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\066\000\
\\035\000\065\000\036\000\064\000\037\000\063\000\038\000\062\000\
\\039\000\061\000\040\000\060\000\043\000\161\000\044\000\161\000\
\\045\000\161\000\047\000\059\000\000\000\
\\001\000\006\000\162\000\010\000\162\000\018\000\162\000\019\000\162\000\
\\020\000\162\000\021\000\162\000\028\000\162\000\029\000\162\000\
\\030\000\162\000\031\000\162\000\032\000\162\000\034\000\162\000\
\\035\000\162\000\036\000\162\000\037\000\162\000\038\000\162\000\
\\039\000\162\000\040\000\162\000\043\000\162\000\044\000\162\000\
\\045\000\162\000\047\000\162\000\000\000\
\\001\000\006\000\163\000\010\000\163\000\018\000\075\000\019\000\074\000\
\\020\000\073\000\021\000\072\000\028\000\071\000\029\000\070\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\066\000\
\\035\000\065\000\036\000\064\000\037\000\063\000\038\000\062\000\
\\039\000\061\000\040\000\060\000\043\000\163\000\044\000\163\000\
\\045\000\163\000\047\000\059\000\000\000\
\\001\000\006\000\164\000\010\000\164\000\018\000\075\000\019\000\074\000\
\\020\000\073\000\021\000\072\000\028\000\071\000\029\000\070\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\066\000\
\\035\000\065\000\036\000\064\000\037\000\063\000\038\000\062\000\
\\039\000\061\000\040\000\060\000\043\000\164\000\044\000\164\000\
\\045\000\164\000\047\000\059\000\000\000\
\\001\000\006\000\165\000\010\000\165\000\018\000\075\000\019\000\074\000\
\\020\000\073\000\021\000\072\000\028\000\071\000\029\000\070\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\066\000\
\\035\000\065\000\036\000\064\000\037\000\063\000\038\000\062\000\
\\039\000\061\000\040\000\060\000\043\000\165\000\044\000\165\000\
\\045\000\165\000\047\000\059\000\000\000\
\\001\000\006\000\166\000\010\000\166\000\018\000\075\000\019\000\074\000\
\\020\000\073\000\021\000\072\000\028\000\071\000\029\000\070\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\066\000\
\\035\000\065\000\036\000\064\000\037\000\063\000\038\000\062\000\
\\039\000\061\000\040\000\060\000\043\000\166\000\044\000\166\000\
\\045\000\166\000\047\000\059\000\000\000\
\\001\000\006\000\167\000\010\000\167\000\018\000\075\000\019\000\074\000\
\\020\000\073\000\021\000\072\000\028\000\071\000\029\000\070\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\066\000\
\\035\000\065\000\036\000\064\000\037\000\063\000\038\000\062\000\
\\039\000\061\000\040\000\060\000\043\000\167\000\044\000\167\000\
\\045\000\167\000\047\000\059\000\000\000\
\\001\000\006\000\168\000\010\000\168\000\018\000\075\000\019\000\074\000\
\\020\000\073\000\021\000\072\000\028\000\071\000\029\000\070\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\066\000\
\\035\000\065\000\036\000\064\000\037\000\063\000\038\000\062\000\
\\039\000\061\000\040\000\060\000\043\000\168\000\044\000\168\000\
\\045\000\168\000\047\000\059\000\000\000\
\\001\000\006\000\169\000\010\000\169\000\018\000\075\000\019\000\074\000\
\\020\000\073\000\021\000\072\000\028\000\071\000\029\000\070\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\169\000\
\\035\000\169\000\036\000\169\000\037\000\169\000\038\000\169\000\
\\039\000\169\000\040\000\169\000\043\000\169\000\044\000\169\000\
\\045\000\169\000\047\000\169\000\000\000\
\\001\000\006\000\170\000\010\000\170\000\018\000\075\000\019\000\074\000\
\\020\000\073\000\021\000\072\000\028\000\071\000\029\000\070\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\170\000\
\\035\000\170\000\036\000\170\000\037\000\170\000\038\000\170\000\
\\039\000\170\000\040\000\170\000\043\000\170\000\044\000\170\000\
\\045\000\170\000\047\000\170\000\000\000\
\\001\000\006\000\171\000\010\000\171\000\018\000\075\000\019\000\074\000\
\\020\000\073\000\021\000\072\000\028\000\071\000\029\000\070\000\
\\030\000\069\000\031\000\068\000\032\000\067\000\034\000\066\000\
\\035\000\065\000\036\000\064\000\037\000\063\000\038\000\062\000\
\\039\000\061\000\040\000\060\000\043\000\171\000\044\000\171\000\
\\045\000\171\000\047\000\059\000\000\000\
\\001\000\006\000\172\000\010\000\172\000\018\000\172\000\019\000\172\000\
\\020\000\172\000\021\000\172\000\028\000\172\000\029\000\172\000\
\\030\000\172\000\031\000\172\000\032\000\172\000\034\000\172\000\
\\035\000\172\000\036\000\172\000\037\000\172\000\038\000\172\000\
\\039\000\172\000\040\000\172\000\043\000\172\000\044\000\172\000\
\\045\000\172\000\047\000\172\000\000\000\
\\001\000\006\000\173\000\010\000\173\000\018\000\173\000\019\000\173\000\
\\020\000\173\000\021\000\173\000\028\000\173\000\029\000\173\000\
\\030\000\173\000\031\000\173\000\032\000\173\000\034\000\173\000\
\\035\000\173\000\036\000\173\000\037\000\173\000\038\000\173\000\
\\039\000\173\000\040\000\173\000\043\000\173\000\044\000\173\000\
\\045\000\173\000\047\000\173\000\000\000\
\\001\000\006\000\086\000\018\000\075\000\019\000\074\000\020\000\073\000\
\\021\000\072\000\028\000\071\000\029\000\070\000\030\000\069\000\
\\031\000\068\000\032\000\067\000\034\000\066\000\035\000\065\000\
\\036\000\064\000\037\000\063\000\038\000\062\000\039\000\061\000\
\\040\000\060\000\047\000\059\000\000\000\
\\001\000\007\000\135\000\008\000\135\000\011\000\135\000\044\000\135\000\
\\049\000\135\000\000\000\
\\001\000\007\000\115\000\000\000\
\\001\000\008\000\119\000\000\000\
\\001\000\010\000\076\000\018\000\075\000\019\000\074\000\020\000\073\000\
\\021\000\072\000\028\000\071\000\029\000\070\000\030\000\069\000\
\\031\000\068\000\032\000\067\000\034\000\066\000\035\000\065\000\
\\036\000\064\000\037\000\063\000\038\000\062\000\039\000\061\000\
\\040\000\060\000\047\000\059\000\000\000\
\\001\000\011\000\112\000\000\000\
\\001\000\012\000\124\000\051\000\124\000\000\000\
\\001\000\012\000\129\000\051\000\129\000\000\000\
\\001\000\012\000\009\000\051\000\134\000\000\000\
\\001\000\018\000\075\000\019\000\074\000\020\000\073\000\021\000\072\000\
\\028\000\071\000\029\000\070\000\030\000\069\000\031\000\068\000\
\\032\000\067\000\034\000\066\000\035\000\065\000\036\000\064\000\
\\037\000\063\000\038\000\062\000\039\000\061\000\040\000\060\000\
\\043\000\089\000\047\000\059\000\000\000\
\\001\000\018\000\075\000\019\000\074\000\020\000\073\000\021\000\072\000\
\\028\000\071\000\029\000\070\000\030\000\069\000\031\000\068\000\
\\032\000\067\000\034\000\066\000\035\000\065\000\036\000\064\000\
\\037\000\063\000\038\000\062\000\039\000\061\000\040\000\060\000\
\\043\000\108\000\047\000\059\000\000\000\
\\001\000\018\000\075\000\019\000\074\000\020\000\073\000\021\000\072\000\
\\028\000\071\000\029\000\070\000\030\000\069\000\031\000\068\000\
\\032\000\067\000\034\000\066\000\035\000\065\000\036\000\064\000\
\\037\000\063\000\038\000\062\000\039\000\061\000\040\000\060\000\
\\043\000\118\000\047\000\059\000\000\000\
\\001\000\018\000\075\000\019\000\074\000\020\000\073\000\021\000\072\000\
\\028\000\071\000\029\000\070\000\030\000\069\000\031\000\068\000\
\\032\000\067\000\034\000\066\000\035\000\065\000\036\000\064\000\
\\037\000\063\000\038\000\062\000\039\000\061\000\040\000\060\000\
\\044\000\138\000\047\000\059\000\000\000\
\\001\000\018\000\075\000\019\000\074\000\020\000\073\000\021\000\072\000\
\\028\000\071\000\029\000\070\000\030\000\069\000\031\000\068\000\
\\032\000\067\000\034\000\066\000\035\000\065\000\036\000\064\000\
\\037\000\063\000\038\000\062\000\039\000\061\000\040\000\060\000\
\\045\000\114\000\047\000\059\000\000\000\
\\001\000\041\000\034\000\000\000\
\\001\000\042\000\036\000\000\000\
\\001\000\042\000\037\000\000\000\
\\001\000\042\000\081\000\000\000\
\\001\000\042\000\084\000\000\000\
\\001\000\043\000\088\000\000\000\
\\001\000\043\000\113\000\000\000\
\\001\000\044\000\122\000\049\000\122\000\000\000\
\\001\000\044\000\139\000\000\000\
\\001\000\044\000\140\000\000\000\
\\001\000\044\000\141\000\000\000\
\\001\000\044\000\142\000\000\000\
\\001\000\044\000\143\000\000\000\
\\001\000\044\000\029\000\045\000\028\000\000\000\
\\001\000\044\000\032\000\000\000\
\\001\000\044\000\054\000\000\000\
\\001\000\048\000\109\000\000\000\
\\001\000\049\000\000\000\000\000\
\\001\000\049\000\121\000\000\000\
\\001\000\050\000\015\000\000\000\
\\001\000\050\000\016\000\000\000\
\\001\000\050\000\035\000\000\000\
\\001\000\050\000\057\000\000\000\
\\001\000\051\000\123\000\000\000\
\\001\000\051\000\133\000\000\000\
\\001\000\051\000\013\000\000\000\
\\001\000\052\000\136\000\000\000\
\\001\000\052\000\033\000\000\000\
\"
val actionRowNumbers =
"\000\000\047\000\004\000\078\000\
\\071\000\072\000\076\000\073\000\
\\006\000\072\000\060\000\008\000\
\\001\000\066\000\000\000\045\000\
\\072\000\005\000\067\000\080\000\
\\053\000\074\000\054\000\055\000\
\\007\000\007\000\072\000\002\000\
\\068\000\046\000\008\000\040\000\
\\007\000\061\000\075\000\007\000\
\\043\000\037\000\016\000\009\000\
\\007\000\007\000\007\000\007\000\
\\056\000\007\000\007\000\057\000\
\\007\000\027\000\039\000\003\000\
\\047\000\079\000\051\000\058\000\
\\048\000\007\000\007\000\007\000\
\\007\000\007\000\007\000\007\000\
\\007\000\007\000\007\000\007\000\
\\007\000\007\000\007\000\007\000\
\\007\000\007\000\078\000\049\000\
\\036\000\010\000\026\000\069\000\
\\024\000\023\000\007\000\021\000\
\\078\000\077\000\062\000\063\000\
\\033\000\029\000\028\000\031\000\
\\030\000\032\000\035\000\034\000\
\\015\000\014\000\013\000\012\000\
\\011\000\020\000\019\000\018\000\
\\017\000\044\000\038\000\059\000\
\\052\000\041\000\064\000\025\000\
\\007\000\078\000\050\000\042\000\
\\022\000\065\000\070\000"
val gotoT =
"\
\\001\000\118\000\002\000\004\000\003\000\003\000\004\000\002\000\
\\011\000\001\000\000\000\
\\007\000\006\000\000\000\
\\005\000\008\000\000\000\
\\013\000\010\000\000\000\
\\000\000\
\\012\000\012\000\000\000\
\\000\000\
\\000\000\
\\006\000\015\000\000\000\
\\012\000\017\000\000\000\
\\000\000\
\\008\000\019\000\009\000\018\000\000\000\
\\000\000\
\\000\000\
\\002\000\028\000\003\000\003\000\004\000\002\000\011\000\001\000\000\000\
\\000\000\
\\012\000\029\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\010\000\036\000\000\000\
\\010\000\050\000\000\000\
\\012\000\051\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\008\000\053\000\009\000\018\000\000\000\
\\000\000\
\\010\000\054\000\000\000\
\\000\000\
\\000\000\
\\010\000\056\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\010\000\075\000\000\000\
\\010\000\076\000\000\000\
\\010\000\077\000\000\000\
\\010\000\078\000\000\000\
\\000\000\
\\010\000\080\000\000\000\
\\010\000\081\000\000\000\
\\000\000\
\\010\000\083\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\007\000\085\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\010\000\088\000\000\000\
\\010\000\089\000\000\000\
\\010\000\090\000\000\000\
\\010\000\091\000\000\000\
\\010\000\092\000\000\000\
\\010\000\093\000\000\000\
\\010\000\094\000\000\000\
\\010\000\095\000\000\000\
\\010\000\096\000\000\000\
\\010\000\097\000\000\000\
\\010\000\098\000\000\000\
\\010\000\099\000\000\000\
\\010\000\100\000\000\000\
\\010\000\101\000\000\000\
\\010\000\102\000\000\000\
\\010\000\103\000\000\000\
\\010\000\104\000\000\000\
\\013\000\105\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\010\000\108\000\000\000\
\\000\000\
\\013\000\109\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\010\000\114\000\000\000\
\\013\000\115\000\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\\000\000\
\"
val numstates = 119
val numrules = 53
val s = ref "" and index = ref 0
val string_to_int = fn () => 
let val i = !index
in index := i+2; Char.ord(String.sub(!s,i)) + Char.ord(String.sub(!s,i+1)) * 256
end
val string_to_list = fn s' =>
    let val len = String.size s'
        fun f () =
           if !index < len then string_to_int() :: f()
           else nil
   in index := 0; s := s'; f ()
   end
val string_to_pairlist = fn (conv_key,conv_entry) =>
     let fun f () =
         case string_to_int()
         of 0 => EMPTY
          | n => PAIR(conv_key (n-1),conv_entry (string_to_int()),f())
     in f
     end
val string_to_pairlist_default = fn (conv_key,conv_entry) =>
    let val conv_row = string_to_pairlist(conv_key,conv_entry)
    in fn () =>
       let val default = conv_entry(string_to_int())
           val row = conv_row()
       in (row,default)
       end
   end
val string_to_table = fn (convert_row,s') =>
    let val len = String.size s'
        fun f ()=
           if !index < len then convert_row() :: f()
           else nil
     in (s := s'; index := 0; f ())
     end
local
  val memo = Array.array(numstates+numrules,ERROR)
  val _ =let fun g i=(Array.update(memo,i,REDUCE(i-numstates)); g(i+1))
       fun f i =
            if i=numstates then g i
            else (Array.update(memo,i,SHIFT (STATE i)); f (i+1))
          in f 0 handle General.Subscript => ()
          end
in
val entry_to_action = fn 0 => ACCEPT | 1 => ERROR | j => Array.sub(memo,(j-2))
end
val gotoT=Array.fromList(string_to_table(string_to_pairlist(NT,STATE),gotoT))
val actionRows=string_to_table(string_to_pairlist_default(T,entry_to_action),actionRows)
val actionRowNumbers = string_to_list actionRowNumbers
val actionT = let val actionRowLookUp=
let val a=Array.fromList(actionRows) in fn i=>Array.sub(a,i) end
in Array.fromList(List.map actionRowLookUp actionRowNumbers)
end
in LrTable.mkLrTable {actions=actionT,gotos=gotoT,numRules=numrules,
numStates=numstates,initialState=STATE 0}
end
end
local open Header in
type pos = int
type arg = unit
structure MlyValue = 
struct
datatype svalue = VOID | ntVOID of unit ->  unit
 | ID of unit ->  (AST.id) | RATNUM of unit ->  (rational)
 | INTNUM of unit ->  (bigint) | BOOLNUM of unit ->  (bool)
 | TCOMMANDS of unit ->  (AST.cmd) | STRID of unit ->  (AST.ident)
 | VARDECLS of unit ->  (AST.Vardecls) | EXP of unit ->  (AST.exp)
 | CMD of unit ->  (AST.cmd) | COMMANDS of unit ->  (AST.cmd)
 | PROCDECLS of unit ->  (AST.procdecls)
 | BOOLDECLS of unit ->  (AST.Booldecls)
 | INTDECLS of unit ->  (AST.Intdecls)
 | RATDECLS of unit ->  (AST.Ratdecls) | DECLS of unit ->  (AST.Decls)
 | BLOCK of unit ->  (AST.Block) | PROGRAM of unit ->  (AST.Block)
end
type svalue = MlyValue.svalue
type result = AST.Block
end
structure EC=
struct
open LrTable
infix 5 $$
fun x $$ y = y::x
val is_keyword =
fn (T 0) => true | (T 1) => true | (T 2) => true | (T 4) => true | (T 
5) => true | (T 6) => true | (T 7) => true | (T 8) => true | (T 9)
 => true | (T 10) => true | (T 11) => true | (T 12) => true | (T 13)
 => true | (T 14) => true | (T 21) => true | (T 22) => true | (T 23)
 => true | (T 24) => true | (T 25) => true | _ => false
val preferred_change : (term list * term list) list = 
(nil
 $$ (T 49),nil
 $$ (T 12))::
nil
val noShift = 
fn (T 48) => true | _ => false
val showTerminal =
fn (T 0) => "RAT"
  | (T 1) => "INT"
  | (T 2) => "BOOL"
  | (T 3) => "BOOLNUM"
  | (T 4) => "IF"
  | (T 5) => "THEN"
  | (T 6) => "ELSE"
  | (T 7) => "FI"
  | (T 8) => "WHILE"
  | (T 9) => "DO"
  | (T 10) => "OD"
  | (T 11) => "PROC"
  | (T 12) => "PRINT"
  | (T 13) => "READ"
  | (T 14) => "CALL"
  | (T 15) => "RATPOS"
  | (T 16) => "RATINV"
  | (T 17) => "RATPLUS"
  | (T 18) => "RATSUB"
  | (T 19) => "RATMUL"
  | (T 20) => "RATDIV"
  | (T 21) => "MAKERAT"
  | (T 22) => "SHOWRAT"
  | (T 23) => "SHOWDECI"
  | (T 24) => "FROMDECI"
  | (T 25) => "TODECI"
  | (T 26) => "INTNEG"
  | (T 27) => "INTPLUS"
  | (T 28) => "INTSUB"
  | (T 29) => "INTMUL"
  | (T 30) => "INTDIV"
  | (T 31) => "INTMOD"
  | (T 32) => "BOOLNEG"
  | (T 33) => "BOOLAND"
  | (T 34) => "BOOLOR"
  | (T 35) => "EQUAL"
  | (T 36) => "LT"
  | (T 37) => "LTE"
  | (T 38) => "GT"
  | (T 39) => "GTE"
  | (T 40) => "ASSIGN"
  | (T 41) => "LPAREN"
  | (T 42) => "RPAREN"
  | (T 43) => "SEMI"
  | (T 44) => "COMMA"
  | (T 45) => "INTNUM"
  | (T 46) => "NOTEQUAL"
  | (T 47) => "RATNUM"
  | (T 48) => "EOF"
  | (T 49) => "ID"
  | (T 50) => "CLPAREN"
  | (T 51) => "CRPAREN"
  | (T 52) => "COMMENT"
  | _ => "bogus-term"
local open Header in
val errtermvalue=
fn _ => MlyValue.VOID
end
val terms : term list = nil
 $$ (T 52) $$ (T 51) $$ (T 50) $$ (T 48) $$ (T 46) $$ (T 44) $$ (T 43)
 $$ (T 42) $$ (T 41) $$ (T 40) $$ (T 39) $$ (T 38) $$ (T 37) $$ (T 36)
 $$ (T 35) $$ (T 34) $$ (T 33) $$ (T 32) $$ (T 31) $$ (T 30) $$ (T 29)
 $$ (T 28) $$ (T 27) $$ (T 26) $$ (T 25) $$ (T 24) $$ (T 23) $$ (T 22)
 $$ (T 21) $$ (T 20) $$ (T 19) $$ (T 18) $$ (T 17) $$ (T 16) $$ (T 15)
 $$ (T 14) $$ (T 13) $$ (T 12) $$ (T 11) $$ (T 10) $$ (T 9) $$ (T 8)
 $$ (T 7) $$ (T 6) $$ (T 5) $$ (T 4) $$ (T 2) $$ (T 1) $$ (T 0)end
structure Actions =
struct 
exception mlyAction of int
local open Header in
val actions = 
fn (i392,defaultPos,stack,
    (()):arg) =>
case (i392,stack)
of  ( 0, ( ( _, ( MlyValue.BLOCK BLOCK1, BLOCK1left, BLOCK1right)) :: 
rest671)) => let val  result = MlyValue.PROGRAM (fn _ => let val  (
BLOCK as BLOCK1) = BLOCK1 ()
 in (BLOCK)
end)
 in ( LrTable.NT 0, ( result, BLOCK1left, BLOCK1right), rest671)
end
|  ( 1, ( ( _, ( MlyValue.TCOMMANDS TCOMMANDS1, _, TCOMMANDS1right))
 :: ( _, ( MlyValue.DECLS DECLS1, DECLS1left, _)) :: rest671)) => let
 val  result = MlyValue.BLOCK (fn _ => let val  (DECLS as DECLS1) = 
DECLS1 ()
 val  (TCOMMANDS as TCOMMANDS1) = TCOMMANDS1 ()
 in (AST.block(DECLS, TCOMMANDS))
end)
 in ( LrTable.NT 1, ( result, DECLS1left, TCOMMANDS1right), rest671)

end
|  ( 2, ( ( _, ( MlyValue.PROCDECLS PROCDECLS1, _, PROCDECLS1right))
 :: ( _, ( MlyValue.VARDECLS VARDECLS1, VARDECLS1left, _)) :: rest671)
) => let val  result = MlyValue.DECLS (fn _ => let val  (VARDECLS as 
VARDECLS1) = VARDECLS1 ()
 val  (PROCDECLS as PROCDECLS1) = PROCDECLS1 ()
 in (AST.decls(VARDECLS, PROCDECLS))
end)
 in ( LrTable.NT 2, ( result, VARDECLS1left, PROCDECLS1right), rest671
)
end
|  ( 3, ( ( _, ( MlyValue.BOOLDECLS BOOLDECLS1, _, BOOLDECLS1right))
 :: ( _, ( MlyValue.INTDECLS INTDECLS1, _, _)) :: ( _, ( 
MlyValue.RATDECLS RATDECLS1, RATDECLS1left, _)) :: rest671)) => let
 val  result = MlyValue.VARDECLS (fn _ => let val  (RATDECLS as 
RATDECLS1) = RATDECLS1 ()
 val  (INTDECLS as INTDECLS1) = INTDECLS1 ()
 val  (BOOLDECLS as BOOLDECLS1) = BOOLDECLS1 ()
 in (AST.vardecls(RATDECLS, INTDECLS, BOOLDECLS))
end)
 in ( LrTable.NT 10, ( result, RATDECLS1left, BOOLDECLS1right), 
rest671)
end
|  ( 4, ( ( _, ( MlyValue.STRID STRID1, _, STRID1right)) :: ( _, ( _, 
RAT1left, _)) :: rest671)) => let val  result = MlyValue.RATDECLS (fn
 _ => let val  (STRID as STRID1) = STRID1 ()
 in (AST.ratdecls(STRID))
end)
 in ( LrTable.NT 3, ( result, RAT1left, STRID1right), rest671)
end
|  ( 5, ( rest671)) => let val  result = MlyValue.RATDECLS (fn _ => (
AST.nullratdecls(AST.Empty)))
 in ( LrTable.NT 3, ( result, defaultPos, defaultPos), rest671)
end
|  ( 6, ( ( _, ( MlyValue.STRID STRID1, _, STRID1right)) :: ( _, ( _, 
INT1left, _)) :: rest671)) => let val  result = MlyValue.INTDECLS (fn
 _ => let val  (STRID as STRID1) = STRID1 ()
 in (AST.intdecls(STRID))
end)
 in ( LrTable.NT 4, ( result, INT1left, STRID1right), rest671)
end
|  ( 7, ( rest671)) => let val  result = MlyValue.INTDECLS (fn _ => (
AST.nullintdecls(AST.Empty)))
 in ( LrTable.NT 4, ( result, defaultPos, defaultPos), rest671)
end
|  ( 8, ( ( _, ( MlyValue.STRID STRID1, _, STRID1right)) :: ( _, ( _, 
BOOL1left, _)) :: rest671)) => let val  result = MlyValue.BOOLDECLS
 (fn _ => let val  (STRID as STRID1) = STRID1 ()
 in (AST.booldecls(STRID))
end)
 in ( LrTable.NT 5, ( result, BOOL1left, STRID1right), rest671)
end
|  ( 9, ( rest671)) => let val  result = MlyValue.BOOLDECLS (fn _ => (
AST.nullbooldecls(AST.Empty)))
 in ( LrTable.NT 5, ( result, defaultPos, defaultPos), rest671)
end
|  ( 10, ( ( _, ( _, _, SEMI1right)) :: ( _, ( MlyValue.ID ID1, 
ID1left, _)) :: rest671)) => let val  result = MlyValue.STRID (fn _ =>
 let val  (ID as ID1) = ID1 ()
 in (AST.uniident(ID, AST.Empty))
end)
 in ( LrTable.NT 11, ( result, ID1left, SEMI1right), rest671)
end
|  ( 11, ( ( _, ( MlyValue.STRID STRID1, _, STRID1right)) :: _ :: ( _,
 ( MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = 
MlyValue.STRID (fn _ => let val  (ID as ID1) = ID1 ()
 val  (STRID as STRID1) = STRID1 ()
 in (AST.multiident(ID, STRID))
end)
 in ( LrTable.NT 11, ( result, ID1left, STRID1right), rest671)
end
|  ( 12, ( ( _, ( MlyValue.PROCDECLS PROCDECLS1, _, PROCDECLS1right))
 :: _ :: ( _, ( MlyValue.BLOCK BLOCK1, _, _)) :: ( _, ( MlyValue.ID 
ID1, _, _)) :: ( _, ( _, PROC1left, _)) :: rest671)) => let val  
result = MlyValue.PROCDECLS (fn _ => let val  (ID as ID1) = ID1 ()
 val  (BLOCK as BLOCK1) = BLOCK1 ()
 val  (PROCDECLS as PROCDECLS1) = PROCDECLS1 ()
 in (AST.multiprocdecls(ID, BLOCK ,PROCDECLS))
end)
 in ( LrTable.NT 6, ( result, PROC1left, PROCDECLS1right), rest671)

end
|  ( 13, ( rest671)) => let val  result = MlyValue.PROCDECLS (fn _ =>
 (AST.nullprocdecls((AST.Empty))))
 in ( LrTable.NT 6, ( result, defaultPos, defaultPos), rest671)
end
|  ( 14, ( ( _, ( _, _, CRPAREN1right)) :: ( _, ( MlyValue.COMMANDS 
COMMANDS1, _, _)) :: ( _, ( _, CLPAREN1left, _)) :: rest671)) => let
 val  result = MlyValue.TCOMMANDS (fn _ => let val  (COMMANDS as 
COMMANDS1) = COMMANDS1 ()
 in (COMMANDS)
end)
 in ( LrTable.NT 12, ( result, CLPAREN1left, CRPAREN1right), rest671)

end
|  ( 15, ( ( _, ( MlyValue.COMMANDS COMMANDS1, _, COMMANDS1right)) ::
 _ :: ( _, ( MlyValue.CMD CMD1, CMD1left, _)) :: rest671)) => let val 
 result = MlyValue.COMMANDS (fn _ => let val  (CMD as CMD1) = CMD1 ()
 val  (COMMANDS as COMMANDS1) = COMMANDS1 ()
 in (AST.multicmd(CMD, COMMANDS))
end)
 in ( LrTable.NT 7, ( result, CMD1left, COMMANDS1right), rest671)
end
|  ( 16, ( rest671)) => let val  result = MlyValue.COMMANDS (fn _ => (
AST.nullcmd(AST.Empty)))
 in ( LrTable.NT 7, ( result, defaultPos, defaultPos), rest671)
end
|  ( 17, ( ( _, ( MlyValue.EXP EXP1, _, EXP1right)) :: _ :: ( _, ( 
MlyValue.ID ID1, ID1left, _)) :: rest671)) => let val  result = 
MlyValue.CMD (fn _ => let val  (ID as ID1) = ID1 ()
 val  (EXP as EXP1) = EXP1 ()
 in (AST.AssignCmd(ID, AST.Assign, EXP))
end)
 in ( LrTable.NT 8, ( result, ID1left, EXP1right), rest671)
end
|  ( 18, ( ( _, ( MlyValue.ID ID1, _, ID1right)) :: ( _, ( _, 
CALL1left, _)) :: rest671)) => let val  result = MlyValue.CMD (fn _ =>
 let val  (ID as ID1) = ID1 ()
 in (AST.UniOpCmd(AST.Call, AST.VarExp(ID)))
end)
 in ( LrTable.NT 8, ( result, CALL1left, ID1right), rest671)
end
|  ( 19, ( ( _, ( _, _, RPAREN1right)) :: ( _, ( MlyValue.ID ID1, _, _
)) :: _ :: ( _, ( _, READ1left, _)) :: rest671)) => let val  result = 
MlyValue.CMD (fn _ => let val  (ID as ID1) = ID1 ()
 in (AST.UniOpCmd(AST.Read, AST.VarExp(ID)))
end)
 in ( LrTable.NT 8, ( result, READ1left, RPAREN1right), rest671)
end
|  ( 20, ( ( _, ( _, _, RPAREN1right)) :: ( _, ( MlyValue.EXP EXP1, _,
 _)) :: _ :: ( _, ( _, PRINT1left, _)) :: rest671)) => let val  result
 = MlyValue.CMD (fn _ => let val  (EXP as EXP1) = EXP1 ()
 in (AST.UniOpCmd(AST.Print, EXP))
end)
 in ( LrTable.NT 8, ( result, PRINT1left, RPAREN1right), rest671)
end
|  ( 21, ( ( _, ( _, _, OD1right)) :: ( _, ( MlyValue.TCOMMANDS 
TCOMMANDS1, _, _)) :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: ( _, (
 _, WHILE1left, _)) :: rest671)) => let val  result = MlyValue.CMD (fn
 _ => let val  (EXP as EXP1) = EXP1 ()
 val  (TCOMMANDS as TCOMMANDS1) = TCOMMANDS1 ()
 in (AST.WhileCmd(EXP, TCOMMANDS))
end)
 in ( LrTable.NT 8, ( result, WHILE1left, OD1right), rest671)
end
|  ( 22, ( ( _, ( _, _, FI1right)) :: ( _, ( MlyValue.TCOMMANDS 
TCOMMANDS2, _, _)) :: _ :: ( _, ( MlyValue.TCOMMANDS TCOMMANDS1, _, _)
) :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: ( _, ( _, IF1left, _))
 :: rest671)) => let val  result = MlyValue.CMD (fn _ => let val  (EXP
 as EXP1) = EXP1 ()
 val  TCOMMANDS1 = TCOMMANDS1 ()
 val  TCOMMANDS2 = TCOMMANDS2 ()
 in (AST.IteCmd(EXP, TCOMMANDS1, TCOMMANDS2))
end)
 in ( LrTable.NT 8, ( result, IF1left, FI1right), rest671)
end
|  ( 23, ( ( _, ( MlyValue.INTNUM INTNUM1, INTNUM1left, INTNUM1right))
 :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  (
INTNUM as INTNUM1) = INTNUM1 ()
 in (AST.IntExp(INTNUM))
end)
 in ( LrTable.NT 9, ( result, INTNUM1left, INTNUM1right), rest671)
end
|  ( 24, ( ( _, ( MlyValue.EXP EXP1, _, EXP1right)) :: ( _, ( _, 
INTNEG1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _
 => let val  (EXP as EXP1) = EXP1 ()
 in (AST.UniExp(AST.Neg, EXP))
end)
 in ( LrTable.NT 9, ( result, INTNEG1left, EXP1right), rest671)
end
|  ( 25, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp(EXP1, AST.IntAdd, EXP2))
end)
 in ( LrTable.NT 9, ( result, EXP1left, EXP2right), rest671)
end
|  ( 26, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp(EXP1, AST.IntSub, EXP2))
end)
 in ( LrTable.NT 9, ( result, EXP1left, EXP2right), rest671)
end
|  ( 27, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp(EXP1, AST.IntMul, EXP2))
end)
 in ( LrTable.NT 9, ( result, EXP1left, EXP2right), rest671)
end
|  ( 28, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp(EXP1, AST.IntDiv, EXP2))
end)
 in ( LrTable.NT 9, ( result, EXP1left, EXP2right), rest671)
end
|  ( 29, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp(EXP1, AST.IntMod, EXP2))
end)
 in ( LrTable.NT 9, ( result, EXP1left, EXP2right), rest671)
end
|  ( 30, ( ( _, ( MlyValue.RATNUM RATNUM1, RATNUM1left, RATNUM1right))
 :: rest671)) => let val  result = MlyValue.EXP (fn _ => let val  (
RATNUM as RATNUM1) = RATNUM1 ()
 in (AST.RatExp(RATNUM))
end)
 in ( LrTable.NT 9, ( result, RATNUM1left, RATNUM1right), rest671)
end
|  ( 31, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp(EXP1, AST.RatAdd, EXP2))
end)
 in ( LrTable.NT 9, ( result, EXP1left, EXP2right), rest671)
end
|  ( 32, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp(EXP1, AST.RatSub, EXP2))
end)
 in ( LrTable.NT 9, ( result, EXP1left, EXP2right), rest671)
end
|  ( 33, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp(EXP1, AST.RatMul, EXP2))
end)
 in ( LrTable.NT 9, ( result, EXP1left, EXP2right), rest671)
end
|  ( 34, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp(EXP1, AST.RatDiv, EXP2))
end)
 in ( LrTable.NT 9, ( result, EXP1left, EXP2right), rest671)
end
|  ( 35, ( ( _, ( MlyValue.EXP EXP1, _, EXP1right)) :: ( _, ( _, 
RATINV1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _
 => let val  (EXP as EXP1) = EXP1 ()
 in (AST.UniExp(AST.RatInv, EXP))
end)
 in ( LrTable.NT 9, ( result, RATINV1left, EXP1right), rest671)
end
|  ( 36, ( ( _, ( _, _, RPAREN1right)) :: ( _, ( MlyValue.EXP EXP2, _,
 _)) :: _ :: ( _, ( MlyValue.EXP EXP1, _, _)) :: _ :: ( _, ( _, 
MAKERAT1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _
 => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp(EXP1, AST.MakeRat, EXP2))
end)
 in ( LrTable.NT 9, ( result, MAKERAT1left, RPAREN1right), rest671)

end
|  ( 37, ( ( _, ( MlyValue.EXP EXP1, _, EXP1right)) :: ( _, ( _, 
SHOWRAT1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _
 => let val  (EXP as EXP1) = EXP1 ()
 in (AST.UniExp(AST.ShowRat, EXP))
end)
 in ( LrTable.NT 9, ( result, SHOWRAT1left, EXP1right), rest671)
end
|  ( 38, ( ( _, ( MlyValue.EXP EXP1, _, EXP1right)) :: ( _, ( _, 
SHOWDECI1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn
 _ => let val  (EXP as EXP1) = EXP1 ()
 in (AST.UniExp(AST.ShowDecimal, EXP))
end)
 in ( LrTable.NT 9, ( result, SHOWDECI1left, EXP1right), rest671)
end
|  ( 39, ( ( _, ( _, _, RPAREN1right)) :: ( _, ( MlyValue.RATNUM 
RATNUM1, _, _)) :: _ :: ( _, ( _, FROMDECI1left, _)) :: rest671)) =>
 let val  result = MlyValue.EXP (fn _ => let val  (RATNUM as RATNUM1)
 = RATNUM1 ()
 in (AST.UniExp(AST.FromDecimal, AST.RatExp(RATNUM)))
end)
 in ( LrTable.NT 9, ( result, FROMDECI1left, RPAREN1right), rest671)

end
|  ( 40, ( ( _, ( MlyValue.EXP EXP1, _, EXP1right)) :: ( _, ( _, 
TODECI1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _
 => let val  (EXP as EXP1) = EXP1 ()
 in (AST.UniExp(AST.toDecimal, EXP))
end)
 in ( LrTable.NT 9, ( result, TODECI1left, EXP1right), rest671)
end
|  ( 41, ( ( _, ( MlyValue.BOOLNUM BOOLNUM1, BOOLNUM1left, 
BOOLNUM1right)) :: rest671)) => let val  result = MlyValue.EXP (fn _
 => let val  (BOOLNUM as BOOLNUM1) = BOOLNUM1 ()
 in (AST.BoolExp(BOOLNUM))
end)
 in ( LrTable.NT 9, ( result, BOOLNUM1left, BOOLNUM1right), rest671)

end
|  ( 42, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp((EXP1, AST.GT, EXP2)))
end)
 in ( LrTable.NT 9, ( result, EXP1left, EXP2right), rest671)
end
|  ( 43, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp((EXP1, AST.GTE, EXP2)))
end)
 in ( LrTable.NT 9, ( result, EXP1left, EXP2right), rest671)
end
|  ( 44, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp((EXP1, AST.LT, EXP2)))
end)
 in ( LrTable.NT 9, ( result, EXP1left, EXP2right), rest671)
end
|  ( 45, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp((EXP1, AST.LTE, EXP2)))
end)
 in ( LrTable.NT 9, ( result, EXP1left, EXP2right), rest671)
end
|  ( 46, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp((EXP1, AST.Equal, EXP2)))
end)
 in ( LrTable.NT 9, ( result, EXP1left, EXP2right), rest671)
end
|  ( 47, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp((EXP1, AST.NotEqual, EXP2)))
end)
 in ( LrTable.NT 9, ( result, EXP1left, EXP2right), rest671)
end
|  ( 48, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp(EXP1, AST.And, EXP2))
end)
 in ( LrTable.NT 9, ( result, EXP1left, EXP2right), rest671)
end
|  ( 49, ( ( _, ( MlyValue.EXP EXP2, _, EXP2right)) :: _ :: ( _, ( 
MlyValue.EXP EXP1, EXP1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  EXP1 = EXP1 ()
 val  EXP2 = EXP2 ()
 in (AST.BinExp(EXP1, AST.Or, EXP2))
end)
 in ( LrTable.NT 9, ( result, EXP1left, EXP2right), rest671)
end
|  ( 50, ( ( _, ( MlyValue.EXP EXP1, _, EXP1right)) :: ( _, ( _, 
BOOLNEG1left, _)) :: rest671)) => let val  result = MlyValue.EXP (fn _
 => let val  (EXP as EXP1) = EXP1 ()
 in (AST.UniExp(AST.BoolNeg, EXP))
end)
 in ( LrTable.NT 9, ( result, BOOLNEG1left, EXP1right), rest671)
end
|  ( 51, ( ( _, ( MlyValue.ID ID1, ID1left, ID1right)) :: rest671)) =>
 let val  result = MlyValue.EXP (fn _ => let val  (ID as ID1) = ID1 ()
 in (AST.VarExp(ID))
end)
 in ( LrTable.NT 9, ( result, ID1left, ID1right), rest671)
end
|  ( 52, ( ( _, ( _, _, RPAREN1right)) :: ( _, ( MlyValue.EXP EXP1, _,
 _)) :: ( _, ( _, LPAREN1left, _)) :: rest671)) => let val  result = 
MlyValue.EXP (fn _ => let val  (EXP as EXP1) = EXP1 ()
 in (EXP)
end)
 in ( LrTable.NT 9, ( result, LPAREN1left, RPAREN1right), rest671)
end
| _ => raise (mlyAction i392)
end
val void = MlyValue.VOID
val extract = fn a => (fn MlyValue.PROGRAM x => x
| _ => let exception ParseInternal
	in raise ParseInternal end) a ()
end
end
structure Tokens : pl0_TOKENS =
struct
type svalue = ParserData.svalue
type ('a,'b) token = ('a,'b) Token.token
fun RAT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 0,(
ParserData.MlyValue.VOID,p1,p2))
fun INT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 1,(
ParserData.MlyValue.VOID,p1,p2))
fun BOOL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 2,(
ParserData.MlyValue.VOID,p1,p2))
fun BOOLNUM (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 3,(
ParserData.MlyValue.BOOLNUM (fn () => i),p1,p2))
fun IF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 4,(
ParserData.MlyValue.VOID,p1,p2))
fun THEN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 5,(
ParserData.MlyValue.VOID,p1,p2))
fun ELSE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 6,(
ParserData.MlyValue.VOID,p1,p2))
fun FI (p1,p2) = Token.TOKEN (ParserData.LrTable.T 7,(
ParserData.MlyValue.VOID,p1,p2))
fun WHILE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 8,(
ParserData.MlyValue.VOID,p1,p2))
fun DO (p1,p2) = Token.TOKEN (ParserData.LrTable.T 9,(
ParserData.MlyValue.VOID,p1,p2))
fun OD (p1,p2) = Token.TOKEN (ParserData.LrTable.T 10,(
ParserData.MlyValue.VOID,p1,p2))
fun PROC (p1,p2) = Token.TOKEN (ParserData.LrTable.T 11,(
ParserData.MlyValue.VOID,p1,p2))
fun PRINT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 12,(
ParserData.MlyValue.VOID,p1,p2))
fun READ (p1,p2) = Token.TOKEN (ParserData.LrTable.T 13,(
ParserData.MlyValue.VOID,p1,p2))
fun CALL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 14,(
ParserData.MlyValue.VOID,p1,p2))
fun RATPOS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 15,(
ParserData.MlyValue.VOID,p1,p2))
fun RATINV (p1,p2) = Token.TOKEN (ParserData.LrTable.T 16,(
ParserData.MlyValue.VOID,p1,p2))
fun RATPLUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 17,(
ParserData.MlyValue.VOID,p1,p2))
fun RATSUB (p1,p2) = Token.TOKEN (ParserData.LrTable.T 18,(
ParserData.MlyValue.VOID,p1,p2))
fun RATMUL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 19,(
ParserData.MlyValue.VOID,p1,p2))
fun RATDIV (p1,p2) = Token.TOKEN (ParserData.LrTable.T 20,(
ParserData.MlyValue.VOID,p1,p2))
fun MAKERAT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 21,(
ParserData.MlyValue.VOID,p1,p2))
fun SHOWRAT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 22,(
ParserData.MlyValue.VOID,p1,p2))
fun SHOWDECI (p1,p2) = Token.TOKEN (ParserData.LrTable.T 23,(
ParserData.MlyValue.VOID,p1,p2))
fun FROMDECI (p1,p2) = Token.TOKEN (ParserData.LrTable.T 24,(
ParserData.MlyValue.VOID,p1,p2))
fun TODECI (p1,p2) = Token.TOKEN (ParserData.LrTable.T 25,(
ParserData.MlyValue.VOID,p1,p2))
fun INTNEG (p1,p2) = Token.TOKEN (ParserData.LrTable.T 26,(
ParserData.MlyValue.VOID,p1,p2))
fun INTPLUS (p1,p2) = Token.TOKEN (ParserData.LrTable.T 27,(
ParserData.MlyValue.VOID,p1,p2))
fun INTSUB (p1,p2) = Token.TOKEN (ParserData.LrTable.T 28,(
ParserData.MlyValue.VOID,p1,p2))
fun INTMUL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 29,(
ParserData.MlyValue.VOID,p1,p2))
fun INTDIV (p1,p2) = Token.TOKEN (ParserData.LrTable.T 30,(
ParserData.MlyValue.VOID,p1,p2))
fun INTMOD (p1,p2) = Token.TOKEN (ParserData.LrTable.T 31,(
ParserData.MlyValue.VOID,p1,p2))
fun BOOLNEG (p1,p2) = Token.TOKEN (ParserData.LrTable.T 32,(
ParserData.MlyValue.VOID,p1,p2))
fun BOOLAND (p1,p2) = Token.TOKEN (ParserData.LrTable.T 33,(
ParserData.MlyValue.VOID,p1,p2))
fun BOOLOR (p1,p2) = Token.TOKEN (ParserData.LrTable.T 34,(
ParserData.MlyValue.VOID,p1,p2))
fun EQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 35,(
ParserData.MlyValue.VOID,p1,p2))
fun LT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 36,(
ParserData.MlyValue.VOID,p1,p2))
fun LTE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 37,(
ParserData.MlyValue.VOID,p1,p2))
fun GT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 38,(
ParserData.MlyValue.VOID,p1,p2))
fun GTE (p1,p2) = Token.TOKEN (ParserData.LrTable.T 39,(
ParserData.MlyValue.VOID,p1,p2))
fun ASSIGN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 40,(
ParserData.MlyValue.VOID,p1,p2))
fun LPAREN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 41,(
ParserData.MlyValue.VOID,p1,p2))
fun RPAREN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 42,(
ParserData.MlyValue.VOID,p1,p2))
fun SEMI (p1,p2) = Token.TOKEN (ParserData.LrTable.T 43,(
ParserData.MlyValue.VOID,p1,p2))
fun COMMA (p1,p2) = Token.TOKEN (ParserData.LrTable.T 44,(
ParserData.MlyValue.VOID,p1,p2))
fun INTNUM (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 45,(
ParserData.MlyValue.INTNUM (fn () => i),p1,p2))
fun NOTEQUAL (p1,p2) = Token.TOKEN (ParserData.LrTable.T 46,(
ParserData.MlyValue.VOID,p1,p2))
fun RATNUM (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 47,(
ParserData.MlyValue.RATNUM (fn () => i),p1,p2))
fun EOF (p1,p2) = Token.TOKEN (ParserData.LrTable.T 48,(
ParserData.MlyValue.VOID,p1,p2))
fun ID (i,p1,p2) = Token.TOKEN (ParserData.LrTable.T 49,(
ParserData.MlyValue.ID (fn () => i),p1,p2))
fun CLPAREN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 50,(
ParserData.MlyValue.VOID,p1,p2))
fun CRPAREN (p1,p2) = Token.TOKEN (ParserData.LrTable.T 51,(
ParserData.MlyValue.VOID,p1,p2))
fun COMMENT (p1,p2) = Token.TOKEN (ParserData.LrTable.T 52,(
ParserData.MlyValue.VOID,p1,p2))
end
end
