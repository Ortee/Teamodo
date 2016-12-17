use Mix.Config

config :maru, Server.API,
   http: [port: 3030]

config :simple, Simple.Repo,
   adapter: Mongo.Ecto,
   database: "mydb",
   hostname: "localhost"
