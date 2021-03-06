keyWord(read).
keyWord(write).
keyWord(if).
keyWord(then).
keyWord(else).
keyWord(fi).
keyWord(while).
keyWord(do).
keyWord(od).
keyWord(and).
keyWord(or).
keyWord(mod).

separator(';').
separator('+').
separator('-').
separator('*').
separator('/').
separator('(').
separator(')').
separator('<').
separator('>').
separator('=<').
separator('>=').
separator(':=').
separator('=').
separator('/=').

whiteChar(' ').
whiteChar('\t').
whiteChar('\n').
whiteChar('\r').

variable(X) :- 
    atom_chars(X, List), 	
    \+ (member(Y, List),
    \+ char_type(Y, upper)).

checkToken(L, end_of_file, L).

checkToken(L, X, L2) :- 
    atom_chars(X, Chars),
    (last(Chars, S1), separator(S1)) -> 
        (select(S1, Chars, NL), !,
(last(NL, S2), atom_concat(S2, S1, S), \+ whiteChar(S2), \+ whiteChar(S1),
        separator(S)) -> ( (select(S2, NL, NL2), !,
        atom_chars(T2, NL2),
        addToken(L, T2, L3),
        append(L3, [sep(S)], L2)));
        select(S1, Chars, NL),
        atom_chars(T, NL),
        addToken(L, T, L3),
        append(L3, [sep(S1)], L2));
        addToken(L, X, L2).



addToken(L, end_of_file, L).

addToken(L, X, L2) :-  	
    (keyWord(X) -> append(L, [key(X)], L2);
    (separator(X) -> append(L, [sep(X)], L2);
    (atom_number(X, N), integer(N), N >= 0) -> append(L, [int(N)], L2);
    (variable(X), \+ X = '' -> append(L, [id(X)], L2);
    L2 = L))).

readNext(end_of_file, L, L) :- !.

readNext(C1, X, X2) :- 	
    whiteChar(C1), !,
    get_char(C2),
    readNext(C2, X, X2).

readNext(C1, L, X) :- 	
    readWord(C1, C2, '', H),
    checkToken(L, H, L2),
    readNext(C2, L2, X).

readWord(end_of_file, end_of_file, N, N) :- !.

readWord(C, C, N, N) :- 
    whiteChar(C), !.

readWord(C1, C3, N1, N) :- 	
    atom_concat(N1, C1, N2),
    get_char(C2),
    readWord(C2, C3, N2, N).

tokenize(X) :- 	
    get_char(C),
    readNext(C, [], X).

scanner(FD, Tokens) :- 	
    current_input(Input),
    set_input(FD),
    tokenize(Tokens),
    set_input(Input).