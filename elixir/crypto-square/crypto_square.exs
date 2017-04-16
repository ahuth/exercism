defmodule CryptoSquare do
  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(str) do
    str
    |> String.downcase
    |> String.replace(~r/[^a-z0-9]/, "")
    |> String.codepoints
    |> split_rows
    |> zip_longest
    |> Enum.map(&Enum.join/1)
    |> Enum.join(" ")
  end

  defp split_rows(list) do
    count = length(list)
    root = :math.sqrt(count)
    rows = Float.floor(root)
    cols = trunc(Float.ceil(count / rows))
    Enum.chunk(list, cols, cols, [])
  end

  defp zip_longest(lists) do
    lists
    |> List.first
    |> Enum.with_index
    |> Enum.map(fn {_, index} ->
      lists
      |> Enum.map(fn list -> Enum.at(list, index) end)
      |> Enum.reject(&is_nil/1)
    end)
  end
end
