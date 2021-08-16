defmodule ElxproBlogWeb.PostController do
  use ElxproBlogWeb, :controller

  alias ElxproBlog.Posts.Data.Post
  alias ElxproBlog.Posts.Core.PostRepo

  def index(conn, _params) do
    posts = PostRepo.all()
    render(conn, posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = PostRepo.get!(id)
    render(conn, post: post)
  end

  def new(conn, params) do
    changeset = Post.changeset(params)
    render(conn, changeset: changeset)
  end

  def create(conn, params) do
    post = PostRepo.insert!(params["post"])
    render(conn, "show.html", post: post)
  end
end
