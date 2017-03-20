defmodule Poker.Web.DeckController do
  use Poker.Web, :controller

  def index(conn, _params) do
    deck = Poker.Deck.new()
    resp(conn, 200, inspect(deck))
  end
end
