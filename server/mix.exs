defmodule Server.Mixfile do
  use Mix.Project

  def project do
    [app: :server,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :maru, :exsync, :ecto]]
  end

  defp deps do
    [
      {:maru, "~> 0.11"},
      {:exsync, "~> 0.1.3"},
      {:ecto, "~> 2.1.0-rc.5"}
    ]
  end
end
