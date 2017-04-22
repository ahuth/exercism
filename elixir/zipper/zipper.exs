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
  def to_tree(%Zipper{root: root}) do
    root
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
  def up(%Zipper{trail: []}), do: nil
  def up(z) do
    %Zipper{focus: walk_down(z.root, Enum.reverse(z.trail)), trail: tl(z.trail), root: z.root}
  end

  defp walk_down(bt, [_]), do: bt
  defp walk_down(bt, [:left | trail]), do: walk_down(bt.left, trail)
  defp walk_down(bt, [:right | trail]), do: walk_down(bt.right, trail)

  @doc """
  Set the value of the focus node.
  """
  @spec set_value(Z.t, any) :: Z.t
  def set_value(z, v) do
    new_focus = %BinTree{z.focus | value: v}
    new_root = rebuild(z.root, Enum.reverse(z.trail), new_focus)
    %Zipper{focus: new_focus, root: new_root, trail: z.trail}
  end

  defp rebuild(tree, [], new_subtree), do: new_subtree
  defp rebuild(tree, [:left], new_subtree), do: %BinTree{tree | left: new_subtree}
  defp rebuild(tree, [:right], new_subtree), do: %BinTree{tree | right: new_subtree}
  defp rebuild(tree, [:left | trail], new_subtree), do: rebuild(tree.left, trail, new_subtree)
  defp rebuild(tree, [:right | trail], new_subtree), do: rebuild(tree.right, trail, new_subtree)

  @doc """
  Replace the left child tree of the focus node.
  """
  @spec set_left(Z.t, BT.t) :: Z.t
  def set_left(z, l) do
    new_focus = %BinTree{z.focus | left: l}
    new_root = rebuild(z.root, Enum.reverse(z.trail), new_focus)
    %Zipper{focus: new_focus, root: new_root, trail: z.trail}
  end

  @doc """
  Replace the right child tree of the focus node.
  """
  @spec set_right(Z.t, BT.t) :: Z.t
  def set_right(z, r) do
    new_focus = %BinTree{z.focus | right: r}
    new_root = rebuild(z.root, Enum.reverse(z.trail), new_focus)
    %Zipper{focus: new_focus, root: new_root, trail: z.trail}
  end
end
