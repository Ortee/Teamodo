defmodule Teamodo.API do
  use Maru.Router

  plug Plug.Parsers,
    pass: ["*/*"],
    json_decoder: Poison,
    parsers: [:urlencoded, :json, :multipart]

  mount Teamodo.Router.Users
  mount Teamodo.Router.Auth
  mount Teamodo.Router.Timers

  rescue_from :all do
    conn
    |> put_status(500)
    |> text("Teamodo Error")
  end
end
