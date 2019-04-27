-module(collatz_conjecture).

-export([steps/1]).

steps(N) when N < 1 -> {error, "Only positive numbers are allowed"};
steps(N) -> steps(N, 0).
steps(1, S) -> S;
steps(N, S) when N rem 2 == 0 -> steps(N div 2, S + 1);
steps(N, S) -> steps(3 * N + 1, S + 1).
