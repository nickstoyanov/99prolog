% Extract a given number of randomly selected elements from a list.
%     The selected items shall be put into a result list.
%     Example:
%     ?- rnd_select([a,b,c,d,e,f,g,h],3,L).
%     L = [e,d,a]

%     Hint: Use the built-in random number generator random/2 and the result of problem P20.

perm([], []).
perm([X], [X]).
perm(L, R) :- append(PF, [X|SF], L), 
              append(PF, SF, Res), 
              perm(Res, Res2), 
              append([X], Res2, R).

get_n_elements(_, 0, []).
get_n_elements([X|T], N, [X|R]) :- N > 0, N1 is N-1, get_n_elements(T, N1, R).

rnd_select(L, N, R) :- permutation(L, PL), get_n_elements(PL, N, R).