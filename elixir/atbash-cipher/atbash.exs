defmodule Atbash do
  @front ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  @back Enum.reverse(@front)

  @spec encode(String.t) :: String.t
  def encode(plaintext) do
    plaintext
    |> String.downcase
    |> String.codepoints
    |> Enum.reject(&(Regex.match?(~r/[ \.,]/, &1)))
    |> Enum.map(fn char ->
      if Regex.match?(~r/[a-z]/, char) do
        transform(char)
      else
        char
      end
    end)
    |> Enum.chunk(5, 5, [])
    |> Enum.map(&(Enum.join(&1)))
    |> Enum.join(" ")
  end

  defp transform(char) do
    index = Enum.find_index(@front, &(&1 == char))
    Enum.at(@back, index)
  end
end
