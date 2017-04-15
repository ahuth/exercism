defmodule Hexadecimal do
  @values %{"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "a" => 10, "b" => 11, "c" => 12, "d" => 13, "e" => 14, "f" => 15}

  @spec to_decimal(binary) :: integer
  def to_decimal(hex) do
    hex
    |> String.downcase
    |> String.codepoints
    |> Enum.map(&(@values[&1]))
    |> Enum.reverse
    |> convert(0, 0)
  end

  def convert([], _, acc), do: acc
  def convert([nil|_], _, _), do: 0
  def convert([head|tail], power, acc) do
    sum = acc + head * round(:math.pow(16, power))
    convert(tail, power + 1, sum)
  end
end
