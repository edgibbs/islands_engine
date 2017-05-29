defmodule GameTest do
  use ExUnit.Case, async: true

  import ExUnit.CaptureIO

  alias IslandsEngine.Game

  setup do
    {:ok, game} = Game.start_link
    {:ok, game: game}
  end

  test "handles a :first message" do
    assert capture_io(fn -> Game.handle_info(:first, %{}) end) == "This message has been handled by the handle_info/2, matching on :first.\n"
  end

  test "handles calls", %{game: game} do
    state = GenServer.call(game, :demo)
    assert state == %{}
  end
end
