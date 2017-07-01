defmodule Poker.Web.Router do
  use Poker.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :with_session do
    plug Poker.Web.Auth.CurrentUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Poker.Web do
    pipe_through [:browser, :with_session]

    get "/", PageController, :index

    get "/decks", DeckController, :index
    get "/decks/shuffle", DeckController, :shuffle
    get "/decks/:seed", DeckController, :show

    get "/players", PlayerController, :index
    get "/players/:id", PlayerController, :show

    get "/sessions/new", SessionController, :new
    post "/sessions", SessionController, :create
    delete "/sessions", SessionController, :delete
  end
end
