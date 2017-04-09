defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t) :: String.t
  def parse(markdown) do
    markdown
    |> String.split("\n")
    |> Enum.map(&process_prefix/1)
    |> Enum.join
    |> wrap_list_items
  end

  defp process_prefix(text) do
    cond do
      String.starts_with?(text, "#") -> handle_header(text)
      String.starts_with?(text, "*") -> handle_list_item(text)
      true -> enclose_with_paragraph_tag(String.split(text))
    end
  end

  defp handle_header(text) do
    text
    |> parse_header_md_level
    |> enclose_with_header_tag
  end

  defp parse_header_md_level(hwt) do
    [h | t] = String.split(hwt)
    {to_string(String.length(h)), Enum.join(t, " ")}
  end

  defp handle_list_item(l) do
    t = String.split(String.trim_leading(l, "* "))
    "<li>" <> join_words_with_tags(t) <> "</li>"
  end

  defp enclose_with_header_tag({level, text}) do
    "<h#{level}>#{text}</h#{level}>"
  end

  defp enclose_with_paragraph_tag(text) do
    "<p>#{join_words_with_tags(text)}</p>"
  end

  defp join_words_with_tags(t) do
    Enum.join(Enum.map(t, fn(w) -> replace_md_with_tag(w) end), " ")
  end

  defp replace_md_with_tag(w) do
    replace_suffix_md(replace_prefix_md(w))
  end

  defp replace_prefix_md(w) do
    cond do
      w =~ ~r/^#{"__"}{1}/ -> String.replace(w, ~r/^#{"__"}{1}/, "<strong>", global: false)
      w =~ ~r/^[#{"_"}{1}][^#{"_"}+]/ -> String.replace(w, ~r/_/, "<em>", global: false)
      true -> w
    end
  end

  defp replace_suffix_md(w) do
    cond do
      w =~ ~r/#{"__"}{1}$/ -> String.replace(w, ~r/#{"__"}{1}$/, "</strong>")
      w =~ ~r/[^#{"_"}{1}]/ -> String.replace(w, ~r/_/, "</em>")
      true -> w
    end
  end

  defp wrap_list_items(text) do
    text
    |> String.replace("<li>", "<ul><li>", global: false)
    |> String.replace_suffix("</li>", "</li></ul>")
  end
end
