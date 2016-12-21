def start(_type, _args) do
  import Supervisor.Spec

  children = [
    supervisor(Repo, [])
  ]

  opts = [strategy: :one_for_one, name: Teamodo.Supervisor]
  Supervisor.start_link(children, opts)
end
