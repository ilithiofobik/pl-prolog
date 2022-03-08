arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

osiągalny(X, X).
osiągalny(X, Z) :-
    arc(X, Y),
    osiągalny(Y, Z).