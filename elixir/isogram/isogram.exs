defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    sentence
    |> sanitize
    |> String.graphemes
    |> Enum.uniq
    |> Enum.join
    |> unchanged?(sanitize(sentence))
  end

  defp sanitize(sentence) do
    sentence
    |> String.replace(~r/[- ]/, "")
  end

  defp unchanged?(deduped, original) do
    deduped == original
  end
end
