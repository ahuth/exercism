defmodule Allergies do
  use Bitwise
  @bits %{
    "eggs" => 1,
    "peanuts" => 2,
    "shellfish" => 4,
    "strawberries" => 8,
    "tomatoes" => 16,
    "chocolate" => 32,
    "pollen" => 64,
    "cats" => 128,
  }

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(flags) do
    @bits
    |> Enum.filter(fn {_, bit} -> bit_set?(flags, bit) end)
    |> Enum.map(fn {key, _} -> key end)
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(flags, item) do
    bit_set?(flags, @bits[item])
  end

  defp bit_set?(bits, bit), do: band(bits, bit) == bit
end
