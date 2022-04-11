small(Counter, Match) :-
    ((Match1 = [1, 4, 5, 8], Count1 = 1) ; (Match1 = [], Count1 = 0)), 
    ((union(Match1, [2, 5, 6, 9], Match2), Count2 is Count1 + 1) ; (Match2 = Match1, Count2 = Count1)), 
    ((union(Match2, [3, 6, 7, 10], Match3), Count3 is Count2 + 1) ; (Match3 = Match2, Count3 = Count2)), 
    ((union(Match3, [8, 11, 12, 15], Match4), Count4 is Count3 + 1) ; (Match4 = Match3, Count4 = Count3)), 
    ((union(Match4, [9, 12, 13, 16], Match5), Count5 is Count4 + 1) ; (Match5 = Match4, Count5 = Count4)), 
    ((union(Match5, [10, 13, 14, 17], Match6), Count6 is Count5 + 1) ; (Match6 = Match5, Count6 = Count5)), 
    ((union(Match6, [15, 18, 19, 22], Match7), Count7 is Count6 + 1) ; (Match7 = Match6, Count7 = Count6)), 
    ((union(Match7, [16, 19, 20, 23], R8), Counter8 is Count7 + 1) ; (R8 = Match7, Counter8 = Count7)), 
    ((union(R8, [17, 20, 21, 24], Match), Counter is Counter8 + 1) ; (Match = R8, Counter = Counter8)).

medium(Base, Counter, Match) :-
    Sq1 = [1, 2, 4, 6, 11, 13, 15, 16], 
    Sq2 = [2, 3, 5, 7, 12, 14, 16, 17], 
    Sq3 = [8, 9, 11, 13, 18, 20, 22, 23], 
    Sq4 = [9, 10, 12, 14, 19, 21, 23, 24], 
    ((union(Base, Sq1, Match1), Count1 = 1) ; (Match1 = Base, Count1 = 0)), 
    ((union(Match1, Sq2, Match2), Count2 is Count1 + 1) ; (Match2 = Match1, Count2 = Count1)), 
    ((union(Match2, Sq3, Match3), Count3 is Count2 + 1) ; (Match3 = Match2, Count3 = Count2)), 
    ((union(Match3, Sq4, Match), Counter is Count3 + 1) ; (Match = Match3, Counter = Count3)).

large(Base, Counter, Match) :-
    Sq1 = [1, 2, 3, 4, 7, 11, 14, 18, 21, 22, 23, 24], 
    ((union(Base, Sq1, Match), Counter = 1) ; (Match = Base, Counter = 0)).

zapalki(Taken, L, M, S) :-
    small(S, Match1), 
    medium(Match1, M, Match2), 
    large(Match2, L, Match3),
    length(Match3, Len),
    Taken is 24 - Len,
    write("Rozwiazanie:\n"), 
    draw(Match3).

draw(K) :-
	(member(1, K) -> write("+---+") ; write("+   +")),
	(member(2, K) -> write("---+") ; write("   +")),
	(member(3, K) -> write("---+\n") ; write("   +\n")),
	(member(4, K) -> write("|   ") ; write("    ")),
	(member(5, K) -> write("|   ") ; write("    ")),
	(member(6, K) -> write("|   ") ; write("    ")),
	(member(7, K) -> write("|\n") ; write(" \n")),
	(member(8, K) -> write("+---+") ; write("+   +")),
	(member(9, K) -> write("---+") ; write("   +")),
	(member(10, K) -> write("---+\n") ; write("   +\n")),
	(member(11, K) -> write("|   ") ; write("    ")),
	(member(12, K) -> write("|   ") ; write("    ")),
	(member(13, K) -> write("|   ") ; write("    ")),
	(member(14, K) -> write("|\n") ; write(" \n")),
	(member(15, K) -> write("+---+") ; write("+   +")),
	(member(16, K) -> write("---+") ; write("   +")),
	(member(17, K) -> write("---+\n") ; write("   +\n")),
	(member(18, K) -> write("|   ") ; write("    ")),
	(member(19, K) -> write("|   ") ; write("    ")),
	(member(20, K) -> write("|   ") ; write("    ")),
	(member(21, K) -> write("|\n") ; write(" \n")),
	(member(22, K) -> write("+---+") ; write("+   +")),
	(member(23, K) -> write("---+") ; write("   +")),
	(member(24, K) -> write("---+\n") ; write("   +\n")).