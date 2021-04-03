defmodule SpotlightWeb.SpotlightView do
  use SpotlightWeb, :view

  def group_items_by_first_letter(items) do
    items
    |> Enum.group_by(fn item -> item["name"] |> String.at(0) end)
  end
end