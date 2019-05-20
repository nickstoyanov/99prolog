% Reverse a list.

rev_helper([], L, L).
rev_helper([H|T], L, R) :- rev_helper(T, [H|L], R).

rev(L, R) :- rev_helper(L, [], R).
