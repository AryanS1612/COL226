no_existence([], _).
no_existence([Head | Tail], Num) :- Head \= Num , no_existence(Tail, Num).
has_no_duplicates([], _).
has_no_duplicates([Head | Tail], Num) :- Head = Num, no_existence(Tail, Num).
has_no_duplicates([Head | Tail], Num) :- Head \= Num, has_no_duplicates(Tail, Num).
has_no_triplicates([]).
has_no_triplicates([Head | Tail]) :- has_no_duplicates(Tail, Head), has_no_triplicates(Tail).