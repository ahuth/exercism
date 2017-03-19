defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    rna
    |> get_proteins
    |> present
  end

  defp present([]), do: {:error, "invalid RNA"}
  defp present(proteins), do: {:ok, proteins}

  defp get_proteins(rna) do
    rna
    |> to_codons
    |> to_proteins
  end

  defp to_codons(rna) do
    rna
    |> String.codepoints
    |> Enum.chunk(3)
    |> Enum.map(&Enum.join/1)
  end

  defp to_proteins(codons) do
    codons
    |> Enum.reduce_while([], fn (codon, acc) ->
      case of_codon(codon) do
        {:ok, "STOP"} -> {:halt, acc}
        {:ok, protein} -> {:cont, acc ++ [protein]}
        _ -> {:halt, acc}
      end
    end)
  end

  @doc """
  Given a codon, return the corresponding protein
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon("UGU"), do: {:ok, "Cysteine"}
  def of_codon("UGC"), do: {:ok, "Cysteine"}
  def of_codon("UUA"), do: {:ok, "Leucine"}
  def of_codon("UUG"), do: {:ok, "Leucine"}
  def of_codon("AUG"), do: {:ok, "Methionine"}
  def of_codon("UUU"), do: {:ok, "Phenylalanine"}
  def of_codon("UUC"), do: {:ok, "Phenylalanine"}
  def of_codon("UCU"), do: {:ok, "Serine"}
  def of_codon("UCC"), do: {:ok, "Serine"}
  def of_codon("UCA"), do: {:ok, "Serine"}
  def of_codon("UCG"), do: {:ok, "Serine"}
  def of_codon("UGG"), do: {:ok, "Tryptophan"}
  def of_codon("UAU"), do: {:ok, "Tyrosine"}
  def of_codon("UAC"), do: {:ok, "Tyrosine"}
  def of_codon("UAA"), do: {:ok, "STOP"}
  def of_codon("UAG"), do: {:ok, "STOP"}
  def of_codon("UGA"), do: {:ok, "STOP"}
  def of_codon(_), do: {:error, "invalid codon"}
end
