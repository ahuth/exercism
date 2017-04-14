defmodule Queens do
  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct black: nil, white: nil

  @doc """
  Creates a new set of Queens
  """
  @spec new() :: Queens.t()
  @spec new({integer, integer}, {integer, integer}) :: Queens.t()
  def new(), do: new({0, 3}, {7, 3})
  def new(white, black) when white == black, do: raise ArgumentError
  def new(white, black) do
    %Queens{black: black, white: white}
  end

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(%Queens{black: black, white: white}) do
    Enum.map_join(0..7, "\n", fn (row) ->
      Enum.map_join(0..7, " ", fn (col) ->
        case {row, col} do
          {x, y} when {x, y} == black -> "B"
          {x, y} when {x, y} == white -> "W"
          _ -> "_"
        end
      end)
    end)
  end

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(%Queens{black: black, white: white}) do
    same_row?(black, white) || same_col?(black, white) || diagonal?(black, white)
  end

  defp same_row?({x, _}, {x, _}), do: true
  defp same_row?(_, _), do: false

  defp same_col?({_, y}, {_, y}), do: true
  defp same_col?(_, _), do: false

  defp diagonal?({a, b}, {x, y}), do: abs(a - x) == abs(b - y)
end
