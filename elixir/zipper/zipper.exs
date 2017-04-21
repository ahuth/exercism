defmodule BinTree do
  import Inspect.Algebra
  @moduledoc """
  A node in a binary tree.

  `value` is the value of a node.
  `left` is the left subtree (nil if no subtree).
  `right` is the right subtree (nil if no subtree).
  """
  @type t :: %BinTree{ value: any, left: BinTree.t | nil, right: BinTree.t | nil }
  defstruct value: nil, left: nil, right: nil

  # A custom inspect instance purely for the tests, this makes error messages
  # much more readable.
  #
  # BT[value: 3, left: BT[value: 5, right: BT[value: 6]]] becomes (3:(5::(6::)):)
  def inspect(%BinTree{value: v, left: l, right: r}, opts) do
    concat ["(", to_doc(v, opts),
            ":", (if l, do: to_doc(l, opts), else: ""),
            ":", (if r, do: to_doc(r, opts), else: ""),
            ")"]
  end
end

defmodule Zipper do
  defstruct focus: nil, trail: [], root: nil

  @doc """
  Get a zipper focused on the root node.
  """
  @spec from_tree(BT.t) :: Z.t
  def from_tree(bt) do
    %Zipper{focus: bt, root: bt}
  end

  @doc """
  Get the complete tree from a zipper.
  """
  @spec to_tree(Z.t) :: BT.t
  def to_tree(%Zipper{root: complete_tree}) do
    complete_tree
  end

  @doc """
  Get the value of the focus node.
  """
  @spec value(Z.t) :: any
  def value(%Zipper{focus: focus}) do
    focus.value
  end

  @doc """
  Get the left child of the focus node, if any.
  """
  @spec left(Z.t) :: Z.t | nil
  def left(%Zipper{focus: %BinTree{left: nil}}), do: nil
  def left(%Zipper{focus: focus, trail: trail, root: root}) do
    %Zipper{focus: focus.left, trail: [:left | trail], root: root}
  end

  @doc """
  Get the right child of the focus node, if any.
  """
  @spec right(Z.t) :: Z.t | nil
  def right(%Zipper{focus: %BinTree{right: nil}}), do: nil
  def right(%Zipper{focus: focus, trail: trail, root: root}) do
    %Zipper{focus: focus.right, trail: [:right | trail], root: root}
  end

  @doc """
  Get the parent of the focus node, if any.
  """
  @spec up(Z.t) :: Z.t
  def up(%Zipper{focus: a, root: a}), do: nil
  def up(z) do
    %Zipper{z | focus: walk_down(z.root, Enum.reverse(z.trail))}
  end

  defp walk_down(_, []), do: nil
  defp walk_down(focus, [_]), do: focus
  defp walk_down(focus, [:left | trail]), do: walk_down(focus.left, trail)
  defp walk_down(focus, [:right | trail]), do: walk_down(focus.right, trail)

  @doc """
  Set the value of the focus node.
  """
  @spec set_value(Z.t, any) :: Z.t
  def set_value(z, v) do
  end

  @doc """
  Replace the left child tree of the focus node.
  """
  @spec set_left(Z.t, BT.t) :: Z.t
  def set_left(z, l) do
  end

  @doc """
  Replace the right child tree of the focus node.
  """
  @spec set_right(Z.t, BT.t) :: Z.t
  def set_right(z, r) do
  end
end
