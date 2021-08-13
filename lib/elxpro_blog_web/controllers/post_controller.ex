defmodule ElxproBlogWeb.PostController do
  use ElxproBlogWeb, :controller

  def index(conn, _params) do
    posts = [
      %{id: 1, titulo: "Phoenix"},
      %{id: 2, titulo: "Liveview"},
      %{id: 3, titulo: "Postgres"}
    ]

    render(conn, posts: posts)
  end

  def show(conn, _params) do
    render(conn)
  end
end
