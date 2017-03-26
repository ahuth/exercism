defmodule Binary do
  Code.require_file "../all-your-base/all-your-base.exs"

  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    string
    |> String.codepoints
    |> sanitize_non_numbers
    |> Enum.map(&String.to_integer/1)
    |> AllYourBase.convert(2, 10)
    |> sanitize_nils
    |> Enum.join
    |> String.to_integer
  end

  defp sanitize_non_numbers(digits) do
    case Enum.all?(digits, &(numeric?(&1))) do
      true -> digits
      false -> ["0"]
    end
  end

  defp numeric?(input) do
    String.match?(input, ~r/[0-9]/)
  end

  defp sanitize_nils(nil), do: [0]
  defp sanitize_nils(digits), do: digits
end
