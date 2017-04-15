defmodule Diamond do
  @spec build_shape(char) :: String.t
  def build_shape(letter) do
    (?A..letter)
    |> build_half(letter, (2 * (letter - ?A) + 1))
    |> join_halves
  end

  defp build_half(letters, base, width) do
    letters
    |> Enum.map(&(build_line(&1, base, width)))
  end

  defp build_line(letter, base, width) do
    List.duplicate(?\s, width)
    |> List.replace_at(base - letter, letter)
    |> List.replace_at(width - (base - letter + 1), letter)
    |> to_string
  end

  defp join_halves(half) do
    Enum.join(half ++ tl(Enum.reverse(half)), "\n") <> "\n"
  end
end
