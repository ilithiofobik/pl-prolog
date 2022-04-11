not(wyrazenie([], _, _)).
wyrazenie([X], X, X).
wyrazenie(List, Val, X + Y):-
    operator(List, X, Y, Val1, Val2),
    Val is Val1 + Val2.
wyrazenie(List, Val, X - Y):-
    operator(List, X, Y, Val1, Val2),
    Val is Val1 - Val2.
wyrazenie(List, Val, X * Y):-
    operator(List, X, Y, Val1, Val2),
    Val is Val1 * Val2.
wyrazenie(List, Val, X / Y):-
    operator(List, X, Y, Val1, Val2),
    Val2 =\= 0,
    Val is Val1 / Val2.

operator(List, E1, E2, Val1, Val2):-
    append([L11 | L12], [L21 | L22], List),
    wyrazenie([L11 | L12], Val1, E1),
    wyrazenie([L21 | L22], Val2, E2).