above(bicycle, pencil).
above(camera, butterfly).

above_rec(Block1, Block2) :-
    above(Block1, Block2).
above_rec(Block1, Block3) :-
    above(Block1, Block2), 
    above_rec(Block2, Block3).

left_of(pencil, sandglass).
left_of(sandglass, butterfly).
left_of(butterfly, fish).

left_of_rec(Block1, Block2) :-
    left_of(Block1, Block2).
left_of_rec(Block1, Block3) :-
    left_of(Block1, Block2), 
    left_of_rec(Block2, Block3).

right_of(Object1, Object2) :-
    left_of(Object2, Object1).

below(Object1, Object2) :-
    above(Object2, Object1).

right_of_rec(Object1, Object2) :-
    left_of_rec(Object2, Object1).

below_rec(Object1, Object2) :-
    above_rec(Object2, Object1).

higher(Object1, Object2) :-
    above_rec(Object1, Object2).
higher(Object1, Object2) :-
    above_rec(Object1, Object3), 
    left_of_rec(Object2, Object3). 
higher(Object1, Object2) :- 
    above_rec(Object1, Object3), 
    right_of_rec(Object2, Object3).