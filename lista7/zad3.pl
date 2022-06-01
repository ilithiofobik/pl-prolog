filozofowie() :-
    mutex_create(F1),
    mutex_create(F2),
    mutex_create(F3),
    mutex_create(F4),
    mutex_create(F5),
    thread_create(filozof(1, F1, F2), _, [detach(true)]),
    thread_create(filozof(2, F2, F3), _, [detach(true)]),
    thread_create(filozof(3, F3, F4), _, [detach(true)]),
    thread_create(filozof(4, F4, F5), _, [detach(true)]),
    thread_create(filozof(5, F5, F1), _, [detach(true)]).

spaces(0, '') :- !.
spaces(N, S) :-
    N1 is N - 1,
    spaces(N1, S1), !,
    atom_concat(' ', S1, S).

filozof(ID, LF, RF) :-
    random(R),
    sleep(R),
    spaces(ID, S),
    format('~w[~w] mysli~n', [S, ID]),
    format('~w[~w] chce prawy widelec~n', [S, ID]),
    mutex_lock(RF),
    format('~w[~w] podniosl prawy widelec~n', [S, ID]),
    format('~w[~w] chce lewy widelec~n', [S, ID]),
    mutex_lock(LF),
    format('~w[~w] podniosl lewy widelec~n', [S, ID]),
    format('~w[~w] je~n', [S, ID]),
    format('~w[~w] odklada lewy widelec~n', [S, ID]),
    mutex_unlock(LF),
    format('~w[~w] odklada prawy widelec~n', [S, ID]),
    mutex_unlock(RF),
    filozof(ID, LF, RF).
