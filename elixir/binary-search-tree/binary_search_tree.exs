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
  def insert(nil, data), do: new(data)
  def insert(%{data: val} = tree, data) when data > val do
    Map.update!(tree, :right, &insert(&1, data))
  end
  def insert(tree, data) do
    Map.update!(tree, :left, &insert(&1, data))
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
