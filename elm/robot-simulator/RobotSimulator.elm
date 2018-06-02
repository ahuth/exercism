module RobotSimulator
    exposing
        ( Bearing(..)
        , Robot
        , advance
        , defaultRobot
        , simulate
        , turnLeft
        , turnRight
        )

type Bearing
    = North
    | East
    | South
    | West

type alias Robot =
    { bearing : Bearing
    , coordinates : { x : Int, y : Int }
    }

defaultRobot : Robot
defaultRobot =
    { bearing = North
    , coordinates = { x = 0, y = 0 }
    }

turnRight : Robot -> Robot
turnRight robot =
    let
      newDirection = case robot.bearing of
        North -> East
        East -> South
        South -> West
        West -> North
    in
      { robot | bearing = newDirection }

turnLeft : Robot -> Robot
turnLeft robot =
    let
      newDirection = case robot.bearing of
        North -> West
        West -> South
        South -> East
        East -> North
    in
      { robot | bearing = newDirection }

advance : Robot -> Robot
advance robot =
    let
      oldCoordinates = robot.coordinates
      newCoordinates = case robot.bearing of
        North ->
          { oldCoordinates | y = oldCoordinates.y + 1 }
        East ->
          { oldCoordinates | x = oldCoordinates.x + 1 }
        South ->
          { oldCoordinates | y = oldCoordinates.y - 1 }
        West ->
          { oldCoordinates | x = oldCoordinates.x - 1 }
    in
      { robot | coordinates = newCoordinates }

simulate : String -> Robot -> Robot
simulate directions robot =
    directions
      |> String.toList
      |> List.foldl execute robot

execute : Char -> Robot -> Robot
execute char robot =
    let
      command = case char of
        'R' ->
          turnRight
        'L' ->
          turnLeft
        'A' ->
          advance
        _ ->
          identity
    in
      command robot
