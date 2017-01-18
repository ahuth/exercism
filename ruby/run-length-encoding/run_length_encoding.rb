class RunLengthEncoding
  CHUNK = /(\d+)?(.)/

  def self.encode(input)
    input.chars.chunk { |char| char }.map { |chunk| "#{chunk.last.length if chunk.last.length > 1}#{chunk.first}" }.join
  end

  def self.decode(input)
    input.scan(CHUNK).map { |(count, char)| char * (count ? count.to_i : 1) }.join
  end
end
