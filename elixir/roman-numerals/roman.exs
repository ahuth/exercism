defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    deduce(number, 1000, "")
  end

  defp deduce(number, 1000, acc) do
    deduce(rem(number, 1000), 900, acc <> String.duplicate("M", div(number, 1000)))
  end

  defp deduce(number, 900, acc) do
    deduce(rem(number, 900), 500, acc <> String.duplicate("CM", div(number, 900)))
  end

  defp deduce(number, 500, acc) do
    deduce(rem(number, 500), 400, acc <> String.duplicate("D", div(number, 500)))
  end

  defp deduce(number, 400, acc) do
    deduce(rem(number, 400), 100, acc <> String.duplicate("CD", div(number, 400)))
  end

  defp deduce(number, 100, acc) do
    deduce(rem(number, 100), 90, acc <> String.duplicate("C", div(number, 100)))
  end

  defp deduce(number, 90, acc) do
    deduce(rem(number, 90), 50, acc <> String.duplicate("XC", div(number, 90)))
  end

  defp deduce(number, 50, acc) do
    deduce(rem(number, 50), 40, acc <> String.duplicate("L", div(number, 50)))
  end

  defp deduce(number, 40, acc) do
    deduce(rem(number, 40), 10, acc <> String.duplicate("XL", div(number, 40)))
  end

  defp deduce(number, 10, acc) do
    deduce(rem(number, 10), 9, acc <> String.duplicate("X", div(number, 10)))
  end

  defp deduce(number, 9, acc) do
    deduce(rem(number, 9), 5, acc <> String.duplicate("IX", div(number, 9)))
  end

  defp deduce(number, 5, acc) do
    deduce(rem(number, 5), 4, acc <> String.duplicate("V", div(number, 5)))
  end

  defp deduce(number, 4, acc) do
    deduce(rem(number, 4), 1, acc <> String.duplicate("IV", div(number, 4)))
  end

  defp deduce(number, 1, acc) do
    acc <> String.duplicate("I", number)
  end
end
