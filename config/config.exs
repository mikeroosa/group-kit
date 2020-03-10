# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :group_kit,
  ecto_repos: [GroupKit.Repo]

# Configures the endpoint
config :group_kit, GroupKitWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+stMskLLvPkEQtJ6n+myPVs09QjlY9exguh550q8sV8xSYsmtaLX2EDzXB0tYaIl",
  render_errors: [view: GroupKitWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GroupKit.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "571Rz5FL"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
