class RnaComplement
  def self.of_dna(input : String) : String
    input.tr("GCTA", "CGAU")
  end
end
