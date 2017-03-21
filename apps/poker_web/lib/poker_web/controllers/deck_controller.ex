defmodule Poker.Web.DeckController do
  use Poker.Web, :controller

  @spec index(Plug.Conn.t, Plug.Conn.params) :: Plug.Conn.t
  def index(conn, _params) do
    deck = Poker.Deck.new()
    conn
    |> put_resp_content_type("text/html")
    |> resp(200, inspect(deck))
  end
end
