defmodule ScaleGenerator do
  @semitones %{"m" => 1, "M" => 2, "A" => 3}
  @sharp_scale ~w(C C# D D# E F F# G G# A A# B)
  @flat_scale ~w(C Db D Eb E F Gb G Ab A Bb B C)

  @spec step(scale :: list(String.t()), tonic :: String.t(), step :: String.t()) :: list(String.t())
  def step(scale, tonic, step) do
    index = Enum.find_index(scale, &(&1 == tonic)) + @semitones[step]
    scale
    |> Stream.cycle
    |> Enum.take(index + 1)
    |> List.last
  end

  @spec chromatic_scale(tonic :: String.t()) :: list(String.t())
  def chromatic_scale(tonic \\ "C") do
    note = String.capitalize(tonic)
    find_sequence(note, 0, &next_semi/1, [note])
  end

  @spec flat_chromatic_scale(tonic :: String.t()) :: list(String.t())
  def flat_chromatic_scale(tonic \\ "C") do
    note = String.capitalize(tonic)
    find_sequence(note, 0, &next_semi_flat/1, [note])
  end

  @spec find_chromatic_scale(tonic :: String.t()) :: list(String.t())
  def find_chromatic_scale(tonic) do
    case tonic in ~w(F Bb Eb Ab Db Gb d g c f bb eb) do
      true -> flat_chromatic_scale(tonic)
      false -> chromatic_scale(tonic)
    end
  end

  @spec scale(tonic :: String.t(), pattern :: String.t()) :: list(String.t())
  def scale(tonic, pattern) do
    pattern
    |> String.codepoints
    |> do_scale(String.capitalize(tonic), [String.capitalize(tonic)])
  end

  defp do_scale([], _, acc), do: acc
  defp do_scale([head | tail], prev, acc) do
    next = step(@sharp_scale, prev, head)
    do_scale(tail, next, acc ++ [next])
  end

  defp find_sequence(_, 12, next_note, acc), do: acc
  defp find_sequence(current, index, next_note, acc) do
    next = next_note.(current)
    find_sequence(next, index + 1, next_note, acc ++ [next])
  end

  defp next_semi("C"), do: "C#"
  defp next_semi("C#"), do: "D"
  defp next_semi("D"), do: "D#"
  defp next_semi("D#"), do: "E"
  defp next_semi("E"), do: "F"
  defp next_semi("F"), do: "F#"
  defp next_semi("F#"), do: "G"
  defp next_semi("G"), do: "G#"
  defp next_semi("G#"), do: "A"
  defp next_semi("A"), do: "A#"
  defp next_semi("A#"), do: "B"
  defp next_semi("B"), do: "C"

  defp next_semi_flat("C"), do: "Db"
  defp next_semi_flat("Db"), do: "D"
  defp next_semi_flat("D"), do: "Eb"
  defp next_semi_flat("Eb"), do: "E"
  defp next_semi_flat("E"), do: "F"
  defp next_semi_flat("F"), do: "Gb"
  defp next_semi_flat("Gb"), do: "G"
  defp next_semi_flat("G"), do: "Ab"
  defp next_semi_flat("Ab"), do: "A"
  defp next_semi_flat("A"), do: "Bb"
  defp next_semi_flat("Bb"), do: "B"
  defp next_semi_flat("B"), do: "C"
end
