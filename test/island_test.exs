defmodule IslandTest do
  use ExUnit.Case

  alias IslandsEngine.Island
  alias IslandsEngine.Coordinate

  test "can start an agent" do
    {:ok, pid} = Island.start_link
    assert Process.alive? pid
  end

  test "must replace with a list" do
    {:ok, island} = Island.start_link
    {:ok, coordinate} = Coordinate.start_link
    assert_raise FunctionClauseError, "no function clause matching in IslandsEngine.Island.replace_coordinates/2", fn ->
      Island.replace_coordinates(island, coordinate)
    end
  end

  test "can check if an island is forested" do
    {:ok, island} = Island.start_link
    {:ok, coordinate} = Coordinate.start_link
    Island.replace_coordinates(island, [coordinate])
    Coordinate.set_in_island(coordinate, :my_island)
    assert Island.forested?(island) == false
    Coordinate.guess(coordinate)
    assert Island.forested?(island)
  end

  test "makes a nice string representation of the island" do
    {:ok, island} = Island.start_link
    {:ok, coordinate} = Coordinate.start_link
    Island.replace_coordinates(island, [coordinate])
    assert Island.to_string(island) == "[(in_island:none, guessed:false)]"
  end
end
