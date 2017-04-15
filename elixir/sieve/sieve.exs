defmodule Sieve do
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    sieve = Enum.to_list(2..limit)
    products = for x <- sieve,
                   y <- sieve,
                   x >= y,
                   x * y <= limit,
                   do: x * y
    sieve -- products
  end
end
