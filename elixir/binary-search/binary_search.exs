defmodule BinarySearch do
  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    Tuple.to_list(numbers)
    |> do_search(key, 0)
  end

  defp do_search([], _, _), do: :not_found
  defp do_search(numbers, key, offset) do
    mid = div(length(numbers), 2)
    guess = Enum.at(numbers, mid)
    {left, right} = Enum.split(numbers, mid)
    cond do
      guess == key -> {:ok, mid + offset}
      guess > key -> do_search(left, key, offset)
      guess < key -> do_search(tl(right), key, mid + offset + 1)
    end
  end
end
