class Matrix
  attr_reader :rows, :columns

  def initialize(encoded)
    @rows = encoded.split("\n").map { |row| row.split(" ").map(&:to_i) }
    @columns = @rows.transpose
  end

  def saddle_points
    saddle_points = []
    (0...@rows.length).each do |r|
      (0...@columns.length).each do |c|
        saddle_points << [r, c] if saddle_point?(r, c)
      end
    end
    saddle_points
  end

  private

  def saddle_point?(r, c)
    largest_in_row?(r, c) && smallest_in_column?(r, c)
  end

  def largest_in_row?(r, c)
    row = @rows[r]
    num = row[c]
    row.all? { |n| n <= num }
  end

  def smallest_in_column?(r, c)
    col = @columns[c]
    num = col[r]
    col.all? { |n| n >= num }
  end
end