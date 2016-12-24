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
   username: "user",
   password: "password",
   hostname: "localhost",
   port: "12345"

   config :temodo, ecto_repos: [Teamodo.Database.Repo]
