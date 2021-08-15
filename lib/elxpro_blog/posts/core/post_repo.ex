defmodule ElxproBlog.Posts.Core.PostRepo do
  @moduledoc false

  alias ElxproBlog.Posts.Data.Post
  alias ElxproBlog.Repo

  @spec all :: [Post]
  def all do
    Repo.all(Post)
  end

  @spec get!(integer) :: Post
  def get!(id) do
    Repo.get!(Post, id)
  end

  @spec insert!(map) :: Post
  def insert!(params) do
    Post.changeset(params)
    |> Repo.insert!()
  end
end
