defmodule GithubTest do
  use ExUnit.Case, async: true
  # doctest Issues.GithubIssues
  import Issues.GithubIssues, only: [fetch: 2]

  test "make an http request" do
    {result, _} = fetch("rubengglez", "rubengglez.github.io")
    assert result == :ok
  end

  test "when trying to get a resource that doesn't exist, an error should be returned" do
    {result, {_, body}} = fetch("rubengglez", "repo-doesnt-exist")
    assert result == :error
    assert body["message"] == "Not Found"
  end
end
