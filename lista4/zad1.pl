wyrazenie_baza([X], X, X).
wyrazenie_baza(List, Val, X + Y) :-
    operator(List, X, Y, Val1, Val2),
    Val is Val1 + Val2.
wyrazenie_baza(List, Val, X - Y) :-
    operator(List, X, Y, Val1, Val2),
    Val is Val1 - Val2.
wyrazenie_baza(List, Val, X * Y) :-
    operator(List, X, Y, Val1, Val2),
    Val is Val1 * Val2.
wyrazenie_baza(List, Val, X / Y) :-
    operator(List, X, Y, Val1, Val2),
    Val2 =\= 0,
    Val is Val1 / Val2.

operator(List, E1, E2, Val1, Val2):-
    append([L11 | L12], [L21 | L22], List),
    wyrazenie_baza([L11 | L12], Val1, E1),
    wyrazenie_baza([L21 | L22], Val2, E2).

wyrazenie(L, V, E) :-
    wyrazenie_baza(L, V, E), !.