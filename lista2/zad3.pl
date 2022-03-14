arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

os(A, A, []).

os(X, Y, V) :-
    arc(X, Z),
    \+ member(Z, V),
    (Y = Z;
    os(Z, Y, [X | V])).

osiągalny(X, Y) :-
    os(X, Y, []).