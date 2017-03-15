use Mix.Config

# Configure your database
config :poker, Poker.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "poker_dev",
  hostname: "localhost",
  pool_size: 10
