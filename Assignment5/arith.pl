printeq([], []).
printeq([Head | Tail], [H | L]) :- H = "=",write(H), printeq([Head | Tail], L);
                                  H \= "=", write(H), write(Head), printeq(Tail, L).
getval([], [], 0).
getval([Head | Tail], [H | L], Val) :- H = "+", Temp is Val - Head, getval(Tail, L, Temp) ;
                                       H = "-", Temp is Val + Head, getval(Tail, L, Temp).
checkeval([Head | Tail], Val, [H | L]) :- H = "+", Temp is Val + Head, checkeval(Tail, Temp, L) ;
                                          H = "-", Temp is Val - Head, checkeval(Tail, Temp, L) ;
                                          H = "=", getval([Head | Tail], L, Val).
checklist([Head | Tail]) :- Head \= "=".
arith(Nums) :- checkeval(Nums, 0, L), checklist(L), printeq(Nums, L).