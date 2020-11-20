# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :wwwsand, WwwsandWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NyoNvVTCJ2S3uAvmLYH8AB3exuavUS2kG0CdyDR0DOIploNeP0A6iul6Pnz1tEvY",
  render_errors: [view: WwwsandWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Wwwsand.PubSub,
  live_view: [signing_salt: "XmDoAfGj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
