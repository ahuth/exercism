alias Strand = String
alias Nucleotide = Char

class RnaComplement
  def self.of_dna(input : Strand) : Strand
    input.tr("GCTA", "CGAU")
  end
end
