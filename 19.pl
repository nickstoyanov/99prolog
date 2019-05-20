% Rotate a list N places to the left.
%     Examples:
%     ?- rotate([a,b,c,d,e,f,g,h],3,X).
%     X = [d,e,f,g,h,a,b,c]

%     ?- rotate([a,b,c,d,e,f,g,h],-2,X).
%     X = [g,h,a,b,c,d,e,f]

%     Hint: Use the predefined predicates length/2 and append/3, as well as the result of problem P17.

len([], 0).
len([_|T], N) :- len(T, N1), N is N1 + 1.

split(T, 0, [], T).
split([H|T], N, [H|L1], L2) :- N > 0, N1 is N - 1, split(T, N1, L1, L2).

mod(A, B, R) :- A < 0, R is -A mod B.
mod(A, B, R) :- A > 0, R is -A mod B.

rotate(L, RI, R) :- RI > 0, len(L, N), mod(RI, N, AI), split(L, AI, L1, L2), append(L2, L1, R).
rotate(L, RI, R) :- RI < 0, len(L, N), mod(RI, N, AI), Size is N - AI, split(L, Size, L1, L2), append(L2, L1, R).
