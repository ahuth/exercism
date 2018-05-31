module NucleotideCount exposing (nucleotideCounts, version)

version : Int
version =
    2

type alias NucleotideCounts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }

nucleotideCounts : String -> NucleotideCounts
nucleotideCounts sequence =
    { a = count 'A' sequence
    , t = count 'T' sequence
    , c = count 'C' sequence
    , g = count 'G' sequence
    }

count : Char -> String -> Int
count item sequence =
    String.length (String.filter ((==) item) sequence)
