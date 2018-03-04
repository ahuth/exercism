defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data, left \\ nil, right \\ nil) do
    %{data: data, left: left, right: right}
  end

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(node, data) do
    cond do
      data > node.data -> insert_right(node, data)
      true -> insert_left(node, data)
    end
  end

  defp insert_left(node, data) do
    case node do
      %{data: val, left: nil, right: right} ->
        new(val, new(data), right)
      _ ->
        new(node.data, insert(node.left, data), node.right)
    end
  end

  defp insert_right(node, data) do
    case node do
      %{data: val, left: left, right: nil} ->
        new(val, left, new(data))
      _ ->
        new(node.data, node.left, insert(node.right, data))
    end
  end

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(tree) do
    tree
    |> in_order([])
    |> Enum.reverse
  end

  defp in_order(nil, list), do: list
  defp in_order(tree, list) do
    left = in_order(tree.left, list)
    middle = [tree.data | left]
    in_order(tree.right, middle)
  end
end
