defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @wdays %{monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6, sunday: 7}

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, :first), do: find_date_in_range(year, month, weekday, 1, 7)
  def meetup(year, month, weekday, :second), do: find_date_in_range(year, month, weekday, 8, 14)
  def meetup(year, month, weekday, :third), do: find_date_in_range(year, month, weekday, 15, 21)
  def meetup(year, month, weekday, :fourth), do: find_date_in_range(year, month, weekday, 22, 28)
  def meetup(year, month, weekday, :teenth), do: find_date_in_range(year, month, weekday, 13, 19)
  def meetup(year, month, weekday, :last) do
    last_day = last_day_of_month(year, month)
    find_date_in_range(year, month, weekday, last_day - 6, last_day)
  end

  defp find_date_in_range(year, month, weekday, first, last) do
    {year, month, find_day(year, month, weekday, first, last)}
  end

  defp find_day(year, month, weekday, first, last) do
    Enum.find(first..last, &(is_day_of_week?(year, month, &1, weekday)))
  end

  defp is_day_of_week?(year, month, day, weekday) do
    :calendar.day_of_the_week(year, month, day) == @wdays[weekday]
  end

  defp last_day_of_month(year, month) do
    :calendar.last_day_of_the_month(year, month)
  end
end