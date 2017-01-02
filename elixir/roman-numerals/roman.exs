defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    deduce(number, 1000, "")
  end

  defp deduce(number, 1000, acc), do: process(number, acc, 1000, 900, "M")
  defp deduce(number, 900, acc), do: process(number, acc, 900, 500, "CM")
  defp deduce(number, 500, acc), do: process(number, acc, 500, 400, "D")
  defp deduce(number, 400, acc), do: process(number, acc, 400, 100, "CD")
  defp deduce(number, 100, acc), do: process(number, acc, 100, 90, "C")
  defp deduce(number, 90, acc), do: process(number, acc, 90, 50, "XC")
  defp deduce(number, 50, acc), do: process(number, acc, 50, 40, "L")
  defp deduce(number, 40, acc), do: process(number, acc, 40, 10, "XL")
  defp deduce(number, 10, acc), do: process(number, acc, 10, 9, "X")
  defp deduce(number, 9, acc), do: process(number, acc, 9, 5, "IX")
  defp deduce(number, 5, acc), do: process(number, acc, 5, 4, "V")
  defp deduce(number, 4, acc), do: process(number, acc, 4, 1, "IV")
  defp deduce(number, 1, acc), do: acc <> String.duplicate("I", number)

  defp process(number, acc, current, next, symbol) do
    deduce(rem(number, current), next, acc <> String.duplicate(symbol, div(number, current)))
  end
end
