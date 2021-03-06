defmodule Skeleton4.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Skeleton4 do
    pipe_through :browser # Use the default browser stack

    get "/",      PageController, :index
    get "/hello", PageController, :hello
    
    resources "/userroles", UserroleController

  end

  scope "/auth", Skeleton4 do
    pipe_through :browser
    get  "/",       AuthController, :index
    post "/login",  AuthController, :login
    post "/logout", AuthController, :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", Skeleton4 do
  #   pipe_through :api
  # end
end
