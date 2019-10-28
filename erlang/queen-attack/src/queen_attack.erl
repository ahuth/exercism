-module(queen_attack).
-export([can_attack/2]).

can_attack({_, Col}, {_, Col}) -> true;
can_attack({Row, _}, {Row, _}) -> true;
can_attack(WhiteQueen, BlackQueen) ->
  same_diagonal(WhiteQueen, BlackQueen).

same_diagonal({RowA, ColA}, {RowB, ColB}) ->
  abs(RowA - RowB) =:= abs(ColA - ColB).
