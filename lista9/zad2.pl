:- use_module(library(clpfd)).

squares([], _, _, [], []).
squares([R | Rozmiary_], Szerokosc, Wysokosc, [X, Y | Wspolrzedne_], [f(X, R, Y, R) | Kwadraty_]) :-
    X #>= 0, X + R #=< Szerokosc,
    Y #>= 0, Y + R #=< Wysokosc,
    squares(Rozmiary_, Szerokosc, Wysokosc, Wspolrzedne_, Kwadraty_).

kwadraty(Rozmiary, Szerokosc, Wysokosc, Wspolrzedne) :-
    squares(Rozmiary, Szerokosc, Wysokosc, Wspolrzedne, Kwadraty),
    disjoint2(Kwadraty),
    once(labeling([], Wspolrzedne)).
