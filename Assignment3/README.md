Grammar to accept Rational Numbers : ({START, MOD, NUM, RAT, I}, {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, e, ~}, P, START)
P : 
    START := ~ MOD
    MOD := NUM / NUM | NUM . RAT | NUM
    RAT := NUM ( NUM )
    NUM := I NUM | e
    I := 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9

Grammar to accept Rational Number Expression = ({A,B,C}, {r}, P, A)
r is a terminal which is a rational number
P :
    A := A + B | A - B | B
    B := B * C | B / C | C
    C := r

Design Decisions : 
(a) If no sign is mentioned then the number is by default understood to be positive, with a "~" the number is considered to be negative
(b) Using brackets is recommended for disambiguation
(c) In case of division a(int)/b(int)  is considered as a fraction and not the division operation
(d) In decimal form fractions need to be mentioned with appropirate brackets, 0.2 should be written as 0.2(0)

Acknowledgements : 
Porgram for the files calc.lex, calc.yacc and load-calc.sml has been borrowed from the official documentation of ml-lex and ml-yacc http://www.smlnj.org/doc/ML-Yacc/mlyacc007.html#toc14 to quite some extent