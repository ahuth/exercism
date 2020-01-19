-module(bracket_push).
-export([is_paired/1]).

is_paired(String) -> balance(String, []).

balance([], []) -> true;
balance([], _) -> false;
% An opener. Add it to the stack and continue.
balance([Head | Tail], Stack) when Head == $(; Head == $[; Head == ${ -> balance(Tail, [Head | Stack]);
% A closer that matches the opener on the top of the stack. Pop it from the stack and continue.
balance([$) | Tail], [$( | Rest]) -> balance(Tail, Rest);
balance([$] | Tail], [$[ | Rest]) -> balance(Tail, Rest);
balance([$} | Tail], [${ | Rest]) -> balance(Tail, Rest);
% A closer that does not match the opener on the top of the stack. Return false.
balance([Head | _], _) when Head == $); Head == $]; Head == $} -> false;
% Not an opener or closer. Discard it and continue.
balance([_ | Tail], Stack) -> balance(Tail, Stack).
