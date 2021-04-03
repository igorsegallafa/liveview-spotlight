defmodule SpotlightWeb.SpotlightLive do
  use SpotlightWeb, :live_view

  @items [
    %{
      "name" => "Testing",
      "url" => "https://www.google.com.br/",
      "description" => "Testing description 1"
    },
    %{
      "name" => "Abc",
      "url" => "https://www.google.com.br/",
      "description" => "Testing description 2"
    },
    %{
      "name" => "Acde",
      "url" => "https://www.google.com.br/",
      "description" => "Testing description 3"
    },
  ]

  def mount(_params, _session, socket) do
    {:ok, assign(socket, items: format_item_id_and_sort_list(@items), selected_item_id: -1)}
  end

  def render(assigns) do
    render(SpotlightWeb.SpotlightView, "index.html", assigns)
  end

  def handle_event("search", _params, socket) do
    {:noreply, socket}
  end

  def handle_event("select", _params, socket) do
    {:noreply, socket}
  end

  def handle_event("select_item", _params = %{"value" => ""}, socket), do: {:noreply, socket}
  def handle_event("select_item", _params = %{"value" => item_id}, socket) do
    {:noreply, assign(socket, selected_item_id: String.to_integer(item_id))}
  end
  def handle_event("select_item", _params, socket), do: {:noreply, socket}

  defp format_item_id_and_sort_list(items) do
    items
    |> Enum.sort_by(&(&1["name"]))
    |> Enum.with_index
    |> Enum.map(fn {item_map, index} -> Map.put(item_map, "id", index) end)
  end
end
