-module(queen_attack).
-export([can_attack/2]).

can_attack(WhiteQueen, BlackQueen) ->
  same_column(WhiteQueen, BlackQueen)
    or same_row(WhiteQueen, BlackQueen)
    or same_diagonal(WhiteQueen, BlackQueen).

same_column({_, ColA}, {_, ColB}) ->
  ColA =:= ColB.

same_row({RowA, _}, {RowB, _}) ->
  RowA =:= RowB.

same_diagonal({RowA, ColA}, {RowB, ColB}) ->
  abs(RowA - RowB) =:= abs(ColA - ColB).
