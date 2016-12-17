defmodule Teamodo.Router.Auth do
  use Maru.Router

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
