coin([], [], 0).

coin([X|C], [Y|N], A0) :-
    length(C, Len), length(N, Len),
    Max is (A0//X)+1,
    zerotoN(Max,L),
    member(Y,L),
    A1 is (A0-(X*Y)),
    coin(C, N, A1).

zerotoN(0,[0]) :- !.
zerotoN(N,[N|L]) :- M is N-1, zerotoN(M,L), !.
