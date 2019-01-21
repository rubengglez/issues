defmodule GithubTest do
  use ExUnit.Case, async: true
  # doctest Issues.GithubIssues
  import Issues.GithubIssues, only: [fetch: 2]

  test "make an http request" do
    {result, _} = fetch("rubengglez", "rubengglez.github.io")
    assert result == :ok
  end
end
