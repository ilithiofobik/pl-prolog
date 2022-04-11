max_sum(L, Best) :-
    listaakum(L, 0, _, 0, Best).

listaakum([], Curr, Curr, Best, Best).
listaakum([H | T], TCurr, Curr, TBest, Best) :-
    (TCurr + H > 0 -> NCurr is TCurr + H; NCurr is 0),
    (NCurr > TBest -> NBest is NCurr; NBest is TBest),
    listaakum(T, NCurr, Curr, NBest, Best).