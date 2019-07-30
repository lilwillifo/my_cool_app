defmodule MyCoolApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :avatar_url, :string

    timestamps()
  end

  @required_fields ~w(name)a
  @optional_fields ~w(email avatar_url)a
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
