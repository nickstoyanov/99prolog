% Find the last but one element of a list.

penultimate_element(X, [X, _]).
penultimate_element(X, [_|T]) :- penultimate_element(X, T).
