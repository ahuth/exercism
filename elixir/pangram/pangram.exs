defmodule Pangram do
  @letters String.codepoints("abcdefghijklmnopqrstuvwxyz")

  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t) :: boolean
  def pangram?(sentence) do
    normalized = String.downcase(sentence)
    Enum.all?(@letters, fn(letter) -> String.contains?(normalized, letter) end)
  end
end
