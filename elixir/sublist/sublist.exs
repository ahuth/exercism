defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal
  def compare(a, b) when a == b, do: :equal
  def compare(a, b) do
    cond do
      contains?(a, b) -> :superlist
      contains?(b, a) -> :sublist
      true -> :unequal
    end
  end

  defp contains?(_, []), do: true
  defp contains?([], _), do: false
  defp contains?(a, b) do
    cond do
      same_first_item?(a, b) && equal_after_truncation?(a, b) -> true
      true -> contains?(tl(a), b)
    end
  end

  defp same_first_item?(a, b) do
    hd(a) === hd(b)
  end

  defp truncated_list(a, b) do
    Enum.take(a, Enum.count(b))
  end

  defp equal_after_truncation?(a, b) do
    truncated_list(a, b) == b
  end
end