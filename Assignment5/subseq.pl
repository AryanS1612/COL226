subsequence([], _).
subsequence([Head1 | Tail1], [Head2 | Tail2]) :- Head1 = Head2 -> subsequence(Tail1, Tail2) ; subsequence([Head1 | Tail1], Tail2).