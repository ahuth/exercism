defmodule PerfectNumbers do
  @spec classify(number :: integer) :: ({ :ok, atom } | { :error, String.t() })
  def classify(number) when number < 1, do: {:error, "Classification is only possible for natural numbers."}
  def classify(1), do: {:ok, :deficient}
  def classify(number) do
    case aliquot(number) do
      x when x > number -> {:ok, :abundant}
      x when x < number -> {:ok, :deficient}
      _ -> {:ok, :perfect}
    end
  end

  defp aliquot(number) do
    factors_below(number)
    |> Enum.reduce(&Kernel.+/2)
  end

  defp factors_below(number) do
    1..div(number, 2)
    |> Enum.filter(&(rem(number, &1) == 0))
  end
end
