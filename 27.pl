% Group the elements of a set into disjoint subsets.
%     a) In how many ways can a group of 9 people work in 3 disjoint subgroups of 2, 3 and 4 persons? Write a predicate that generates all the possibilities via backtracking.

%     Example:
%     ?- group3([aldo,beat,carla,david,evi,flip,gary,hugo,ida],G1,G2,G3).
%     G1 = [aldo,beat], G2 = [carla,david,evi], G3 = [flip,gary,hugo,ida]
%     ...

%     b) Generalize the above predicate in a way that we can specify a list of group sizes and the predicate will return a list of groups.

%     Example:
%     ?- group([aldo,beat,carla,david,evi,flip,gary,hugo,ida],[2,2,5],Gs).
%     Gs = [[aldo,beat],[carla,david],[evi,flip,gary,hugo,ida]]
%     ...

%     Note that we do not want permutations of the group members; i.e. [[aldo,beat],...] is the same solution as [[beat,aldo],...]. However, we make a difference between [[aldo,beat],[carla,david],...] and [[carla,david],[aldo,beat],...].

%     You may find more about this combinatorial problem in a good book on discrete mathematics under the term "multinomial coefficients". 

% a)
len([], 0).
len([_|T], N) :- len(T, N1), N is N1 + 1.

modded_subset([], [], []).
modded_subset([H|T], [H|R], Z) :- modded_subset(T, R, Z).
modded_subset([H|T], R, [H|Z]) :- modded_subset(T, R, Z).

group3(L, G1, G2, G3) :- modded_subset(L, G1, R1), len(G1, 2),
    					 modded_subset(R1, G2, R2), len(G2, 3),
					     modded_subset(R2, G3, _), len(G3, 4).

% b)
group(_, [], []).
group(L, [H|T], [G|R]) :-     modded_subset(L, G, Rest), len(G, H),
                              group(Rest, T, R).
                            