:- use_module(library(clpfd)).

odcinek(X) :-
    X = [X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15, X16],
    X ins 0..1,
    sum(X, #=, 8),   
    (X9 + X10 + X11 + X12 + X13 + X14 + X15 + X16 #=< 8 * (1 - X1)),
    (X10 + X11 + X12 + X13 + X14 + X15 + X16 #=< 8 * (1 - X2)),
    (X11 + X12 + X13 + X14 + X15 + X16 #=< 8 * (1 - X3)),
    (X12 + X13 + X14 + X15 + X16 #=< 8 * (1 - X4)),
    (X13 + X14 + X15 + X16 #=< 8 * (1 - X5)),
    (X14 + X15 + X16 #=< 8 * (1 - X6)),
    (X15 + X16 #=< 8 * (1 - X7)),
    (X16 #=< 8 * (1 - X8)).