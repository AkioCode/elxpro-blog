defmodule ElxproBlog.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :image, :string
      add :provider, :string
      add :email, :string, null: false
      add :token, :string

      timestamps()
    end

    create unique_index(:users, :email)
  end
end
