# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :multi_chat,
  ecto_repos: [MultiChat.Repo]

# Configures the endpoint
config :multi_chat, MultiChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "b5c9w61mWB32QiYOLDdxOX5IDJXRDi7OnWfX2W4QlzbaDYRjRFwsucbZ+Q9dJfOg",
  render_errors: [view: MultiChatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: MultiChat.PubSub,
  live_view: [signing_salt: "NizbS4HL"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
