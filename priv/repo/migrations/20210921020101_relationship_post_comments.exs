defmodule ElxproBlog.Repo.Migrations.RelationshipPostComments do
  use Ecto.Migration

  def change do
    alter table(:comments) do
      add :post_id, references(:posts, on_delete: :delete_all, on_update: :update_all)
    end
  end
end
