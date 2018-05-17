defmodule SimpleCipher do
  @letters ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

  @doc """
  Given a `plaintext` and `key`, encode each character of the `plaintext`.
  """
  def encode(plaintext, key) do
    plaintext
    |> String.codepoints
    |> Enum.zip(key_shifts(key, String.length(plaintext)))
    |> Enum.map(&shift_letter/1)
    |> Enum.join
  end

  defp key_shifts(key, key_length) do
    key
    |> String.pad_trailing(key_length, key)
    |> String.codepoints
    |> Enum.map(fn letter -> Enum.find_index(@letters, &(&1 == letter)) end)
  end

  defp shift_letter({letter, shift}) when letter in @letters do
    <<point>> = letter
    <<point + shift>>
  end
  defp shift_letter({letter, _}), do: letter

  @doc """
  Given a `ciphertext` and `key`, decode each character of the `ciphertext`.
  """
  def decode(ciphertext, key) do
    ciphertext
    |> String.codepoints
    |> Enum.zip(key_shifts(key, String.length(ciphertext)))
    |> Enum.map(&unshift_letter/1)
    |> Enum.join
  end

  defp unshift_letter({letter, shift}) when letter in @letters do
    <<point>> = letter
    <<point - shift>>
  end
  defp unshift_letter({letter, _}), do: letter
end
