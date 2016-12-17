defmodule Teamodo.Database.App do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    tree = [worker(Teamodo.Database.Repo, [])]

    opts = [name: Teamodo.Database.Sup, strategy: :one_for_one]
    Supervisor.start_link(tree, opts)
  end
end

defmodule Teamodo.Database.Repo do
  use Ecto.Repo, otp_app: :teamodo
end
