defmodule Garden do
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t()) :: map
  def info(info_string) do
    info(info_string, [:alice, :bob, :charlie, :david, :eve, :fred, :ginny, :harriet, :ileana, :jospeh, :kincaid, :larry])
  end

  @spec info(String.t(), list) :: map
  def info(info_string, student_names) do
    rows = info_string |> String.split
    top = rows |> Enum.at(0) |> String.codepoints |> Enum.chunk(2)
    bottom = rows |> Enum.at(1) |> String.codepoints |> Enum.chunk(2)
    Enum.with_index(student_names)
    |> Enum.reduce_while(%{}, fn ({name, index}, acc) ->
      case Enum.at(top, index) do
        nil ->
          {:halt, acc}
        _ ->
          combined = Enum.at(top, index) ++ Enum.at(bottom, index)
          {:cont, Map.put(acc, name, List.to_tuple(Enum.map(combined, &(name(&1)))))}
      end
    end)
  end

  defp name("G"), do: :grass
  defp name("C"), do: :clover
  defp name("R"), do: :radishes
  defp name("V"), do: :violets
end
