defmodule IslandsEngine.IslandSet do
  defstruct atoll: :none, dot: :none, l_shape: :none, s_shape: :none, square: :none
  alias IslandsEngine.{Island,IslandSet}

  def start_link do
    Agent.start_link(fn -> initialized_set() end)
  end

  defp initialized_set do
    Enum.reduce(keys(), %IslandSet{}, fn key, set ->
      {:ok, island} = Island.start_link
      Map.put(set, key, island)
    end)
  end

  defp keys do
    %IslandSet{}
    |> Map.from_struct
    |> Map.keys
  end
end
