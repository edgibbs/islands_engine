defmodule IslandSetTest do
  use ExUnit.Case

  alias IslandsEngine.IslandSet

  test "can start an agent" do
    {:ok, pid} = IslandSet.start_link
    assert Process.alive? pid
  end

  test "it sets 5 types of islands" do
    {:ok, pid} = IslandSet.start_link
    island_set = Agent.get(pid, fn state -> state end)
    assert Process.alive? island_set.atoll
    assert Process.alive? island_set.dot
    assert Process.alive? island_set.l_shape
    assert Process.alive? island_set.s_shape
    assert Process.alive? island_set.square
  end

  test "initial state is empty coordinates" do
    {:ok, pid} = IslandSet.start_link
    island_set = Agent.get(pid, fn state -> state end)
    assert Agent.get(island_set.atoll, &(&1)) == []
    assert Agent.get(island_set.dot, &(&1)) == []
    assert Agent.get(island_set.l_shape, &(&1)) == []
    assert Agent.get(island_set.s_shape, &(&1)) == []
    assert Agent.get(island_set.square, &(&1)) == []
  end

  test "can represent with a string" do
    {:ok, island_set} = IslandSet.start_link
    expected_output = """
    %IslandSet{atoll => []
    dot => []
    l_shape => []
    s_shape => []
    square => []
    }
    """ |> String.strip
    assert IslandSet.to_string(island_set) == expected_output
  end
end
