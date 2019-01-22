defmodule Issues.Format do
  def sort(list_of_maps) do
    Enum.sort(list_of_maps, fn a, b ->
      a["created_at"] <= b["created_at"]
    end)
  end
end
