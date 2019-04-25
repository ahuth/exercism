-module(leap).

-export([leap_year/1]).


leap_year(Year) when Year rem 4 == 0 ->
  not century(Year) orelse exceptional(Year);
leap_year(_Year) -> false.

century(Year) when Year rem 100 == 0 -> true;
century(_Year) -> false.

exceptional(Year) when Year rem 400 == 0 -> true;
exceptional(_Year) -> false.
