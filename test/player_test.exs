defmodule PlayerTest do
  use ExUnit.Case

  alias IslandsEngine.{IslandSet, Board, Coordinate, Player}

  test "can start an agent" do
    {:ok, pid} = Player.start_link
    assert Process.alive? pid
  end

  test "can set a player's name" do
    {:ok, player} = Player.start_link
    Player.set_name(player, "George P. Burdell")
    player_state = Agent.get(player, fn state -> state end)
    assert "George P. Burdell" == player_state.name
  end
end
