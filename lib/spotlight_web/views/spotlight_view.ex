defmodule SpotlightWeb.SpotlightView do
  use SpotlightWeb, :view

  def group_items_by_first_letter(items) do
    items
    |> Enum.group_by(fn item -> item["name"] |> String.at(0) end)
  end

  def is_selected_item_available?(items, selected_item), do: selected_item in items

  def get_selected_item_search_description(selected_item) do
    if Enum.empty?(selected_item), do: "",
    else: "— #{selected_item["name"]} - #{selected_item["name"] |> String.at(0)}"
  end
end