wariancja(L, Var) :-
    dane(L, EX, EX2),
    length(L, Len),
    REX is EX / Len,
    REX2 is EX2 / Len,
    Var is REX2 - REX * REX.

dane(L, EX, EX2) :-
    listaakum(L, 0, EX, 0, EX2).

listaakum([], EX, EX, EX2, EX2).
listaakum([H | T], TEX, EX, TEX2, EX2) :-
    NEX is TEX + H,
    H2 is H * H,
    NEX2 is TEX2 + H2,
    listaakum(T, NEX, EX, NEX2, EX2).