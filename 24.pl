% Lotto: Draw N different random numbers from the set 1..M.
%     The selected numbers shall be put into a result list.
%     Example:
%     ?- lotto(6,6,49,L).
%     L = [23,1,17,33,21,37]

%     Hint: Combine the solutions of problems P22 and P23.

perm([], []).
perm([X], [X]).
perm(L, R) :- append(PF, [X|SF], L), 
              append(PF, SF, Res), 
              perm(Res, Res2), 
              append([X], Res2, R).

get_n_elements(_, 0, []).
get_n_elements([X|T], N, [X|R]) :- N > 0, N1 is N-1, get_n_elements(T, N1, R).

rnd_select(L, N, R) :- permutation(L, PL), get_n_elements(PL, N, R).

range(B, B, [B]).
range(A, B, [A|R]) :- A < B, A1 is A + 1, range(A1, B, R).

lotto(N, A, B, R) :- range(A, B, Res), rnd_select(Res, N, R).