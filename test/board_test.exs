defmodule BoardTest do
  use ExUnit.Case

  alias IslandsEngine.Board
  alias IslandsEngine.Coordinate

  test "can start an agent" do
    {:ok, pid} = Board.start_link
    assert Process.alive? pid
  end

  test "boards have coordinates" do
    {:ok, board} = Board.start_link
    coordinate = Board.get_coordinate(board, :j10)
    assert Coordinate.to_string(coordinate) == "(in_island:none, guessed:false)"
  end

  test "getting coordinates errors out if you don't use an atom key" do
    {:ok, board} = Board.start_link
    assert_raise FunctionClauseError, "no function clause matching in IslandsEngine.Board.get_coordinate/2", fn ->
      Board.get_coordinate(board, "j10")
    end
  end

  test "can make a guess that marks it as guessed" do
    {:ok, board} = Board.start_link
    Board.guess_coordinate(board, :j10)
    coordinate = Board.get_coordinate(board, :j10)
    assert Coordinate.guessed?(coordinate) == true
  end

  test "can hit a coordinate" do
    {:ok, board} = Board.start_link
    Board.set_coordinate_in_island(board, :j10, :paradise)
    Board.guess_coordinate(board, :j10)
    assert Board.coordinate_hit?(board, :j10)
  end

  test "has a sorta nice string representation" do
    {:ok, board} = Board.start_link
    assert Regex.match?(~r{a1 => \(in_island:none, guessed:false\)}, Board.to_string(board))
  end
end
