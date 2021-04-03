defmodule SpotlightWeb.SpotlightLive do
  use SpotlightWeb, :live_view

  @items_sample [
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
      "description" => "Testing description 3",
      "icon" => "bi-github",
    },
  ]

  def mount(_params, _session, socket) do
    {:ok, assign(socket, items: [], selected_item: %{})}
  end

  def render(assigns) do
    render(SpotlightWeb.SpotlightView, "index.html", assigns)
  end

  def handle_event("search", _params = %{"query" => query}, socket) do
    result =
      query
      |> query_from_result_set()
      |> prepare_items_result()

    {:noreply, assign(socket, items: result)}
  end

  def handle_event("select", _params, socket) do
    selected_item = socket.assigns.selected_item

    {:noreply, socket |> redirect(external: selected_item["url"])}
  end

  def handle_event("select_item", _params = %{"value" => item_id}, socket) do
    items = socket.assigns.items
    selected_item = get_item_by_id(items, item_id)

    {:noreply, assign(socket, selected_item: selected_item)}
  end

  defp query_from_result_set(_query = ""), do: []
  defp query_from_result_set(query) do
    @items_sample
    |> Enum.filter(fn item -> String.contains?(String.downcase(item["name"]), String.downcase(query)) end)
  end

  defp prepare_items_result(items) do
    items
    |> Enum.sort_by(&(&1["name"]))
    |> Enum.with_index
    |> Enum.map(fn {item_map, index} -> Map.put(item_map, "id", index) end)
  end

  def get_item_by_id(items, item_id) do
    items
    |> Enum.filter(fn item -> item["id"] == String.to_integer(item_id) end)
    |> List.first
  end
end
