% Create a list containing all integers within a given range.
%     Example:
%     ?- range(4,9,L).
%     L = [4,5,6,7,8,9]

range(B, B, [B]).
range(A, B, [A|R]) :- A < B, A1 is A + 1, range(A1, B, R).