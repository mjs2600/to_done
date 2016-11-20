use Mix.Config

config :task_keeper, TaskKeeper.Repo,
  adapter:   Ecto.Adapters.Postgres,
  username:  "postgres",
  password:  "postgres",
  database:  "task_keeper_dev",
  hostname:  "localhost",
  pool_size: 10
