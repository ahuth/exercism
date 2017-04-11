defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) :: :calendar.datetime
  def from(datetime) do
    datetime
    |> :calendar.datetime_to_gregorian_seconds
    |> add_gigasecond
    |> :calendar.gregorian_seconds_to_datetime
  end

  defp add_gigasecond(seconds) do
    seconds + 1_000_000_000
  end
end
