class Proverb
  def initialize(*items)
    options = items.last.is_a?(Hash) ? items.pop : {}
    @qualifier = options[:qualifier]
    @items = items
  end

  def to_s
    lines = @items.each_cons(2).map do |(first, second)|
      "For want of a #{first} the #{second} was lost."
    end
    lines << "And all for the want of a #{@qualifier ? @qualifier + " " : nil}#{@items.first}."
    lines.join("\n")
  end
end