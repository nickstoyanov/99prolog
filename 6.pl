% Find out whether a list is a palindrome.
%     A palindrome can be read forward or backward; e.g. [x,a,m,a,x].

rev_helper([], L, L).
rev_helper([H|T], L, R) :- rev_helper(T, [H|L], R).

rev(L, R) :- rev_helper(L, [], R).

are_lists_equal([], []).
are_lists_equal([H|T], [H|T]).

palindrome(L) :- rev(L, R), are_lists_equal(L, R).
