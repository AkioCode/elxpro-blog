# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elxpro_blog,
  ecto_repos: [ElxproBlog.Repo]

# Configures the endpoint
config :elxpro_blog, ElxproBlogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1dZ/JhVgfQsXF0kU/mbwnf16ZKzf4bHlhr/5Sv5i9M3QSJ7NX+OUtTgSAKq+95F4",
  render_errors: [view: ElxproBlogWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElxproBlog.PubSub,
  live_view: [signing_salt: "+5w+3Xb/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, []}
  ]

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
