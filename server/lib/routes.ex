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
end

defmodule Teamodo.Insert do
  def insertUser do
    user = %User{login: "login123", username: "test123", password: "password123"}
    Teamodo.Database.Repo.insert!(user)
  end
end
