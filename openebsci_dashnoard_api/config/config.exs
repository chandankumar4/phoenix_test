# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :openebsci_dashnoard_api,
  ecto_repos: [OpenebsciDashnoardApi.Repo]

# Configures the endpoint
config :openebsci_dashnoard_api, OpenebsciDashnoardApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CfUxovk58Du6Psn7VC2YtO1tx0KH7YqFLjUytq7UptX+kRgGnox14HxxhOtO0UVM",
  render_errors: [view: OpenebsciDashnoardApi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: OpenebsciDashnoardApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
