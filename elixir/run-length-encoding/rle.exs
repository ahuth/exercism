defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(string) do string
    |> split_chunks
    |> Enum.map_join(&encode_chunk/1)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do string
    |> capture_chunks
    |> Enum.map_join(&decode_chunk/1)
  end

  defp split_chunks(string) do string
    |> to_char_list
    |> Enum.chunk_by(&(&1))
    |> Enum.map(&to_string/1)
  end

  defp encode_chunk(chunk) do
    "#{String.length(chunk)}#{String.first(chunk)}"
  end

  defp capture_chunks(string) do
    Regex.scan(~r/(\d+)(.)/, string)
  end

  defp decode_chunk([_entire_match, number, char]) do
    String.duplicate(char, String.to_integer(number))
  end
end