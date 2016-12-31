defmodule Bob do
  def hey(input) do
    cond do
      silence?(input) -> "Fine. Be that way!"
      question?(input) -> "Sure."
      shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  def silence?(input) do
    String.strip(input) == ""
  end

  def question?(input) do
    String.last(input) == "?"
  end

  def shouting?(input) do
    String.upcase(input) == input && String.downcase(input) != input
  end
end