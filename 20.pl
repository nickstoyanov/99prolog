% Remove the K'th element from a list.
%     Example:
%     ?- remove_at(X,[a,b,c,d],2,R).
%     X = b
%     R = [a,c,d]

remove_at(X, [X, Y|T], 1, [Y|T]).
remove_at(X, [H|T], I, [H|R]) :- I > 0, I1 is I-1, remove_at(X, T, I1, R). 
