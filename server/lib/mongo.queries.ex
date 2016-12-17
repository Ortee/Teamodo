defmodule Teamodo.Database do
  import Ecto.Query

  def getUsers do
    query = from user in User,
      select: %{id: user.id, username: user.username, login: user.login, password: user.password}
    Teamodo.Database.Repo.all(query)
  end

  def getUser(login) do
    query = from user in User,
      select: %{id: user.id, username: user.username, password: user.password}
    Teamodo.Database.Repo.get_by(query, login: login)
  end

end
