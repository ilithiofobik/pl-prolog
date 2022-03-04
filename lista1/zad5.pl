le(a, b).
le(b, c).
le(a, c).
le(a, d).
le(a, a).
le(b, b).
le(c, c).
le(d, d).

reflexivity() :- 
    \+ ((le(X, _); le(_, X)), \+ le(X, X)).
transivity() :- 
    \+ (le(X, Y), le(Y, Z), \+ le(X, Z)).
antisymmetry() :- 
    \+ (le(X, Y), le(Y, X), Y \= X).

częściowy_porządek() :-
    reflexivity(), 
    transivity(), 
    antisymmetry().