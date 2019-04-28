-module(strain).

-export([keep/2, discard/2]).

keep(_, []) -> [];
keep(Fn, [Head | Tail]) ->
  case Fn(Head) of
    true -> [Head | keep(Fn, Tail)];
    false -> keep(Fn, Tail)
  end.

discard(Fn, List) ->
  keep(fun(X) -> not Fn(X) end, List).
