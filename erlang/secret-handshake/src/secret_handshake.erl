-module(secret_handshake).
-export([commands/1]).

-define(BITS, [
  {2#1, "wink"},
  {2#10, "double blink"},
  {2#100, "close your eyes"},
  {2#1000, "jump"}
]).

commands(Number) ->
  Commands = [Command || {Bit, Command} <- ?BITS, Number band Bit > 0],
  handle_reverse(Number, Commands).

handle_reverse(Number, Commands) when Number band 2#10000 > 0 -> lists:reverse(Commands);
handle_reverse(_, Commands) -> Commands.
