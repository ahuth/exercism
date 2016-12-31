defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    strand
    |> validate!
    |> Enum.count fn(item) -> item == nucleotide end
  end

  @spec histogram([char]) :: Dict.t
  def histogram(strand) do
    %{
      ?A => count(strand, ?A),
      ?T => count(strand, ?T),
      ?C => count(strand, ?C),
      ?G => count(strand, ?G)
    }
  end

  defp validate!(strand) do
    if !valid?(strand) do
      raise ArgumentError
    end
    strand
  end

  defp valid?(strand) do
    strand
    |> Enum.all? &valid_nucleotide?/1
  end

  defp valid_nucleotide?(nucleotide) when nucleotide in @nucleotides, do: true
  defp valid_nucleotide?(nucleotide), do: false
end