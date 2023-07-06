(* Sample interactive calculator for ML-Yacc *)

%%

%eop EOF

(* %pos declares the type of positions for terminals.
   Each symbol has an associated left and right position. *)

%pos int

%right ASSIGN
%right EQUAL NOTEQUAL LT LTE GT GTE
%left BOOLAND BOOLOR
%left INTPLUS INTSUB
%left RATPLUS RATSUB
%left INTMUL INTDIV INTMOD
%left RATMUL RATDIV 

%term RAT | INT | BOOL | BOOLNUM of bool | IF | THEN | ELSE | FI | WHILE | 
      DO | OD | PROC | PRINT | READ | CALL | RATPOS | RATINV |
      RATPLUS | RATSUB | RATMUL | RATDIV | MAKERAT | SHOWRAT | SHOWDECI |
      FROMDECI | TODECI | INTNEG | INTPLUS | INTSUB | INTMUL | INTDIV |
      INTMOD | BOOLNEG | BOOLAND | BOOLOR | EQUAL | LT | LTE | GT | GTE |
      ASSIGN | LPAREN | RPAREN | SEMI | COMMA | INTNUM of bigint | NOTEQUAL |
      RATNUM of rational | EOF | ID of AST.id | CLPAREN | CRPAREN | COMMENT
%nonterm PROGRAM of AST.Block | BLOCK of AST.Block | DECLS of AST.Decls | RATDECLS of AST.Ratdecls
         | INTDECLS of AST.Intdecls | BOOLDECLS of AST.Booldecls | PROCDECLS of AST.procdecls | 
         COMMANDS of AST.cmd | CMD of AST.cmd | EXP of AST.exp | VARDECLS of AST.Vardecls | 
         STRID of AST.ident | TCOMMANDS of AST.cmd




%name pl0

%subst PRINT for ID
%prefer 
%keyword RAT INT BOOL IF THEN ELSE FI WHILE DO OD PROC PRINT READ CALL MAKERAT SHOWRAT SHOWDECI FROMDECI TODECI

%noshift EOF
%nodefault

%start PROGRAM

%verbose
%%

(* the parser returns the value associated with the expression *)

PROGRAM : BLOCK       (BLOCK)
BLOCK : DECLS TCOMMANDS   (AST.block(DECLS, TCOMMANDS))
DECLS : VARDECLS PROCDECLS (AST.decls(VARDECLS, PROCDECLS))
VARDECLS : RATDECLS INTDECLS BOOLDECLS        (AST.vardecls(RATDECLS, INTDECLS, BOOLDECLS))
RATDECLS : RAT STRID   (AST.ratdecls(STRID))
            |           (AST.nullratdecls(AST.Empty))
INTDECLS : INT STRID    (AST.intdecls(STRID))
            |           (AST.nullintdecls(AST.Empty))
BOOLDECLS : BOOL STRID  (AST.booldecls(STRID))
            |           (AST.nullbooldecls(AST.Empty))
STRID : ID SEMI            (AST.uniident(ID, AST.Empty))
        | ID COMMA STRID        (AST.multiident(ID, STRID))
PROCDECLS : PROC ID BLOCK SEMI PROCDECLS (AST.multiprocdecls(ID, BLOCK ,PROCDECLS))
            |                 (AST.nullprocdecls((AST.Empty)))
TCOMMANDS : CLPAREN COMMANDS CRPAREN    (COMMANDS)
COMMANDS : CMD SEMI COMMANDS        (AST.multicmd(CMD, COMMANDS))
           |   (AST.nullcmd(AST.Empty))
CMD : ID ASSIGN EXP  (AST.AssignCmd(ID, AST.Assign, EXP))
      | CALL ID           (AST.UniOpCmd(AST.Call, AST.VarExp(ID)))
      | READ LPAREN ID RPAREN           (AST.UniOpCmd(AST.Read, AST.VarExp(ID)))
      | PRINT LPAREN EXP RPAREN     (AST.UniOpCmd(AST.Print, EXP))
      | WHILE EXP DO TCOMMANDS OD (AST.WhileCmd(EXP, TCOMMANDS))
      | IF EXP THEN TCOMMANDS ELSE TCOMMANDS FI  (AST.IteCmd(EXP, TCOMMANDS1, TCOMMANDS2))

EXP :     INTNUM               (AST.IntExp(INTNUM))
        | INTNEG EXP      (AST.UniExp(AST.Neg, EXP))
        | EXP INTPLUS EXP    (AST.BinExp(EXP1, AST.IntAdd, EXP2))
        | EXP INTSUB EXP     (AST.BinExp(EXP1, AST.IntSub, EXP2))
        | EXP INTMUL EXP   (AST.BinExp(EXP1, AST.IntMul, EXP2))
        | EXP INTDIV EXP     (AST.BinExp(EXP1, AST.IntDiv, EXP2))
        | EXP INTMOD EXP     (AST.BinExp(EXP1, AST.IntMod, EXP2))

        | RATNUM        (AST.RatExp(RATNUM))
        | EXP RATPLUS EXP    (AST.BinExp(EXP1, AST.RatAdd, EXP2))
        | EXP RATSUB EXP     (AST.BinExp(EXP1, AST.RatSub, EXP2))
        | EXP RATMUL EXP   (AST.BinExp(EXP1, AST.RatMul, EXP2))
        | EXP RATDIV EXP     (AST.BinExp(EXP1, AST.RatDiv, EXP2))
        | RATINV EXP         (AST.UniExp(AST.RatInv, EXP))
        | MAKERAT LPAREN EXP COMMA EXP RPAREN        (AST.BinExp(EXP1, AST.MakeRat, EXP2))
        | SHOWRAT EXP        (AST.UniExp(AST.ShowRat, EXP))
        | SHOWDECI EXP       (AST.UniExp(AST.ShowDecimal, EXP))
        | FROMDECI LPAREN RATNUM RPAREN     (AST.UniExp(AST.FromDecimal, AST.RatExp(RATNUM)))
        | TODECI EXP         (AST.UniExp(AST.toDecimal, EXP))

        | BOOLNUM                   (AST.BoolExp(BOOLNUM))
        | EXP GT EXP        (AST.BinExp((EXP1, AST.GT, EXP2)))
        | EXP GTE EXP       (AST.BinExp((EXP1, AST.GTE, EXP2)))
        | EXP LT EXP        (AST.BinExp((EXP1, AST.LT, EXP2)))
        | EXP LTE EXP       (AST.BinExp((EXP1, AST.LTE, EXP2)))
        | EXP EQUAL EXP     (AST.BinExp((EXP1, AST.Equal, EXP2)))
        | EXP NOTEQUAL EXP     (AST.BinExp((EXP1, AST.NotEqual, EXP2)))
        | EXP BOOLAND EXP (AST.BinExp(EXP1, AST.And, EXP2))
        | EXP BOOLOR EXP  (AST.BinExp(EXP1, AST.Or, EXP2))
        | BOOLNEG EXP         (AST.UniExp(AST.BoolNeg, EXP))
        | ID            (AST.VarExp(ID))
        | LPAREN EXP RPAREN (EXP)