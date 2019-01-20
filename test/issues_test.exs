defmodule IssuesTest do
  use ExUnit.Case
  doctest Issues
  @tag :skip
  test "greets the world" do
    assert Issues.hello() == :world
  end
end
