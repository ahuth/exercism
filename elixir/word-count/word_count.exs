defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> split_underscores
    |> remove_punctuation
    |> String.split
    |> downcase
    |> count_words
  end

  defp split_underscores(sentence) do
    String.replace(sentence, "_", " ")
  end

  defp remove_punctuation(sentence) do
    String.replace(sentence, ~r/[^\w\d\s-]/u, "")
  end

  defp count_words(words) do
    Enum.reduce(words, %{}, &count_word/2)
  end

  defp downcase(words) do
    Enum.map(words, &String.downcase/1)
  end

  defp count_word(word, acc) do
    Map.update(acc, word, 1, &add_one/1)
  end

  defp add_one(num) do
    num + 1
  end
end