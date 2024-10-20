/* 
   N-Queen Problem: Find an arrangement of
   n queens placed on an n x n chessboard 
   such that no two queens attack each other.
*/

/* 
   This Prolog code can generate all possible solutions
   for any finite n in the form of a list of length n,
   where the index of a number gives the column
   and the number at that index gives the row where that queen is.
   And so you get the position of all n queens from the list.
*/

n_queen_soln(N,Q_list) :-
    length(Q_list,N),
    no_attacks(Q_list, N).

no_attacks([], _).
no_attacks([Q|Q_list], N) :- 
    onetoN(N,L), 
    member(Q,L),
    place_safe_queen(Q_list, Q, 1, N),
    no_attacks(Q_list, N).

place_safe_queen([], _, _, _).
place_safe_queen([Q0|Q_list], Q, D0, N) :-
    onetoN(N,L),
    member(Q0,L),
    Q =\= Q0,
    abs(Q - Q0) =\= D0,
    D is D0+1,
    place_safe_queen(Q_list, Q, D, N).

onetoN(1,[1]) :- !.
onetoN(N,[N|L]) :- N1 is N-1, onetoN(N1,L).

/* length, member are in-built predicates */