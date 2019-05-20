% Find the K'th element of a list.
%     The first element in the list is number 1.
%     Example:
%     ?- element_at(X,[a,b,c,d,e],3).
%     X = c

kth_element(X, [X|_], 0).
kth_element(X, [_|T], K) :- K > 0, K1 is K - 1, kth_element(X, T, K1).
