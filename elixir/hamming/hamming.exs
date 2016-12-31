defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(a, b) when a == b, do: 0
  def hamming_distance(a, b) when length(a) != length(b), do: nil
  def hamming_distance([head1|tail1], [head2|tail2]) do
    score = if head1 == head2, do: 0, else: 1
    score + hamming_distance(tail1, tail2)
  end
end