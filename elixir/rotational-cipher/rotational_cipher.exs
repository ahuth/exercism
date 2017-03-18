defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, 0), do: text
  def rotate(text, 26), do: text
  def rotate(text, shift) do
    text
    |> String.codepoints
    |> shift_each(shift)
    |> Enum.join
  end

  defp shift_each(codepoints, shift) do
    Enum.map(codepoints, &(shift_one(&1, shift)))
  end

  defp shift_one(codepoint, shift) do
    case String.match?(codepoint, ~r/[A-Za-z]/) do
      true ->
        <<b>> = codepoint
        <<encode(b, shift)>>
      false ->
        codepoint
    end
  end

  defp encode(ascii, shift) when ascii < 91, do: encode_max(ascii, shift, 90)
  defp encode(ascii, shift), do: encode_max(ascii, shift, 122)

  defp encode_max(ascii, shift, limit) when ascii + shift > limit, do: ascii + shift - 26
  defp encode_max(ascii, shift, _), do: ascii + shift
end
