/* Defining some basic arithmetic operations. */

/* Defining addition recursively. */

add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).

/* Defining multiplication similarly. */

mul(0,_,0).
mul(s(X),Y,Z) :- mul(X,Y,W), add(W,Y,Z).

/* Defining the factorial similarly. */

fact(0,s(0)) :- !.
fact(s(X),Z) :- fact(X,W), mul(s(X),W,Z).