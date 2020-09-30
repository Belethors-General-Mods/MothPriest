defmodule MothPriestTest do
  use ExUnit.Case
  doctest MothPriest

  test "greets the world" do
    assert MothPriest.hello() == :world
  end
end
