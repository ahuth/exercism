defmodule RailFenceCipher do
  @spec encode(String.t, pos_integer) :: String.t
  def encode(str, 1), do: str
  def encode(str, rails) do
    chars = String.codepoints(str)
    zigzag(rails)
    |> Enum.take(length(chars))
    |> Enum.zip(chars)
    |> Enum.sort(fn {a, _}, {b, _} -> a <= b end)
    |> Enum.map(fn {_, x} -> x end)
    |> Enum.join
  end

  @spec decode(String.t, pos_integer) :: String.t
  def decode(str, 1), do: str
  def decode(str, rails) do
    chars = String.codepoints(str)
    zigzag(rails)
    |> Enum.zip(0..length(chars))
    |> Enum.take(length(chars))
    |> Enum.sort
    |> Enum.zip(chars)
    |> Enum.sort(fn {{_, a}, _}, {{_, b}, _} -> a <= b end)
    |> Enum.map(fn {_, x} -> x end)
    |> Enum.join
  end

  defp zigzag(size) do
    Enum.to_list(0..size-1) ++ Enum.to_list(size-2..1) |> Stream.cycle
  end
end
