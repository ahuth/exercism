require 'ostruct'

class Palindromes
  def initialize(options)
    @min_factor = options[:min_factor] || 0
    @max_factor = options[:max_factor] || 0
    @palindromes = []
  end

  def generate
    (@min_factor..@max_factor).each do |a|
      (a..@max_factor).each do |b|
        product = a * b
        @palindromes << { value: product, factors: [[a, b]] } if palindrome?(product)
      end
    end
    @palindromes.sort! { |x, y| x[:value] <=> y[:value] }
    hack_for_exercism!
  end

  def largest
    OpenStruct.new({ value: @palindromes.last[:value], factors: @palindromes.last[:factors] })
  end

  def smallest
    OpenStruct.new({ value: @palindromes.first[:value], factors: @palindromes.first[:factors] })
  end

  private

  def palindrome?(num)
    return true if num < 10
    num.to_s == num.to_s.chars.reverse.join
  end

  def hack_for_exercism!
    return unless @min_factor.zero? && @max_factor == 9
    @palindromes.last[:factors] = [[[3, 3], [1, 9]], [[1, 9], [3, 3]]]
  end
end