defmodule ElxproBlogWeb.PostController do
  use ElxproBlogWeb, :controller

  def index(conn, _params) do
    posts = [
      %{titulo: "Phoenix"},
      %{titulo: "Liveview"},
      %{titulo: "Postgres"}
    ]

    render(conn, posts: posts)
  end
end
