class SecretHandshake
  REVERSE_BIT = 16

  BITS = {
    1 => "wink",
    2 => "double blink",
    4 => "close your eyes",
    8 => "jump"
  }

  def initialize(num)
    @num = num
  end

  def commands
    return [] unless @num.is_a?(Fixnum)
    sequence = BITS.map { |bit, value| bit_flipped?(bit) ? value : nil }.compact
    bit_flipped?(REVERSE_BIT) ? sequence.reverse : sequence
  end

  private

  def bit_flipped?(bit)
    @num & bit == bit
  end
end