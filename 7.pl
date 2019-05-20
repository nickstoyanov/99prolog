% Flatten a nested list structure.
%     Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

%     Example:
%     ?- my_flatten([a, [b, [c, d], e]], X).
%     X = [a, b, c, d, e]

%     Hint: Use the predefined predicates is_list/1 and append/3

is_list([]).
is_list([_]).
is_list([_|_]).

append([], R, R).
append([H|T], L, [H|R]) :- append(T, L, R).

flat([], []).
flat([H|T], R) :- is_list(H), flat(H, FH), flat(T, FT), append(FH, FT, R).
flat([H|T], [H|R]) :- flat(T, R).
