defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do raw
    |> clean
    |> analyze
  end

  defp clean(raw) do raw
    |> String.replace(~r/[\(\)\s\-\.]/, "")
  end

  defp analyze("1" <> rest) when byte_size(rest) == 10, do: rest
  defp analyze(string) when byte_size(string) > 10, do: "0000000000"
  defp analyze(string) when byte_size(string) == 9, do: "0000000000"
  defp analyze(string), do: string

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do raw
    |> clean
    |> extract_area_code
  end

  defp extract_area_code("1" <> rest) when byte_size(rest) == 10, do: extract_area_code(rest)
  defp extract_area_code(string) do
    {area_code, _} = String.split_at(string, 3)
    area_code
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty("1" <> rest) when byte_size(rest) == 10, do: pretty(rest)
  def pretty(raw) do
    area_code = raw |> area_code
    first_part = raw |> String.slice(3..5)
    second_part = raw |> String.slice(6..9)
    "(#{area_code}) #{first_part}-#{second_part}"
  end
end