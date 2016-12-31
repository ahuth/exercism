class TriangleError < StandardError; end;

class Triangle
  attr_reader :kind

  def initialize(a, b, c)
    raise TriangleError unless obeys_inequality_theorem?(a, b, c)
    @kind = identify(a, b, c)
  end

  private

  def identify(a, b, c)
    return :equilateral if equilateral?(a, b, c)
    return :scalene if scalene?(a, b, c)
    :isosceles
  end

  def equilateral?(a, b, c)
    a == b && b == c
  end

  def scalene?(a, b, c)
    a != b && b !=c && a != c
  end

  def obeys_inequality_theorem?(a, b, c)
    (a + b > c) && (a + c > b) && (b + c > a)
  end
end