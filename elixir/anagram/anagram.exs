defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    ordered_base = order(base)
    Enum.filter(candidates, fn(candidate) ->
      ordered_base == order(candidate) && String.downcase(base) != String.downcase(candidate)
    end)
  end

  defp order(string) do
    string
    |> String.downcase
    |> String.to_char_list
    |> Enum.sort
    |> Enum.join
  end
end