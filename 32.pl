% Determine the greatest common divisor of two positive integer numbers.
%     Use Euclid's algorithm.
%     Example:
%     ?- gcd(36, 63, G).
%     G = 9

%     Define gcd as an arithmetic function; so you can use it like this:
%     ?- G is gcd(36,63).
%     G = 9

betw(A, B, A) :- A =< B.
betw(A, B, X) :- A < B, A1 is A + 1, betw(A1, B, X).

is_integer(0).
is_integer(N) :- N > 0, N1 is N - 1, is_integer(N1).

int(N) :- Prod is N*N, is_integer(Prod).

is_divisible(X, Y) :- Z is X / Y, int(Z).

min(X, Y, R) :- X =< Y, R is X.
min(X, Y, R) :- X > Y, R is Y.

gcd(X, Y, NewN) :- min(X, Y, Min), betw(2, Min, R), NewN is X - R, is_divisible(X, NewN), is_divisible(Y, NewN), !.


