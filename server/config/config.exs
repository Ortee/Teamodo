use Mix.Config

config :maru, Teamodo.API,
    versioning: [
      using: :param,
      parameter: "v",
    ],
   http: [port: 3000]

 config :temodo, Teamodo.Database.Repo,
   adapter: Ecto.Adapters.Postgres,
   database: "db",
   username: "postgres",
   password: "postgres",
   hostname: "localhost",
