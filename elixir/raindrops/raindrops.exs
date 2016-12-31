defmodule Raindrops do
  @raindrops %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    converted = extract_raindrops(number)
    if converted == "" do
      Integer.to_string(number)
    else
      converted
    end
  end

  defp extract_raindrops(number) do
    Enum.reduce(@raindrops, "", fn({key, value}, acc) ->
      cond do
        rem(number, key) == 0 -> acc <> value
        true -> acc
      end
    end)
  end
end
