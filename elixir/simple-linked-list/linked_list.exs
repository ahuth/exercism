defmodule LinkedList do
  import Kernel, except: [length: 1]

  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new(items \\ []) do
    {:ok, pid} = Agent.start_link(fn -> items end)
    pid
  end

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem) do
    Agent.update(list, fn list -> [elem|list] end)
    list
  end

  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length(list) do
    Kernel.length(to_list(list))
  end

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(list) do
    length(list) == 0
  end

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek(list) do
    case to_list(list) do
      [] -> {:error, :empty_list}
      [head|_] -> {:ok, head}
    end
  end

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail(list) do
    case to_list(list) do
      [] -> {:error, :empty_list}
      _ ->
        Agent.update(list, fn [_|tail] -> tail end)
        {:ok, list}
    end
  end

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop(list) do
    case to_list(list) do
      [] -> {:error, :empty_list}
      [head|_] ->
        Agent.update(list, fn [_|tail] -> tail end)
        {:ok, head, list}
    end
  end

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list) do
    new(list)
  end

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list) do
    Agent.get(list, fn list -> list end)
  end

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list) do
    Agent.update(list, fn items -> Enum.reverse(items) end)
    list
  end
end
