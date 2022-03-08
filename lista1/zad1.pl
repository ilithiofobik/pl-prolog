ojciec(piotr, wojtek).
ojciec(piotr, julka).
ojciec(michał, piotr).

matka(gosia, wojtek).
matka(gosia, julka).

rodzic(piotr, wojtek).
rodzic(gosia, wojtek).
rodzic(piotr, julka).
rodzic(gosia, julka).
rodzic(michał, piotr).

mężczyzna(piotr).
mężczyzna(wojtek).

kobieta(gosia).
kobieta(julka).


jest_matką(X) :-
    matka(X, _).

jest_ojcem(X) :-
    ojciec(X, _).

jest_synem(X) :-
    mężczyzna(X), 
    rodzic(_, X).

rodzeństwo(X, Y) :-
    rodzic(Z, X), 
    rodzic(Z, Y), 
    X \= Y.

siostra(X, Y) :-
    kobieta(X), 
    rodzeństwo(X, Y).

dziadek(X, Y) :-
    ojciec(X, Z), 
    rodzic(Z, Y).