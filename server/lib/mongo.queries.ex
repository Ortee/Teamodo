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

  def createUser(params) do
    Teamodo.Database.Repo.insert!(%User{login: params.login, password: params.password, username: params.username})
  end

  def addTimer(params) do
    Teamodo.Database.Repo.insert!(%Timer{user_id: params.user_id, team_id: params.team_id, time: params.time})
  end

  def getTimers() do
    query = from timer in Timer,
      select: %{id: timer.id, user_id: timer.user_id, team_id: timer.team_id, time: timer.time}
    Teamodo.Database.Repo.all(query)
  end

  def getTimersByUser_id(user_id) do
    query = from timer in Timer,
      where: timer.user_id == ^user_id,
      select: %{id: timer.id, team_id: timer.team_id, time: timer.time}
    Teamodo.Database.Repo.all(query)
  end

  def getTimersByTeam_id(team_id) do
    query = from timer in Timer,
      where: timer.team_id == ^team_id,
      select: %{id: timer.id, user_id: timer.user_id, time: timer.time}
    Teamodo.Database.Repo.all(query)
  end
end
