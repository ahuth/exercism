defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([head|tail]) do
    1 + count(tail)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reduce(l, [], fn(x, acc) -> [x|acc] end)
  end

  @spec map(list, (any -> any)) :: list
  def map([], _), do: []
  def map([head|tail], f) do
    [f.(head)|map(tail, f)]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _), do: []
  def filter([head|tail], f) do
    cond do
      f.(head) -> [head|filter(tail, f)]
      true -> filter(tail, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _f), do: acc
  def reduce([head|tail], acc, f) do
    reduce(tail, f.(head, acc), f)
  end

  @spec append(list, list) :: list
  def append([], []), do: []
  def append(a, []), do: a
  def append([], b), do: b
  def append([head|tail], b) do
    [head|append(tail, b)]
  end

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([head|tail]) do
    append(head, concat(tail))
  end
end