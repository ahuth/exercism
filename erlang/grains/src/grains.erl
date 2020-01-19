-module(grains).
-export([square/1, total/0]).

square(Square) when Square < 1; Square > 64 -> {error, "square must be between 1 and 64"};
square(Square) -> 1 bsl (Square - 1).

total() ->
  % square(65) - 1.
  18446744073709551615.
