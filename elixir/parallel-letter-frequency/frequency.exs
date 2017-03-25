defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: map
  def frequency([], _), do: []
  def frequency(texts, workers) do
    texts
    |> Enum.join
    |> String.downcase
    |> String.replace(~r/[^a-zü]/, "")
    |> String.codepoints
    |> Enum.chunk(workers, workers, [])
    |> parallel_map(&count_letters/1)
    |> combine_results
  end

  defp combine_results(results) do
    Enum.reduce(results, %{}, fn (result, acc)  ->
      Map.merge(acc, result, fn (_key, val1, val2) ->
        val1 + val2
      end)
    end)
  end

  defp count_letters(group) do
    count_by(group, &(&1))
  end

  defp count_by(collection, func) do
    collection
    |> Enum.group_by(func)
    |> Enum.reduce(%{}, fn ({key, value}, acc) ->
      Map.put(acc, key, Enum.count(value))
    end)
  end

  defp parallel_map(collection, func) do
    me = self()
    pids = Enum.map(collection, fn item ->
      spawn_link(fn ->
        send me, {self(), func.(item)}
      end)
    end)
    Enum.map(pids, fn pid ->
      receive do
        {^pid, result} -> result
      end
    end)
  end
end
