defmodule User do
  use Ecto.Model

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "user" do
    field :login, :string
    field :username, :string
    field :password, :string
    timestamps
  end
end
