class Atbash
  PLAIN = ("a".."z").to_a
  CIPHER = PLAIN.reverse

  def self.encode(text)
    escaped_chars = text.downcase.gsub(/\s/, "").chars
    escaped_chars.map { |char| convert(char) }.compact.each_slice(5).map(&:join).join(" ")
  end

  private

  def self.convert(char)
    case char
    when /[0-9]/
      char
    when /[a-z]/
      CIPHER[PLAIN.index(char)]
    else
      nil
    end
  end
end