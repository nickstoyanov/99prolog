% Modified run-length encoding.
%     Modify the result of problem P10 in such a way that if an element has no duplicates 
%     it is simply copied into the result list. Only elements with duplicates are transferred as [N,E] terms.

%     Example:
%     ?- encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%     X = [[4,a],b,[2,c],[2,a],d,[4,e]]

get_first([H|T], H).

len([], 0).
len([H|T], N) :- len(T, N1), N is N1 + 1.

split_on_different_element([X], [X], []).
split_on_different_element([X, Y|T], [X], [Y|T]) :- X \= Y, !.
split_on_different_element([H|T], [H|X], Y) :- split_on_different_element(T, X, Y).

encode([], []).
encode(L, [[FE, N]|R]) :- split_on_different_element(L, F, S), len(F, N), N > 1, get_first(F, FE), encode(S, R).
encode(L, [FE|R]) :- split_on_different_element(L, F, S), len(F, N), get_first(F, FE), encode(S, R).
