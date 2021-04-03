defmodule SpotlightWeb.SpotlightLive do
  use SpotlightWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    render(SpotlightWeb.SpotlightView, "index.html", assigns)
  end
end
