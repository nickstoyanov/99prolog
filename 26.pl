% Generate the combinations of K distinct objects chosen from the N elements of a list
%     In how many ways can a committee of 3 be chosen from a group of 12 people? 
%     We all know that there are C(12,3) = 220 possibilities (C(N,K) denotes the well-known binomial coefficients). 
%     For pure mathematicians, this result may be great. But we want to really generate all the possibilities (via backtracking).

%     Example:
%     ?- combination(3,[a,b,c,d,e,f],L).
%     L = [a,b,c] ;
%     L = [a,b,d] ;
%     L = [a,b,e] ;
%     ... 

subset([], []).
subset([H|T], [H|R]) :- subset(T,R).
subset([_|T], R) :- subset(T, R).

len([], 0).
len([_|T], N) :- len(T, N1), N is N1 + 1.

combination(K, L, R) :- subset(L, R), len(R, K).
