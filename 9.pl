%Pack consecutive duplicates of list elements into sublists.
%If a list contains repeated elements they should be placed in separate sublists.
    %Example:
    %?- pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
    %X = [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]

first_part([X, Y|_], [X]) :- X \= Y.
first_part([X], [X]).
first_part([X, X|T], [X|R]) :- first_part([X|T], R).

second_part([X, Y|T], [Y|T]) :- X \= Y.
second_part([_], []).
second_part([_|T], R) :-second_part(T, R).

pack([], []).
pack(L, [E|R]) :- first_part(L, E), second_part(L, Rest), pack(Rest, R).
