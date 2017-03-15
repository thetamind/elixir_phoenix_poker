use Mix.Config

config :poker, ecto_repos: [Poker.Repo]

import_config "#{Mix.env}.exs"
