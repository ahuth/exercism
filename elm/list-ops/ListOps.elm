module ListOps
    exposing
        ( append
        , concat
        , filter
        , foldl
        , foldr
        , length
        , map
        , reverse
        )

length : List a -> Int
length list =
    let
      calculate size collection =
        case collection of
          [] ->
            size
          _ :: tail ->
            calculate (size + 1) tail
    in
      calculate 0 list

reverse : List a -> List a
reverse list =
    let calculate first second =
      case second of
        [] ->
          first
        head :: tail ->
          calculate (head :: first) tail
    in
      calculate [] list

foldl : (a -> b -> b) -> b -> List a -> b
foldl f acc list =
    case list of
      [] ->
        acc
      head :: tail ->
        foldl f (f head acc) tail

foldr : (a -> b -> b) -> b -> List a -> b
foldr f acc list =
    foldl f acc (reverse list)

map : (a -> b) -> List a -> List b
map f list =
    let
      calculate first second =
        case second of
          [] ->
            reverse first
          head :: tail ->
            calculate ((f head) :: first) tail
    in
      calculate [] list

filter : (a -> Bool) -> List a -> List a
filter f list =
    let
      calculate first second =
        case second of
          [] ->
            reverse first
          head :: tail ->
            if f head then
              calculate (head :: first) tail
            else
              calculate first tail
    in
      calculate [] list

append : List a -> List a -> List a
append xs ys =
    let
      calculate first second =
        case second of
          [] ->
            reverse first
          head :: tail ->
            calculate (head :: first) tail
    in
      calculate (reverse xs) ys

concat : List (List a) -> List a
concat list =
    foldr append [] list
