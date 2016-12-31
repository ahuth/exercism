defmodule BracketPush do
  @openers ["{", "[", "("]
  @closers ["}", "]", ")"]

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do str
    |> String.split(~r//, trim: true)
    |> balance([])
  end

  defp balance([], []), do: true
  defp balance([], _), do: false
  defp balance(["}"|_], [current|_]) when current != "{", do: false
  defp balance(["]"|_], [current|_]) when current != "[", do: false
  defp balance([")"|_], [current|_]) when current != "(", do: false
  defp balance([h|t], stack) when h in @openers, do: balance(t, [h] ++ stack)
  defp balance([h|t], [_|new_stack]) when h in @closers, do: balance(t, new_stack)
  defp balance([_|tail], stack), do: balance(tail, stack)
end