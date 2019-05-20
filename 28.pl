% Sorting a list of lists according to length of sublists
%     a) We suppose that a list (InList) contains elements that are lists themselves. 
%        The objective is to sort the elements of InList according to their length. 
%        E.g. short lists first, longer lists later, or vice versa.

%     Example:
%     ?- lsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]],L).
%     L = [[o], [d, e], [d, e], [m, n], [a, b, c], [f, g, h], [i, j, k, l]]

%     b) Again, we suppose that a list (InList) contains elements that are lists themselves. 
        %  But this time the objective is to sort the elements of InList according to their length frequency; 
        %  i.e. in the default, where sorting is done ascendingly, lists with rare lengths are placed first, 
        %  others with a more frequent length come later.

%     Example:
%     ?- lfsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]],L).
%     L = [[i, j, k, l], [o], [a, b, c], [f, g, h], [d, e], [d, e], [m, n]]

%     Note that in the above example, the first two lists in the result L have length 4 and 1, both lengths appear just once. The third and forth list have length 3 which appears, there are two list of this length. And finally, the last three lists have length 2. This is the most frequent length. 

% a)

perm([], []).
perm(L, R) :- append(PF, [X|SF], L),
    		  append(PF, SF, Res),
    		  perm(Res, NewRes),
    		  append([X], NewRes, R).

len([], 0).
len([_|T], N) :- len(T, N1), N is N1 + 1.

lsort(L, R) :- perm(L, R), not((append(_, [X,Y|_], R), len(X, XN), len(Y, YN), XN > YN)).

% b)
get_same_size_count([], _, 0).
get_same_size_count([H|T], K, N) :- get_same_size_count(T, K, N1), len(H, K), N is N1 + 1. 
get_same_size_count([H|T], K, N) :- get_same_size_count(T, K, N), len(H, NotK), NotK \= K.

lfsort(L, R) :- perm(L, R), 
    not((append(PF, [X,Y|SF], R), len(X, XN), len(Y, YN), append(PF, [Y|SF], NoXList), append(PF, [X|SF], NoYList), 
    get_same_size_count(NoXList, XN, XNCount),
    get_same_size_count(NoYList, YN, XYCount),
    XNCount > XYCount)).
