defmodule ElxproBlogWeb.AuthController do
  use ElxproBlogWeb, :controller
  plug Ueberauth

  def request(conn, _params) do
    render(conn, "index.html")
  end

  def callback(conn, _params) do
    render(conn, "index.html")
  end
end
