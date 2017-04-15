defmodule Hexadecimal do
  @numeric_digits ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

  @spec to_decimal(binary) :: integer
  def to_decimal(hex) do
    hex
    |> String.downcase
    |> String.codepoints
    |> Enum.map(&lookup/1)
    |> Enum.reverse
    |> convert(0, 0)
  end

  defp lookup(n) when n in @numeric_digits, do: String.to_integer(n)
  defp lookup("a"), do: 10
  defp lookup("b"), do: 11
  defp lookup("c"), do: 12
  defp lookup("d"), do: 13
  defp lookup("e"), do: 14
  defp lookup("f"), do: 15
  defp lookup(_), do: nil

  defp convert([], _, acc), do: acc
  defp convert([nil|_], _, _), do: 0
  defp convert([head|tail], power, acc) do
    sum = acc + head * round(:math.pow(16, power))
    convert(tail, power + 1, sum)
  end
end
