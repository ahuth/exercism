-module(hamming).
-export([distance/2]).

distance(Strand1, Strand2) -> distance(Strand1, Strand2, 0).

distance([], [], Count) -> Count;
distance([], _, _) -> {error, "left and right strands must be of equal length"};
distance(_, [], _) -> {error, "left and right strands must be of equal length"};
distance([A | Tail1], [A | Tail2], Count) -> distance(Tail1, Tail2, Count);
distance([_ | Tail1], [_ | Tail2], Count) -> distance(Tail1, Tail2, Count + 1).
