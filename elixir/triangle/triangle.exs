defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  defmacro invalid_side(a, b, c) do
    quote do: unquote(a) <= 0 or unquote(b) <= 0 or unquote(c) <= 0
  end

  defmacro vioaltes_inquality(a, b, c) do
    quote do
      unquote(a) + unquote(b) <= unquote(c) or unquote(a) + unquote(c) <= unquote(b) or unquote(b) + unquote(c) <= unquote(a)
    end
  end

  defmacro equal_sides(a, b, c) do
    quote do: unquote(a) == unquote(b) and unquote(a) == unquote(c)
  end

  defmacro equal_pair(a, b, c) do
    quote do: unquote(a) == unquote(b) or unquote(a) == unquote(c) or unquote(b) == unquote(c)
  end

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) when invalid_side(a, b, c), do: {:error, "all side lengths must be positive"}
  def kind(a, b, c) when vioaltes_inquality(a, b, c), do: {:error, "side lengths violate triangle inequality"}
  def kind(a, b, c) when equal_sides(a, b, c), do: {:ok, :equilateral}
  def kind(a, b, c) when equal_pair(a, b, c), do: {:ok, :isosceles}
  def kind(_, _, _), do: {:ok, :scalene}
end
