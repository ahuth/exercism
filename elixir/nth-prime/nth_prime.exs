defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise ArgumentError
  def nth(count) do
    Stream.iterate(2, &next_prime/1)
    |> Enum.take(count)
    |> List.last
  end

  defp next_prime(num) do
    next = num + 1

    if factors_for(next) == [1, next] do
      next
    else
      next_prime(next)
    end
  end

  defp factors_for(num), do: factors_for(num, 1, []) |> Enum.sort
  defp factors_for(num, i, factors) when num < i * i, do: factors
  defp factors_for(num, i, factors) when num == i * i, do: [i | factors]
  defp factors_for(num, i, factors) when rem(num, i) == 0, do: factors_for(num, i + 1, [i, div(num, i) | factors])
  defp factors_for(num, i, factors), do: factors_for(num, i + 1, factors)
end
