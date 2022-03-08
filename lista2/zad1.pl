środkowy([X], X).
środkowy([_ | T], X) :-
    reverse(T, R),
    R = [_ | L],
    środkowy(L, X).