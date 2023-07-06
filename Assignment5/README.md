the name of the files have the extension .pl and not .P, open the prolog interpreter using swipl, then to run queries for a particular files
type in [filename]. the "." is essential, to run a prticular query type in the name of the function with arguments followed by a ".".


subsequence(S, L) : no assumptions, except for the problem statement

has_no_triplicates(L) : no assumptions, except for the problem statement

arith(L) : a collon needs to be typed in everytime for a new valid solution to be seen on command-line, the solution is of the format, 
           +/- followed by an element of the list, Example,
            arith([1,-2,1,2])
            a valid solution for this query is, +1--2=+1+2
            the + in the begining explicitly specifies the sign of the number and acts as a unary operator.
            --2 in this solution is basically -(-2) where -2 is an element of the input list.


ABCD.pl : to run this file type in ['ABCD.pl']  after opening the prolog interpreter. To see the paths, type in makeroute(S, A), this gives
          S a list of paths and A the person that paddles twice. The path is represented as a list of list, where in case of two elements the first element represents the person paddling, the order of paddles is left to right, right to left, left to right, right to left, left to right. Thus S contains 5 lists inside it. For seeing more solutions, ";" needs to be typed in.
          Example :
          [["Davis", "Alice"], ["Alice"], ["Carol", "Alice"], ["Carol"], ["Bob", "Carol"]]
          This means Davis, Alice paddle left to right(Davis paddles).
          Alice paddles alone from right to left.
          Carol and Alice paddle left to right(Carol paddles).
          Carol paddles back from right to left.
          Bob, Carol paddle from left to right(Bob paddles).