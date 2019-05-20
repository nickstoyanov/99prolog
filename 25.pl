% Generate a random permutation of the elements of a list.
%     Example:
%     ?- rnd_permu([a,b,c,d,e,f],L).
%     L = [b,a,d,c,e,f]

%     Hint: Use the solution of problem P23.

rnd_permu([], []).
rnd_permu([X], [X]).
rnd_permu(L, R) :- append(PF, [X|SF], L), 
                    append(PF, SF, Res), 
                    rnd_permu(Res, Res2), 
                    append([X], Res2, R).
