defmodule Minesweeper do
  @neighboring_cells [{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}]

  @spec annotate([String.t]) :: [String.t]
  def annotate([]), do: []
  def annotate(board) do
    board
    |> Enum.with_index
    |> Enum.map(fn {row_value, row_index} ->
      row_value
      |> String.codepoints
      |> Enum.with_index
      |> Enum.map(fn {col_value, col_index} ->
        case col_value do
          "*" -> "*"
          _ -> get_output(board, row_index, col_index)
        end
      end)
      |> Enum.join
    end)
  end

  defp get_output(board, row, col) do
    case count_mines(board, row, col) do
      0 -> " "
      x -> x
    end
  end

  defp count_mines(board, row, col) do
    neighborhood(row, col, Enum.count(board), String.length(Enum.at(board, 0)))
    |> Enum.filter(fn {r, c} ->
      row = Enum.at(board, row + r)
      val = String.at(row, col + c)
      val == "*"
    end)
    |> Enum.count
  end

  defp neighborhood(row, col, height, width) do
    @neighboring_cells
    |> Enum.filter(fn {r, c} ->
      row + r >= 0 and row + r < height and col + c >= 0 and col + c < width
    end)
  end
end
