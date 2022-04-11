even_permutation(L1, L2) :-
    permutation(L1, L2),
    sign(L1, X),
    sign(L2, Y),
    X = Y.

odd_permutation(L1, L2) :-
    permutation(L1, L2),
    sign(L1, X),
    sign(L2, Y),
    X \= Y.

sign(L, X) :-
    sign(L, 0, Y),
    (Y mod 2 =:= 0 -> X is 1; X is -1).

sign([], S, S).
sign([H | T], TS, S) :-
    less_than(H, T, X),
    NS is TS + X,
    sign(T, NS, S). 

less_than(X, L, N) :-
    less_than(X, L, 0, N).
less_than(_, [], N, N).
less_than(X, [H | T], TN, N) :-
    (H < X -> NN is TN + 1; NN is TN),
    less_than(X, T, NN, N).