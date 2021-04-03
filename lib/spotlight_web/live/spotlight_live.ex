defmodule SpotlightWeb.SpotlightLive do
  use SpotlightWeb, :live_view

  @results %{
    "A" => [
      "Amazon",
      "American"
    ],
  }

  def mount(_params, _session, socket) do
    {:ok, assign(socket, results: @results)}
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

  def handle_event("next_result", params, socket) do
    {:noreply, socket}
  end
end
