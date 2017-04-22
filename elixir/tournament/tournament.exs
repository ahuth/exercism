defmodule Tournament do
  defmodule Team do
    defstruct matches: 0, won: 0, drawn: 0, lost: 0, points: 0

    def add_win(t), do: %Team{t | matches: t.matches + 1, won: t.won + 1, points: t.points + 3}
    def add_draw(t), do: %Team{t | matches: t.matches + 1, drawn: t.won + 1, points: t.points + 1}
    def add_loss(t), do: %Team{t | matches: t.matches + 1, lost: t.won + 1}

    def pretty_print(t, name) do
      "#{String.pad_trailing(name, 31)}|  #{t.matches} |  #{t.won} |  #{t.drawn} |  #{t.lost} |  #{t.points}"
    end
  end

  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    input
    |> split
    |> aggregate
    |> convert
    |> sort
    |> pretty_print
  end

  defp split(input) do
    input
    |> Enum.map(fn row -> String.split(row, ";") end)
    |> Enum.map(fn [a, b, type] -> {type, a, b} end)
  end

  defp aggregate(rows) do
    rows
    |> Enum.reduce(%{}, fn {type, a, b}, acc ->
      first = Map.get(acc, a, %Team{})
      second = Map.get(acc, b, %Team{})
      case type do
        "win" -> Map.merge(acc, %{a => Team.add_win(first), b => Team.add_loss(second)})
        "draw" -> Map.merge(acc, %{a => Team.add_draw(first), b => Team.add_draw(second)})
        "loss" -> Map.merge(acc, %{a => Team.add_loss(first), b => Team.add_win(second)})
      end
    end)
  end

  defp convert(team_map) do
    team_map
    |> Enum.map(fn {name, team} -> {name, team} end)
  end

  defp sort(teams) do
    teams
    |> Enum.sort(fn {_, a}, {_, b} -> a.points >= b.points end)
  end

  defp pretty_print(teams) do
    header = "Team                           | MP |  W |  D |  L |  P"
    [header | Enum.map(teams, fn {name, team} -> Team.pretty_print(team, name) end)]
    |> Enum.join("\n")
  end
end
