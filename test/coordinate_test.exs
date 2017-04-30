defmodule CoordinateTest do
  use ExUnit.Case

  alias IslandsEngine.Coordinate

  test "has a struct with in_island and guessed" do
    assert %Coordinate{}.in_island == :none
    assert %Coordinate{}.guessed? == false
  end

  test "can start an agent" do
    {:ok, pid} = Coordinate.start_link
    assert Process.alive? pid
  end

  test "check on the island's state" do
    {:ok, coordinate} = Coordinate.start_link
    assert Coordinate.guessed?(coordinate) == false
  end

  test "can get the island's current state" do
    {:ok, coordinate} = Coordinate.start_link
    assert Coordinate.island(coordinate) == :none
  end

  test "coordinate of an island or not" do
    {:ok, coordinate} = Coordinate.start_link
    assert Coordinate.in_island?(coordinate) == false
    Coordinate.set_in_island(coordinate, :on_land)
    assert Coordinate.in_island?(coordinate) == true
  end

  test "can set in the island as long as it is an atom" do
    {:ok, coordinate} = Coordinate.start_link
    Coordinate.set_in_island(coordinate, :giligans_island)
    assert Coordinate.island(coordinate) == :giligans_island
    assert_raise FunctionClauseError, "no function clause matching in IslandsEngine.Coordinate.set_in_island/2", fn ->
      Coordinate.set_in_island(coordinate, "giligans_island")
    end
  end
end
