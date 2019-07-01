defmodule EpmdlessElixirExampleTest do
  use ExUnit.Case
  doctest EpmdlessElixirExample

  test "greets the world" do
    assert EpmdlessElixirExample.hello() == :world
  end
end
