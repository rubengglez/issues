defmodule Issues.Format do
  @doc """
    Sort a list of maps using the created_at field contained in each map in ascending way

    ## Examples
      iex(1)> Issues.Format.sort([%{"id" => 2, "created_at" => 3}, %{"id" => 4, "created_at" => 2}])
      [%{"created_at" => 2, "id" => 2}, %{"created_at" => 3, "id" => 2}]
  """
  def sort(list_of_maps) do
    Enum.sort(list_of_maps, fn a, b ->
      a["created_at"] <= b["created_at"]
    end)
  end
end
