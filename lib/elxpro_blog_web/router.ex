defmodule ElxproBlogWeb.Router do
  use ElxproBlogWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElxproBlogWeb do
    pipe_through [:browser]

    post "/posts", PostController, :create
    get "/posts/new", PostController, :new
    get "/posts", PostController, :index
    get "/posts/:id", PostController, :show
    get "/", PageController, :index
  end
end
