# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :spotlight, SpotlightWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EN83JrwsWXb5Zlc39uVPLJ4dL5hUYGHouOOL88nLf9TgXD4q/BjidUWzcWNeTqOR",
  render_errors: [view: SpotlightWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Spotlight.PubSub,
  live_view: [signing_salt: "WjWM3CmQ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
