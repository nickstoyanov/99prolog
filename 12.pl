% Decode a run-length encoded list.
%     Given a run-length code list generated as specified in problem P11. Construct its uncompressed version.

get_length([_, N], N) :- !.
get_length(_, 0) :- !.

get_element([X, _], X) :- !.
get_element(X, X) :- !.

duplicate_element(_, 0, []).
duplicate_element(X, N, [X|R]) :- N > 0, N1 is N - 1, duplicate_element(X, N1, R).

decode_helper([], []).
decode_helper([H|T], [Res|R]) :- get_element(H, E), get_length(H, EN), duplicate_element(E, EN, Res), decode_helper(T, R).

fold_once([], []).
fold_once([H|T], R) :- is_list(H), fold_once(T, Res), append(H, Res, R).
fold_once([H|T], [H|R]) :- not(is_list(H)), fold_once(T, R).

decode(L, R) :- decode_helper(L, Res), fold_once(Res, R).
