defmodule Pangram do
  @letters ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  @alphabet Enum.join(@letters)

  @spec pangram?(String.t) :: boolean
  def pangram?(sentence) do
    sentence
    |> String.downcase
    |> String.codepoints
    |> Enum.filter(&(&1 in @letters))
    |> Enum.uniq
    |> Enum.sort
    |> Enum.join == @alphabet
  end
end
