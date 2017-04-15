defmodule RobotSimulator do
  defstruct x: 0, y: 0, direction: :north

  @spec create(direction :: atom, position :: { integer, integer }) :: any
  def create(), do: %RobotSimulator{}
  def create(dir, _) when not dir in [:north, :south, :east, :west], do: {:error, "invalid direction"}
  def create(_, pos) when not (is_tuple(pos) and tuple_size(pos) == 2 and is_integer(elem(pos, 0)) and is_integer(elem(pos, 1))), do: {:error, "invalid position"}
  def create(dir, {x, y}) do
    %RobotSimulator{x: x, y: y, direction: dir}
  end

  @spec direction(robot :: any) :: atom
  def direction(robot), do: robot.direction

  @spec position(robot :: any) :: { integer, integer }
  def position(robot), do: {robot.x, robot.y}

  @spec simulate(robot :: any, instructions :: String.t ) :: any
  def simulate(robot, instructions) do
    instructions
    |> String.codepoints
    |> Enum.reduce_while(robot, &process/2)
  end

  defp process("L", robot), do: {:cont, %{robot | direction: left_of(robot.direction)}}
  defp process("R", robot), do: {:cont, %{robot | direction: right_of(robot.direction)}}
  defp process("A", robot) do
    case robot.direction do
      :north -> {:cont, %{robot | y: robot.y + 1}}
      :south -> {:cont, %{robot | y: robot.y - 1}}
      :east -> {:cont, %{robot | x: robot.x + 1}}
      :west -> {:cont, %{robot | x: robot.x - 1}}
    end
  end
  defp process(_, _), do: {:halt, {:error, "invalid instruction"}}

  defp left_of(:north), do: :west
  defp left_of(:west), do: :south
  defp left_of(:south), do: :east
  defp left_of(:east), do: :north

  defp right_of(:north), do: :east
  defp right_of(:east), do: :south
  defp right_of(:south), do: :west
  defp right_of(:west), do: :north
end
