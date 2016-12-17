defmodule Teamodo.Router.Users do
  use Maru.Router

  get "/api/users" do
    IO.puts "GET /api/users"
    json(conn, Teamodo.Database.getUsers())
    conn
    |> put_status(200)
    |> put_resp_content_type("application/json")
    |> text("success")
  end

  params do
    requires :login, type: String
  end

  get "/api/users/:login" do
    IO.puts "GET /api/users/:login"
    json(conn, Teamodo.Database.getUser(params.login))
    conn
    |> put_status(200)
    |> put_resp_content_type("application/json")
    |> text("success")
  end

  params do
    requires :login, type: String
    requires :username, type: String
    requires :password, type: String
  end

  post "/api/users" do
    IO.puts "POST /api/users"
    Teamodo.Database.createUser(params)
    conn
    |> put_status(201)
    |> text("success")
  end
end
