defmodule Matrix do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(str) do
    str
    |> String.split("\n")
    |> Enum.map(fn row ->
      row
      |> String.split
      |> Enum.map(&String.to_integer/1)
    end)
  end

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(str) do
    str
    |> rows
    |> transpose
  end

  defp transpose(rows) do
    rows
    |> Enum.zip
    |> Enum.map(&Tuple.to_list/1)
  end

  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    # https://elixirforum.com/t/for-special-form/907
    for {row, x} <- Enum.with_index(rows(str)),
        {col, y} <- Enum.with_index(columns(str)),
        max = Enum.max(row),
        min = Enum.min(col),
        min == max,
        do: {x, y}
  end
end
