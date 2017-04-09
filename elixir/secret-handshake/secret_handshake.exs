defmodule SecretHandshake do
  @events %{
    1 => "wink",
    2 => "double blink",
    4 => "close your eyes",
    8 => "jump"
  }
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    code
    |> map_to_actions
    |> Enum.filter(&(&1))
    |> handle_reverse(code)
  end

  defp map_to_actions(code) do
    Enum.map(@events, fn {bit, action} ->
      if :erlang.band(code, bit) == bit, do: action, else: nil
    end)
  end

  defp handle_reverse(actions, code) do
    if :erlang.band(code, 16) == 16, do: Enum.reverse(actions), else: actions
  end
end
