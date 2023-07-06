PROGRAM : BLOCK       
BLOCK : DECLS TCOMMANDS   
DECLS : VARDECLS PROCDECLS 
VARDECLS : RATDECLS INTDECLS BOOLDECLS        
RATDECLS : RAT STRID   
            |           
INTDECLS : INT STRID    
            |           
BOOLDECLS : BOOL STRID  
            |           
STRID : ID SEMI            
        | ID COMMA STRID        
PROCDECLS : PROC ID BLOCK SEMI PROCDECLS 
            |                 
TCOMMANDS : CLPAREN COMMANDS CRPAREN    
COMMANDS : CMD SEMI           
           | CMD SEMI COMMANDS  
CMD : ID ASSIGN EXP  
      | CALL ID           
      | READ LPAREN ID RPAREN          
      | PRINT LPAREN EXP RPAREN     
      | WHILE EXP DO TCOMMANDS OD 
      | IF EXP THEN TCOMMANDS ELSE TCOMMANDS FI  

EXP :     INTNUM               
        | INTNEG EXP      
        | EXP INTPLUS EXP    
        | EXP INTSUB EXP    
        | EXP INTMUL EXP   
        | EXP INTDIV EXP     
        | EXP INTMOD EXP    

        | RATNUM        
        | EXP RATPLUS EXP    
        | EXP RATSUB EXP     
        | EXP RATMUL EXP   
        | EXP RATDIV EXP     
        | RATINV EXP         
        | MAKERAT LPAREN EXP COMMA EXP RPAREN        
        | SHOWRAT EXP       
        | SHOWDECI EXP      
        | FROMDECI LPAREN RATNUM RPAREN     
        | TODECI EXP         

        | BOOLNUM               
        | EXP GT EXP     
        | EXP GTE EXP     
        | EXP LT EXP      
        | EXP LTE EXP       
        | EXP EQUAL EXP     
        | EXP NOTEQUAL EXP     
        | EXP BOOLAND EXP 
        | EXP BOOLOR EXP  
        | BOOLNEG EXP         
        | ID            
        | LPAREN EXP RPAREN 