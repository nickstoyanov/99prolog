%Duplicate the elements of a list a given number of times.
%    Example:
%    ?- dupli([a,b,c],3,X).
%    X = [a,a,a,b,b,b,c,c,c]
%    What are the results of the goal:
%    ?- dupli(X,3,Y).

append([], R, R).
append([H|T], L, [H|R]) :- append(T, L, R).

is_list([]).
is_list([_]).
is_list([_|_]).

fold_once([], []).
fold_once([H|T], R) :- is_list(H), fold_once(T, Res), append(H, Res, R).
fold_once([H|T], [H|R]) :- fold_once(T, R).

duplicate_element(_, 0, []).
duplicate_element(X, N, [X|R]) :- N > 0, N1 is N - 1, duplicate_element(X, N1, R).

dupli_helper([], _, []).
dupli_helper([H|T], N, [EL|R]) :- duplicate_element(H, N, EL), dupli_helper(T, N, R).

dupli(L, N, R) :- dupli_helper(L, N, Res), fold_once(Res, R).
