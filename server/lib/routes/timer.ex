defmodule Teamodo.Router.Timers do
  use Maru.Router

  params do
    requires :user_id, type: String
    requires :team_id, type: String
    requires :time, type: Integer
  end

  # Add timer
  post "/api/timers" do
    IO.puts "POST /api/timers"
    Teamodo.Database.addTimer(params)
    conn
    |> put_status(201)
    |> put_resp_content_type("application/json")
    |> text("success")
  end

  # Get all timers
  get "/api/timers" do
    IO.puts "GET /api/timers"
    json(conn, Teamodo.Database.getTimers())
    conn
    |> put_status(200)
    |> put_resp_content_type("application/json")
    |> text("success")
  end

  params do
    requires :user_id, type: String
  end

  # Get timers by user_id
  get "/api/timers/users/:user_id" do
    IO.puts "GET /api/timers/users/:user_id"
    json(conn, Teamodo.Database.getTimersByUser_id(params.user_id))
    conn
    |> put_status(200)
    |> put_resp_content_type("application/json")
    |> text("success")
  end

  params do
    requires :team_id, type: String
  end

  # Get timers by team_id
  get "/api/timers/team/:team_id" do
    IO.puts "GET /api/timers/team/:team_id"
    json(conn, Teamodo.Database.getTimersByTeam_id(params.team_id))
    conn
    |> put_status(200)
    |> put_resp_content_type("application/json")
    |> text("success")
  end

end
