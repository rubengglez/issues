defmodule CliTest do
  use ExUnit.Case
  doctest Issues.CLI
  import Issues.CLI, only: [parse_args: 1, process: 1]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "three values returned if three given" do
    assert parse_args(["user", "project", "99"]) == {"user", "project", 99}
  end

  test "count is defaulted if two values given" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end

  test "should be get the result ordened by created_at in ascending way" do
    {:ok, data} = process({"rubengglez", "rubengglez.github.io", 10})
    assert is_list(data)
    assert length(data) == 2
  end
end
