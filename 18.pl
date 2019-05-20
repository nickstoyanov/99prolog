% Extract a slice from a list.
%     Given two indices, I and K, the slice is the list containing the elements between the I'th and K'th element of the original list (both limits included). Start counting the elements with 1.

%     Example:
%     ?- slice([a,b,c,d,e,f,g,h,i,k],3,7,L).
%     X = [c,d,e,f,g]

split(T, 0, [], T).
split([H|T], N, [H|L1], L2) :- N > 0, N1 is N - 1, split(T, N1, L1, L2).

take_size(_, 0, []).
take_size([H|T], N, [H|R]) :- N > 0, N1 is N -1, take_size(T, N1, R). 

slice(L, Start, Stop, R) :- Start =< Stop, Size is Stop - Start, split(L, Start, _, L2), take_size(L2, Size, R).
