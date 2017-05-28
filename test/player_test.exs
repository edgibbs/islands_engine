defmodule PlayerTest do
  use ExUnit.Case

  alias IslandsEngine.{Player}

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

  test "can represent with a string" do
    {:ok, player} = Player.start_link
    assert Regex.match?(~r/%Player{/, Player.to_string(player))
  end
end
