defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    deduce(number, 1000, "")
  end

  defp deduce(number, current = 1000, acc), do: process(number, acc, current, 900, "M")
  defp deduce(number, current = 900, acc), do: process(number, acc, current, 500, "CM")
  defp deduce(number, current = 500, acc), do: process(number, acc, current, 400, "D")
  defp deduce(number, current = 400, acc), do: process(number, acc, current, 100, "CD")
  defp deduce(number, current = 100, acc), do: process(number, acc, current, 90, "C")
  defp deduce(number, current = 90, acc), do: process(number, acc, current, 50, "XC")
  defp deduce(number, current = 50, acc), do: process(number, acc, current, 40, "L")
  defp deduce(number, current = 40, acc), do: process(number, acc, current, 10, "XL")
  defp deduce(number, current = 10, acc), do: process(number, acc, current, 9, "X")
  defp deduce(number, current = 9, acc), do: process(number, acc, current, 5, "IX")
  defp deduce(number, current = 5, acc), do: process(number, acc, current, 4, "V")
  defp deduce(number, current = 4, acc), do: process(number, acc, current, 1, "IV")
  defp deduce(number, 1, acc), do: acc <> String.duplicate("I", number)

  defp process(number, acc, current, next, symbol) do
    deduce(rem(number, current), next, acc <> String.duplicate(symbol, div(number, current)))
  end
end
