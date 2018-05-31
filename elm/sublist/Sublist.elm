module Sublist exposing (ListComparison(..), sublist, version)

version : Int
version =
    2

type ListComparison
    = Equal
    | Superlist
    | Sublist
    | Unequal

sublist : List a -> List a -> ListComparison
sublist alist blist =
    if alist == blist then
      Equal
    else if contains alist blist then
      Superlist
    else if contains blist alist then
      Sublist
    else
      Unequal

contains a b =
    case (a, b) of
      (_, []) ->
        True
      ([], _) ->
        False
      (aHead :: aTail, b) ->
        if equalAfterTruncation a b then
          True
        else
          contains aTail b

equalAfterTruncation a b =
    let
      bLength = List.length b
      aTruncated = List.take bLength a
    in
      aTruncated == b
