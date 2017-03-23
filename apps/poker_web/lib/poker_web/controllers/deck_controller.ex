defmodule Poker.Web.DeckController do
  use Poker.Web, :controller

  @spec index(Plug.Conn.t, Plug.Conn.params) :: Plug.Conn.t
  def index(conn, _params) do
    deck = Poker.Deck.new()
    render(conn, "index.html", deck: deck)
  end

  @spec show(Plug.Conn.t, Plug.Conn.params) :: Plug.Conn.t
  def show(conn, %{"seed" => seed}) do
    deck = Poker.Deck.new_with_seed(seed)
    render(conn, "index.html", deck: deck)
  end
end
