defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    parts = String.split(string, ~r/\s|(?<!^)(?=[A-Z])/, trim: true)
    letters = Enum.map_join(parts, &String.first/1)
    String.upcase(letters)
  end
end