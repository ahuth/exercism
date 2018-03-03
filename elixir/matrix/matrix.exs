defmodule Matrix do
  @type matrix :: list(list(integer))

  @doc """
  Convert an `input` string, with rows separated by newlines and values
  separated by single spaces, into a `Matrix` struct.
  """
  @spec from_string(input :: String.t()) :: matrix
  def from_string(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn row ->
      row
      |> String.split
      |> Enum.map(&String.to_integer/1)
    end)
  end

  @doc """
  Write the `matrix` out as a string, with rows separated by newlines and
  values separated by single spaces.
  """
  @spec to_string(matrix :: matrix) :: String.t()
  def to_string(matrix) do
    matrix
    |> Enum.map(&(Enum.join(&1, " ")))
    |> Enum.join("\n")
  end

  @doc """
  Given a `matrix`, return its rows as a list of lists of integers.
  """
  @spec rows(matrix :: matrix) :: list(list(integer))
  def rows(matrix) do
    matrix
  end

  @doc """
  Given a `matrix` and `index`, return the row at `index`.
  """
  @spec row(matrix :: matrix, index :: integer) :: list(integer)
  def row(matrix, index) do
    Enum.at(matrix, index)
  end

  @doc """
  Given a `matrix`, return its columns as a list of lists of integers.
  """
  @spec columns(matrix :: matrix) :: list(list(integer))
  def columns(matrix) do
    matrix |> transpose
  end

  @doc """
  Given a `matrix` and `index`, return the column at `index`.
  """
  @spec column(matrix :: matrix, index :: integer) :: list(integer)
  def column(matrix, index) do
    matrix
    |> columns
    |> Enum.at(index)
  end

  @spec transpose(matrix :: matrix) :: matrix
  def transpose(matrix) do
    matrix
    |> swap([])
    |> Enum.reverse
  end

  defp swap([[] | _], cols), do: cols
  defp swap(rows, cols) do
    firsts = Enum.map(rows, &hd/1)
    rest = Enum.map(rows, &tl/1)
    swap(rest, [firsts | cols])
  end
end
