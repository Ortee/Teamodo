defmodule Teamodo.Router.Teams do
  use Maru.Router

  post "/api/team" do
    IO.puts "POST /api/team"
    json(conn, Teamodo.Database.addTeam())
    conn
    |> put_status(200)
    |> put_resp_content_type("application/json")
    |> text("success")
  end

end
