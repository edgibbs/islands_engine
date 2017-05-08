defmodule IslandsEngine.Board do
  alias IslandsEngine.Coordinate

  def start_link do
    Agent.start_link(fn -> %{} end)
  end
end
