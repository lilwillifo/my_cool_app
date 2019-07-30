defmodule MyCoolApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :email, :string
      add :avatar_url, :string

      timestamps()
    end

  end
end
