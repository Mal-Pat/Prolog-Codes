/*
   This file defines basic list predicates from scratch
   To avoid clashing with pre-defined predicates, different names are used.
*/

/* Defining a list using the in-built syntax */

lists([]).
lists([_|L]) :- lists(L).

/* memof(X,L) is True iff X is a member of L */

memof(X,[X|_]) :- !.
memof(X,[_|L]) :- memof(X,L).

/* len(L,X) is True iff X is the len of L */

len([],0).
len([_|L],Len1) :- len(L,Len2), Len1 is Len2+1.

/* appen(L1,L2,L3) is True iff L1 appended to L2 gives L3 */

appen([],L,L) :- !.
appen([X|L1],L2,[X|L3]) :- appen(L1,L2,L3).

/* revers(L1,L2) is True iff L2 is L1 reversed. */

revers([],[]).
revers([X|L1],L2) :- revers(L1,L1rev),appen(L1rev,[X],L2).

/* unique(L) is True iff every member of L is unique. */

unique([]).
unique([X|L]) :- not(memof(X,L)), unique(L).

/* del(X,L1,L2) is True iff deleting X from L1 gives L2. */

del(X,L1,L2) :- appen(M1,[X|M2],L1), appen(M1,M2,L2).

/* same(L1,L2) is True iff L1 and L2 have the same elements (in any order). */

same([],[]).
same([X|L],M) :- memof(X,M), del(X,M,M2), same(L,M2).