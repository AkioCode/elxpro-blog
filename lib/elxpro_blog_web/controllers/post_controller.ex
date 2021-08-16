defmodule ElxproBlogWeb.PostController do
  use ElxproBlogWeb, :controller

  alias ElxproBlog.Posts.Core.PostRepo
  alias ElxproBlog.Posts.Data.Post

  def index(conn, _params) do
    posts = PostRepo.all()
    render(conn, posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = PostRepo.get!(id)
    render(conn, post: post)
  end

  def new(conn, _params) do
    changeset = Post.changeset(%Post{})
    render(conn, changeset: changeset)
  end

  def edit(conn, params) do
    post = PostRepo.get!(params["id"])
    changeset = Post.changeset(post)
    render(conn, "edit.html", post: post, changeset: changeset)
  end



  def create(conn, %{"post" => post}) do
    PostRepo.insert(post)
    |> case do
      {:ok, inserted_post} ->
        conn
        |> put_flash(:info, "Post criado com sucesso")
        |> redirect(to: Routes.post_path(conn, :show, inserted_post))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def update(conn, params) do
    PostRepo.update(params)
    |> case do
      {:ok, updated_post} ->
        conn
        |> put_flash(:info, "Post atualizado")
        |> redirect(to: Routes.post_path(conn, :show, updated_post))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    PostRepo.delete(id)
    |> case do
      {:ok, _post} ->
        conn
        |> put_flash(:info, "Post excluído")
        |> redirect(to: Routes.post_path(conn, :index))

      {:error, _changeset} ->
        render(conn, "index.html")
    end
  end
end
