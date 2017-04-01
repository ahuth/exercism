defmodule PigLatin do
  @consonants ["a", "e", "i", "o", "u"]
  @like_consontants ["yt", "xr"]
  @special_two_letters ["ch", "qu", "th"]
  @special_three_letters ["squ", "thr", "sch"]

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase)do
    phrase
    |> String.split
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  defp translate_word(word) do
    [first, second, third | rest] = String.codepoints(word)
    cond do
      first in @consonants -> word <> "ay"
      first <> second <> third in @special_three_letters -> Enum.join(rest) <> first <> second <> third <> "ay"
      first <> second in @special_two_letters -> third <> Enum.join(rest) <> first <> second <> "ay"
      first <> second in @like_consontants -> word <> "ay"
      true -> second <> third <> Enum.join(rest) <> first <> "ay"
    end
  end
end
