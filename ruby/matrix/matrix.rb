class Matrix
  def initialize(encoded)
    @rows = encoded.split("\n").map { |row| row.split(" ").map(&:to_i) }
  end

  def rows
    @rows
  end

  def columns
    @rows.transpose
  end
end