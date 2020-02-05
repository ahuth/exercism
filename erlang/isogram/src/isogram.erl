-module(isogram).
-export([is_isogram/1]).

is_isogram(Phrase) ->
  is_isogram(string:lowercase(Phrase), sets:new()).

is_isogram([], _) -> true;
is_isogram([$-|T], Chars) -> is_isogram(T, Chars);
is_isogram([$ |T], Chars) -> is_isogram(T, Chars);
is_isogram([H|T], Chars) ->
  case sets:is_element(H, Chars) of
    true -> false;
    false -> is_isogram(T, sets:add_element(H, Chars))
  end.
