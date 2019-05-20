% Run-length encoding of a list (direct solution).
%     Implement the so-called run-length encoding data compression method directly. 
%     I.e. don't explicitly create the sublists containing the duplicates, as in problem P09, 
%     but only count them. As in problem P11, simplify the result list by replacing the singleton terms [1,X] by X.

%     Example:
%     ?- encode_direct([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%     X = [[4,a],b,[2,c],[2,a],d,[4,e]]

get_first([X|_], X).

encode_direct_helper([], _, _, []).
encode_direct_helper([X], X, N, [[X, N]]) :- N > 1.
encode_direct_helper([X], X, N, [X]) :- N == 1.
encode_direct_helper([X, X|T], X, N, R) :- N1 is N + 1, encode_direct_helper([X|T], X, N1, R).
encode_direct_helper([X, Y|T], X, N, [[X, N]|R]) :- encode_direct_helper([Y|T], Y, 1, R), X \= Y, N > 1.
encode_direct_helper([X, Y|T], X, N, [X|R]) :- encode_direct_helper([Y|T], Y, 1, R), X \= Y, N == 1.

encode_direct(L, R) :- get_first(L, X), encode_direct_helper(L, X, 1, R).
