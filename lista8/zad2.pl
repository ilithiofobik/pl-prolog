:- use_module(library(clpfd)).

plecak(Wartosci, Wielkosci, Pojemnosc, Zmienne):-
    length(Wartosci, L),
    length(Wielkosci, L),
    length(Zmienne, L),
    Zmienne ins 0..1,
    scalar_product(Wartosci, Zmienne, #= , Cel),
    scalar_product(Wielkosci, Zmienne, #=<, Pojemnosc),
    once(labeling([max(Cel)], Zmienne)).