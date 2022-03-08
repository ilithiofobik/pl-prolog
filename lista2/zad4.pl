:- use_module(library(clpfd)).

jednokrotnie(X, L) :-
    select(X, L, B),
    \+ member(X, B).

dwukrotnie(X, L) :-
    select(X, L, B),
    jednokrotnie(X, B).

lista(0, []).
lista(N, L) :-
    length(L, Len),
    Len =:= 2 * N,
    dwukrotnie(N, L),
    nth0(I0, L, N),
    nth0(I1, L, N),
    I0 < I1,
    (I1 - I0) mod 2 =:= 1,
    select(N, L, L1),
    select(N, L1, L2),
    M #= N - 1,
    number(M),
    lista(M, L2).