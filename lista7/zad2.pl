:- consult(zad1).

split(IN, OUT1, OUT2) :-
    freeze(IN, 
        (IN = [H | T] ->
            (OUT1 = [H | T1], split(T, OUT2, T1)) % raz do OUT1, raz do OUT2
            ;(OUT1 = [], OUT2 = []))). % IN jest pusty

merge_sort(IN, OUT) :-
    freeze(IN, 
        (IN = [_ | T] -> 
            (freeze(T, 
                (T = [] -> 
                    (IN = OUT) % ciag dlugosci 1
                    ;(split(IN, IN1, IN2),
                      merge_sort(IN1, OUT1),
                      merge_sort(IN2, OUT2),
                      merge(OUT1, OUT2, OUT)))))
            ;(OUT = []))). % IN jest puste
