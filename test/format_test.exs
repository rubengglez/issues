defmodule FormatTest do
  use ExUnit.Case
  doctest Issues.Format
  import Issues.Format, only: [sort: 1]

  test "should sort the list of maps in ascending order by created_at field" do
    listOfMaps = [
      %{"id" => 2, "created_at" => "2019-02-21T16:08:40Z"},
      %{"id" => 1, "created_at" => "2019-01-21T16:08:40Z"},
    ]
    [head | _] = sort(listOfMaps)
    assert head["id"] == 1
  end
end
