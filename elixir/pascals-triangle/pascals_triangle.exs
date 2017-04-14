defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(num) do
    Enum.map(1..num, &row/1)
  end

  defp row(1), do: [1]
  defp row(num) do
    Enum.reduce((num - 1)..1, [1], fn (n, acc) ->
      acc ++ [current(List.last(acc), num, n)]
    end)
  end

  defp current(previous, row, position) do
    round(previous * position / (row - position))
  end
end
