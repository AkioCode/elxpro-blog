defmodule ElxproBlog.Posts.Data.Post do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:title, :description]
  @required_fields [:title]

  schema "posts" do
    field :title, :string
    field :description, :string
    timestamps()
  end

  def changeset(post, attrs \\ %{}) do
    post
    |> cast(attrs, @fields)
    |> validate_required(@required_fields, message: "Obrigatório")
  end
end
