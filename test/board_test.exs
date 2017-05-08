defmodule BoardTest do
  use ExUnit.Case

  alias IslandsEngine.Board
  alias IslandsEngine.Coordinate

  test "can start an agent" do
    {:ok, pid} = Board.start_link
    assert Process.alive? pid
  end
end
