% Run-length encoding of a list.
%     Use the result of problem P09 to implement the so-called run-length encoding data compression method. 
%     Consecutive duplicates of elements are encoded as terms [N,E] where N is the number of duplicates of the element E.

%     Example:
%     ?- encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%     X = [[4,a],[1,b],[2,c],[2,a],[1,d][4,e]]

get_first([H|T], H).

len([], 0).
len([H|T], N) :- len(T, N1), N is N1 + 1.

split_on_different_element([X], [X], []).
split_on_different_element([X, Y|T], [X], [Y|T]) :- X \= Y, !.
split_on_different_element([H|T], [H|X], Y) :- split_on_different_element(T, X, Y).

encode([], []).
encode(L, [[FE, N]|R]) :- split_on_different_element(L, F, S), len(F, N), get_first(F, FE), encode(S, R).
