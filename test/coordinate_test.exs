defmodule CoordinateTest do
  use ExUnit.Case

  alias IslandsEngine.Coordinate

  test "has a struct with in_island and guessed" do
    assert %Coordinate{}.in_island == :none
    assert %Coordinate{}.guessed? == false
  end
end
