defmodule GameTest do
  use ExUnit.Case, async: true

  import ExUnit.CaptureIO

  alias IslandsEngine.Game

  def setup do
    IO.puts "what"
    {:ok, game} = Game.start_link
    {:ok, game: game}
  end

  test "handles a :first message" do
    assert capture_io(fn -> Game.handle_info(:first, %{}) end) == "This message has been handled by the handle_info/2, matching on :first.\n"
  end
end
