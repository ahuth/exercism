-module(darts).
-export([score/2]).

score(X, Y) ->
  Distance = getDistance(X, Y),
  score(Distance).

score(Distance) when Distance =< 1 -> 10;
score(Distance) when Distance =< 5 -> 5;
score(Distance) when Distance =< 10 -> 1;
score(_) -> 0.

getDistance(X, Y) ->
  DX = abs(X),
  DY = abs(Y),
  math:sqrt(DX * DX + DY * DY).
