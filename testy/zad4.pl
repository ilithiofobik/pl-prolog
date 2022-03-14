le(a, b).
le(b, c).
le(a, c).
le(a, d).
le(a, a).
le(b, b).
le(c, c).
le(d, d).


maksymalny(X) :-
    \+ (le(X, Y), Y \= X).
minimalny(X) :-
    \+ (le(Y, X), Y \= X).
największy(X) :-
    \+ ((le(Y, _); le(_, Y)), \+ le(Y, X)).
najmniejszy(X) :-
    \+ ((le(Y, _); le(_, Y)), \+ le(X, Y)).