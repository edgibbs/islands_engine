defmodule IslandsEngine.Game do
  use GenServer
  require IEx;

  alias IslandsEngine.Game

  def start_link do
    GenServer.start_link(Game, %{}, [])
  end

  def handle_info(:first, state) do
    IO.puts "This message has been handled by the handle_info/2, matching on :first."
    {:noreply, state}
  end

  def call_demo(game) do
    GenServer.call(game, :demo)
  end

  def handle_call(:demo, _from, state) do
    {:reply, state, state}
  end
end
