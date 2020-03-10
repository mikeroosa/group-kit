defmodule GroupKitWeb.Router do
  use GroupKitWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers

    plug GroupKitWeb.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GroupKitWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/members", MemberController
  end

  # Other scopes may use custom stacks.
  # scope "/api", GroupKitWeb do
  #   pipe_through :api
  # end
end
