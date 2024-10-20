/*
   Prolog code to solve the Zebra Puzzle.
   Statement of Zebra Puzzle taken from Wikipedia.
*/

ordering(Houses) :-
    length(Houses, 5),
    member(house(england,red,_,_,_), Houses),
    member(house(spain,_,dog,_,_), Houses),
    member(house(_,green,_,coffee,_), Houses),
    member(house(ukraine,_,_,tea,_), Houses),
    to_right(house(_,green,_,_,_), house(_,ivory,_,_,_), Houses),
    member(house(_,_,snail,_,oldgold), Houses),
    member(house(_,yellow,_,_,kools), Houses),
    Houses = [_,_,house(_,_,_,milk,_),_,_],
    Houses = [house(norway,_,_,_,_)|_],
    adjacent(house(_,_,fox,_,_), house(_,_,_,_,chester), Houses),
    adjacent(house(_,_,_,_,kools), house(_,_,horse,_,_), Houses),
    member(house(_,_,_,orange,lucky), Houses),
    member(house(japan,_,_,_,parl), Houses),
    adjacent(house(norway,_,_,_,_), house(_,blue,_,_,_), Houses),
    member(house(_,_,zebra,_,_), Houses),
    member(house(_,_,_,water,_), Houses).

to_right(A,B,L) :- append(_, [B,A|_], L).
adjacent(A,B,L) :- append(_, [A,B|_], L).
adjacent(A,B,L) :- append(_, [B,A|_], L).

/* length, member are in-built predicates */