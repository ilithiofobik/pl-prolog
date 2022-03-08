is_composite(X, Y) :-
    X mod Y =:= 0.

is_composite(X, Y) :-
    Y * Y + 2 * Y + 1 =< X,
    is_composite(X, Y + 1).

is_prime(X) :-
    X > 1,
    \+ is_composite(X, 2).

prime(LO, HI, N) :-
    between(LO, HI, N),
    is_prime(N).