defmodule Poker.Web.Router do
  use Poker.Web, :router

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

  scope "/", Poker.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/decks", DeckController, :index
    get "/decks/shuffle", DeckController, :shuffle
    get "/decks/:seed", DeckController, :show

    get "/players", PlayerController, :index
    get "/players/:name", PlayerController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", Poker.Web do
  #   pipe_through :api
  # end
end
