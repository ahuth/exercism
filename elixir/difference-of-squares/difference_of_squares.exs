defmodule Squares do
  @spec sum_of_squares(pos_integer) :: pos_integer
  def sum_of_squares(number) do
    1..number
    |> Enum.map(&(&1 * &1))
    |> Enum.sum
  end

  @spec square_of_sums(pos_integer) :: pos_integer
  def square_of_sums(number) do
    1..number
    |> Enum.sum
    |> :math.pow(2)
    |> round
  end

  @spec difference(pos_integer) :: pos_integer
  def difference(number) do
    square_of_sums(number) - sum_of_squares(number)
  end
end
