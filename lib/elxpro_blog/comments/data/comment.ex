defmodule ElxproBlog.Comments.Data.Comment do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :content, :string

    belongs_to :post, ElxproBlog.Posts.Data.Post
    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
