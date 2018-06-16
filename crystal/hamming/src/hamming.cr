alias Strand = String

class Hamming
  def self.compute(a : Strand, b : Strand) : Int
    raise ArgumentError.new unless a.size == b.size

    a.chars.zip(b.chars).count { |(x, y)| x != y }
  end
end
