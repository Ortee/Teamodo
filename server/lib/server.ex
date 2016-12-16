defmodule Server.Router.Homepage do
  use Maru.Router

  get "/api" do
    mock = [
      %{name: "Franek"},
      %{name: "Marian"},
      %{name: "Gienek"}
    ]
    IO.puts "GET /"
    json(conn, mock)
  end
end

defmodule Server.Router.Test do
  use Maru.Router

  get "/test" do
    mock = [
      %{name: "test"},
      %{name: "test"},
      %{name: "test"}
    ]
    IO.puts "GET /test"
    json(conn, mock)
  end
end

defmodule Server.API do
  use Maru.Router

  plug Plug.Parsers,
    pass: ["*/*"],
    json_decoder: Poison,
    parsers: [:urlencoded, :json, :multipart]

  mount Server.Router.Homepage
  mount Server.Router.Test

  rescue_from :all do
    conn
    |> put_status(500)
    |> text("Server Error")
  end
end
