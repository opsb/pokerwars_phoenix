# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pokerwars_phoenix,
  ecto_repos: [PokerwarsPhoenix.Repo]

# Configures the endpoint
config :pokerwars_phoenix, PokerwarsPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hw+CiaysCy9ZpX2IYxWVg+sfgKgWhpZiiFnPjO6FTQxMOkTg5XYZ8E6I6e+LMLa+",
  render_errors: [view: PokerwarsPhoenixWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PokerwarsPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
