alias Strand = String
alias Nucleotide = Char

class RnaComplement
  def self.of_dna(input : Strand) : Strand
    input.chars.map { |x| convert(x) }.join
  end

  private def self.convert(input : Nucleotide) : Nucleotide
    case input
      when 'G' then 'C'
      when 'C' then 'G'
      when 'T' then 'A'
      when 'A' then 'U'
      else 'X'
    end
  end
end
