defmodule Wordy do
  @blacklist ~w(What is by)
  @operations %{"plus" => &Kernel.+/2, "minus" => &Kernel.-/2, "multiplied" => &Kernel.*/2, "divided" => &Kernel.div/2}

  @spec answer(String.t) :: integer
  def answer(question) do
    question
    |> sanitize
    |> get_operands
    |> normalize
    |> apply_operands
  end

  defp sanitize(string) do
    string
    |> String.replace_trailing("?", "")
  end

  defp get_operands(string) do
    string
    |> String.split(" ")
    |> Enum.reject(&(&1 in @blacklist))
  end

  defp normalize(operands) do
    Enum.map(operands, fn op ->
      cond do
        is_numeric?(op) -> String.to_integer(op)
        is_operation?(op) -> @operations[op]
        true -> raise ArgumentError
      end
    end)
  end

  defp is_numeric?(string) do
    case Float.parse(string) do
      {_, ""} -> true
      _ -> false
    end
  end

  defp is_operation?(string) do
    string in Map.keys(@operations)
  end

  defp apply_operands([head | tail]), do: apply_operands(tail, head)
  defp apply_operands([], acc), do: acc
  defp apply_operands([a, b | rest], acc) do
    apply_operands(rest, a.(acc, b))
  end
end
