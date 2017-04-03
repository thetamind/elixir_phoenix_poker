defmodule Poker.Web.DeckController do
  use Poker.Web, :controller

  @spec index(Plug.Conn.t, Plug.Conn.params) :: Plug.Conn.t
  def index(conn, _params) do
    render(conn, "index.html")
  end

  @spec shuffle(Plug.Conn.t, Plug.Conn.params) :: Plug.Conn.t
  def shuffle(conn, _params) do
    redirect(conn, to: deck_path(conn, :show, "123456789012"))
  end

  @spec show(Plug.Conn.t, Plug.Conn.params) :: Plug.Conn.t
  def show(conn, %{"seed" => seed}) do
    <<i1::32, i2::32, i3::32>> = seed

    deck = Poker.Deck.new_with_seed({i1, i2, i3})
    render(conn, "show.html", deck: deck, seed: seed)
  end
end
