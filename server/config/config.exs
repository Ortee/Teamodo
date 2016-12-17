use Mix.Config

config :maru, Teamodo.API,
    versioning: [
      using: :param,
      parameter: "v",
    ],
   http: [port: 3000]

config :teamodo, Teamodo.Database.Repo,
   adapter: Mongo.Ecto,
   database: "mydb",
   hostname: "localhost"
