# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :team_budget,
  ecto_repos: [TeamBudget.Repo],
  generators: [binary_id: true]

config :team_budget, TeamBudget.Accounts.Core.Guardian,
  issuer: "team_budget",
  secret_key: "TKkGrFUPiaXRC9Q/OLrCwXtMQTyf/mYuo96OL2kP+qUsLtjh/h0DuSNyYp2Mo7kc"

# Configures the endpoint
config :team_budget, TeamBudgetWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1MeRsMhGliGiuw2fRz8T+V+wkCzKfT2L37ZwhOk86d7tMCRNdqQHVmgBoO1sTTsp",
  render_errors: [view: TeamBudgetWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: TeamBudget.PubSub,
  live_view: [signing_salt: "/SGulZ6U"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
