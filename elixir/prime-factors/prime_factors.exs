defmodule PrimeFactors do
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    prime_factors(number, 2) |> Enum.filter(&(&1 != 1))
  end

  defp prime_factors(num, 2) do
    cond do
      rem(num, 2) == 0 -> [2 | prime_factors(div(num, 2), 2)]
      4 > num -> [num]
      true -> prime_factors(num, 3)
    end
  end

  defp prime_factors(num, next) do
    cond do
      rem(num, next) == 0 -> [next | prime_factors(div(num, next), 2)]
      2 * next > num -> [num]
      true -> prime_factors(num, next + 2)
    end
  end
end
