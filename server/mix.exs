defmodule Server.Mixfile do
  use Mix.Project

  def project do
    [app: :simple,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [mod: {Simple.App, []},
       applications: [:mongodb_ecto, :ecto]]
  end

  defp deps do
    [
      {:mongodb, "~> 0.1.0"},
      {:ecto, "~> 1.0.0"},
      {:maru, "~> 0.11"},
      {:exsync, "~> 0.1.3"},
      {:mongodb_ecto, "~> 0.1.5"}
    ]
  end
end
