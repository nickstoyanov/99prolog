% Determine whether a given integer number is prime.
%     Example:
%     ?- is_prime(7).
%     Yes

betw(A, B, A) :- A =< B.
betw(A, B, X) :- A < B, A1 is A + 1, betw(A1, B, X).

is_integer(0).
is_integer(N) :- N > 0, N1 is N - 1, is_integer(N1).

is_prime(2) :- !.
is_prime(3) :- !.
is_prime(N) :- N > 0, N1 is N - 1, not((betw(2, N1, NewN), Z is N / NewN, is_integer(Z))).
