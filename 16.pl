% Drop every N'th element from a list.
%     Example:
%     ?- drop([a,b,c,d,e,f,g,h,i,k],3,X).
%     X = [a,b,d,e,g,h,k]

drop_helper([], _, _, []).
drop_helper([X], _, _, [X]).
drop_helper([_, Y|T], I, CI, R) :- I > 0, I == CI, 
    drop_helper([Y|T], I, 0, R).
drop_helper([X, Y|T], I, CI, [X|R]) :- I > 0, CI < I, 
    CI1 is CI + 1, drop_helper([Y|T], I, CI1, R). 

drop(L, I, R) :- drop_helper(L, I, 0, R).