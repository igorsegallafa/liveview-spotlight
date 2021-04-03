defmodule SpotlightWeb.SpotlightView do
  use SpotlightWeb, :view

  def group_items_by_first_letter(items) do
    items
    |> Enum.group_by(fn item -> item["name"] |> String.at(0) end)
  end

  def get_selected_item(items, item_id) do
    items
    |> Enum.filter(fn item -> item["id"] == item_id end)
    |> List.first
  end
end