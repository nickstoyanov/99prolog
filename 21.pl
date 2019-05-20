% Insert an element at a given position into a list.
%     Example:
%     ?- insert_at(alfa,[a,b,c,d],2,L).
%     L = [a,alfa,b,c,d]

insert_at_helper(X, T, I, I, [X|T]).
insert_at_helper(X, [H|T], I, CI, [H|R]) :- CI1 is CI + 1, insert_at_helper(X, T, I, CI1, R).

insert_at(X, L, I, R) :- I > 0,  insert_at_helper(X, L, I, 1, R).