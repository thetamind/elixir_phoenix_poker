use Mix.Config

# Configure your database
config :poker, Poker.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "poker_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
