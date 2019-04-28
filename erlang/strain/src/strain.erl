-module(strain).

-export([keep/2, discard/2]).

keep(_, []) -> [];
keep(Fn, [Head | Tail]) ->
  io:write(Fn),
  case Fn(Head) of
    true -> [Head | keep(Fn, Tail)];
    false -> keep(Fn, Tail)
  end.

discard(_, []) -> [];
discard(Fn, [Head | Tail]) ->
  case Fn(Head) of
    true -> discard(Fn, Tail);
    false -> [Head | discard(Fn, Tail)]
  end.
