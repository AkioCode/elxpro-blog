defmodule ElxproBlogWeb.PostController do
  use ElxproBlogWeb, :controller

  def index(conn, _params) do
    render(conn)
  end
end
