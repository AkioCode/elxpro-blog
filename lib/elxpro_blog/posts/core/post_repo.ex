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

  @spec insert(map) :: {:ok, Post} | {:error, any}
  def insert(params) do
    Post.changeset(%Post{}, params)
    |> Repo.insert()
  end

  @spec delete(integer) :: {:ok, Post} | {:error, any}
  def delete(id) do
    get!(id)
    |> Repo.delete()
  end

  @spec update(map) :: {:ok, Post} | {:error, any}
  def update(to_update) do
    get!(to_update["id"])
    |> Post.changeset(to_update["post"])
    |> Repo.update()
  end
end
