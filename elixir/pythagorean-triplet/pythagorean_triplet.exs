defmodule Triplet do
  @spec sum([non_neg_integer]) :: non_neg_integer
  def sum(triplet), do: Enum.sum(triplet)

  @spec product([non_neg_integer]) :: non_neg_integer
  def product(triplet), do: Enum.reduce(triplet, &Kernel.*/2)

  @spec pythagorean?([non_neg_integer]) :: boolean
  def pythagorean?([a, b, c]), do: a*a + b*b == c*c

  @spec generate(non_neg_integer, non_neg_integer) :: [list(non_neg_integer)]
  def generate(min, max) do
    for a <- min..max-2,
        b <- a+1..max-1,
        c <- b+1..max,
        a*a + b*b == c*c,
        do: [a, b, c]
  end

  @spec generate(non_neg_integer, non_neg_integer, non_neg_integer) :: [list(non_neg_integer)]
  def generate(min, max, total) do
    generate(min, max)
    |> Enum.filter(&(sum(&1) == total))
  end
end
