type dna = [ `A | `C | `G | `T ]
type rna = [ `A | `C | `G | `U ]

let convert nucleotide = match nucleotide with
  | `G -> `C
  | `C -> `G
  | `T -> `A
  | `A -> `U

let to_rna dna = List.map (convert) dna
