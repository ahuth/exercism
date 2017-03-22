defmodule AllYourBase do
  @doc """
  Given a number in base a, represented as a sequence of digits, converts it to base b,
  or returns nil if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: list
  def convert([], _, _), do: nil
  def convert(_, base_a, _) when base_a <= 1, do: nil
  def convert(_, _, base_b) when base_b <= 1, do: nil
  def convert(digits, base_a, base_b) do
    digits
    |> from_base(base_a, 0)
    |> to_base(base_b, [])
  end

  defp from_base([], _, sum), do: sum
  defp from_base([head|_], _, _) when head < 0, do: nil
  defp from_base([head|_], base, _) when head >= base, do: nil
  defp from_base([head|tail], base, sum) do
    current = head * :math.pow(base, Enum.count(tail))
    from_base(tail, base, sum + round(current))
  end

  defp to_base(nil, _, _), do: nil
  defp to_base(0, _, []), do: [0]
  defp to_base(0, _, digits), do: digits
  defp to_base(number, base, digits) do
    to_base(div(number, base), base, [rem(number, base)|digits])
  end
end
