defmodule GameTest do
  use ExUnit.Case, async: true

  alias IslandsEngine.{Game}

  setup do
    {:ok, game} = Game.start_link("George P. Burdell")
    {:ok, game: game}
  end

  test "can't start a game without a name" do
    assert_raise FunctionClauseError, "no function clause matching in IslandsEngine.Game.start_link/1", fn ->
      Game.start_link(nil)
    end
  end

  test "can't add a player without a name", %{game: game} do
    assert_raise FunctionClauseError, "no function clause matching in IslandsEngine.Game.add_player/2", fn ->
      Game.add_player(game, nil)
    end
  end

  test "initializes two players", %{game: game} do
    state = Game.call_demo(game)
    player1_state = Agent.get(state.player1, &(&1))
    assert player1_state.name == "George P. Burdell"
    player2_state = Agent.get(state.player2, &(&1))
    assert player2_state.name == :none
  end

  test "can set the name of the second player", %{game: game} do
    Game.add_player(game, "Aria")
    state = Game.call_demo(game)
    player2_state = Agent.get(state.player2, &(&1))
    assert player2_state.name == "Aria"
  end
end
