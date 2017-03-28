defmodule Luhn do
  require Integer

  @doc """
  Calculates the total checksum of a number
  """
  @spec checksum(String.t()) :: integer
  def checksum(number) do
    number
    |> String.codepoints
    |> Enum.map(&String.to_integer/1)
    |> Enum.map_every(2, &(adjust(&1 * 2)))
    |> Enum.sum
  end

  defp adjust(num) when num > 9, do: num - 9
  defp adjust(num), do: num

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    number
    |> checksum
    |> rem(10) == 0
  end

  @doc """
  Creates a valid number by adding the correct
  checksum digit to the end of the number
  """
  @spec create(String.t()) :: String.t()
  def create(number) do
  end
end
