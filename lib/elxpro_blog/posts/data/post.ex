defmodule ElxproBlog.Posts.Data.Post do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:title, :description]
  @required_fields [:title]

  schema "posts" do
    field :title, :string
    field :description, :string

    has_many :comments, ElxproBlog.Comments.Data.Comment
    timestamps()
  end

  def changeset(post, attrs \\ %{}) do
    post
    |> cast(attrs, @fields)
    |> validate_required(@required_fields, message: "Obrigatório")
  end
end
