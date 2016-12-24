defmodule Teamodo.Mixfile do
  use Mix.Project

  def project do
    [app: :teamodo,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [mod: {Teamodo.Database.App, []},
       applications: [:ecto, :maru, :postgrex]]
  end

  defp deps do
    [
      {:ecto, "~> 2.1.1"},
      {:maru, "~> 0.11"},
      {:exsync, "~> 0.1.3"},
      {:postgrex, "~> 0.13.0"}
    ]
  end
end
