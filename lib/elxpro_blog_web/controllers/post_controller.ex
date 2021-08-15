defmodule ElxproBlogWeb.PostController do
  use ElxproBlogWeb, :controller

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
    PostRepo.insert!(params)
    render(conn)
  end
end
