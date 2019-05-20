% Find the last element of a list.
%     Example:
%     ?- my_last(X,[a,b,c,d]).
%     X = d

last_element(X, [X]).
last_element(X, [_|T]) :- last_element(X, T).
