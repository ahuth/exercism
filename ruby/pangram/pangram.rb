class Pangram
  VERSION = 1

  def self.is_pangram?(string)
    new(string).is_pangram?
  end

  def initialize(string)
    @string = string.downcase
    @alphabet = ("a".."z").to_a
  end

  def is_pangram?
    @string.each_char do |char|
      @alphabet.delete(char)
    end
    @alphabet.length == 0
  end
end