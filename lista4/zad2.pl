left(X, Y, [X, Y | _]).
left(X, Y, [_ | Z]):-
    left(X, Y, Z).

next_to(X, Y, List):-
    left(X, Y, List).
next_to(X, Y, List):-
    left(Y, X, List).

rybki(Kto):-
    Domy = [[1, _, norweg, _, _, _],
            [2, _, _, _, _, _],
            [3, _, _, _, mleko, _],
            [4, _, _, _, _, _],
            [5, _, _, _, _, _]],
    member([_, czerwony, anglik, _, _, _], Domy),
    member([_, _, dunczyk, _, herbata, _], Domy),
    member([_, zolty, _, _, _, cygara], Domy),
    member([_, _, niemiec, _, _, fajka], Domy),
    member([_, _, _, ptaki, _, bez_filtra], Domy),
    member([_, _, szwed, psy, _, _], Domy),
    next_to([_, _, norweg, _, _, _], [_, niebieski, _, _, _, _], Domy),
    next_to([_, _, _, konie, _, _], [_, zolty, _, _, _, _], Domy),
    member([_, _, _, _, piwo, mentolowe], Domy),
    member([_, zielony, _, _, kawa, _], Domy),
    next_to([_, _, _, _, _, light], [_, _, _, _, woda, _], Domy),
    next_to([_, _, _, _, _, light], [_, _, _, koty, _, _], Domy),
    left([_, zielony, _, _, _, _], [_, bialy, _, _, _, _], Domy), 
    member([_, _, Kto, rybki, _, _], Domy).