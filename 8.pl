% Eliminate consecutive duplicates of list elements.
%     If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

%     Example:
%     ?- compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%     X = [a,b,c,a,d,e]

get_first([H|T], H).

split_on_different_element([X], [X], []).
split_on_different_element([X, Y|T], [X], [Y|T]) :- X \= Y, !.
split_on_different_element([H|T], [H|X], Y) :- split_on_different_element(T, X, Y).

compress([], []).
compress(L, [FE|R]) :- split_on_different_element(L, F, S), get_first(F, FE), compress(S, R).

