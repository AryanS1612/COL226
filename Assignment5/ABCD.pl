canpaddle("Carol", "Alice"). canpaddle("Carol", "Bob"). canpaddle("Carol", "Davis"). canpaddle("Davis", "Alice"). canpaddle("Davis", "Bob"). canpaddle("Davis", "Carol"). canpaddle("Bob", "Carol").
exist(X, [H | _]) :- X = H.
exist(X, [H | L]) :- exist(X, L).
remove(X, [X | L], L).
remove(X, [H | L], [H | S]) :- X \= H, remove(X, L, S).
check_possible([], _, []).
check_possible(L, R, [[H1 , H2] , [H3] | P]) :- exist(H1, L), exist(H2, L), canpaddle(H1, H2), remove(H1, L, Res), remove(H2, Res, Res1), 
                                                exist(H3, [H1 , H2 | R]), remove(H3, [H1 , H2 | R], Res2), check_possible([H3 | Res1], Res2, P).
check_possible(L, R, [[H1 , H2]]) :- exist(H1, L), exist(H2, L), canpaddle(H1, H2), remove(H1, L, Res), remove(H2, Res, Res1), 
                                   check_possible(Res1, [H1 , H2 | R], []).
checklist(X, [[X | _] | _]).
checklist(X, [[H | _] | L]) :- X \= H, checklist(X, L).
paddletwice(X, [[X | _] | L]) :- checklist(X, L).
paddletwice(X, [[H | _] | L]) :- paddletwice(X, L).
makeroute(S, A) :- check_possible(["Alice", "Bob", "Carol", "Davis"], [], S), checklist("Alice", S), checklist("Bob", S), checklist("Carol", S), checklist("Davis", S),
                paddletwice(A, S). 