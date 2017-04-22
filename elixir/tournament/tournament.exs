defmodule Tournament do
  defmodule Team do
    defstruct name: nil, matches: 0, won: 0, drawn: 0, lost: 0, points: 0

    def add_win(t), do: %Team{t | matches: t.matches + 1, won: t.won + 1, points: t.points + 3}
    def add_draw(t), do: %Team{t | matches: t.matches + 1, drawn: t.drawn + 1, points: t.points + 1}
    def add_loss(t), do: %Team{t | matches: t.matches + 1, lost: t.lost + 1}

    def pretty_print(t) do
      "#{String.pad_trailing(t.name, 31)}|  #{t.matches} |  #{t.won} |  #{t.drawn} |  #{t.lost} |  #{t.points}"
    end
  end

  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    input
    |> split
    |> aggregate
    |> Map.to_list
    |> sort
    |> pretty_print
  end

  defp split(input) do
    input
    |> Enum.map(fn row -> String.split(row, ";") end)
    |> Enum.filter(&valid_row?/1)
  end

  defp aggregate(rows) do
    rows
    |> Enum.reduce(%{}, fn [a, b, type], acc ->
      first = Map.get(acc, a, %Team{name: a})
      second = Map.get(acc, b, %Team{name: b})
      case type do
        "win" -> Map.merge(acc, %{a => Team.add_win(first), b => Team.add_loss(second)})
        "draw" -> Map.merge(acc, %{a => Team.add_draw(first), b => Team.add_draw(second)})
        "loss" -> Map.merge(acc, %{a => Team.add_loss(first), b => Team.add_win(second)})
      end
    end)
  end

  defp sort(teams) do
    teams
    |> Enum.sort(fn {_, a}, {_, b} -> a.points >= b.points end)
  end

  defp pretty_print(teams) do
    header = "Team                           | MP |  W |  D |  L |  P"
    [header | Enum.map(teams, fn {_, team} -> Team.pretty_print(team) end)]
    |> Enum.join("\n")
  end

  defp valid_row?(row) do
    case row do
      [_, _, "win"] -> true
      [_, _, "draw"] -> true
      [_, _, "loss"] -> true
      _ -> false
    end
  end
end
