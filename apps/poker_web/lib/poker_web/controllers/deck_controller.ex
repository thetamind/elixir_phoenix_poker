defmodule Poker.Web.DeckController do
  use Poker.Web, :controller

  @spec index(Plug.Conn.t, Plug.Conn.params) :: Plug.Conn.t
  def index(conn, _params) do
    deck = Poker.Deck.new()
    render(conn, "index.html", deck: deck)
  end

  @spec show(Plug.Conn.t, Plug.Conn.params) :: Plug.Conn.t
  def show(conn, %{"seed" => seed}) do
    numbers = seed
    |> String.split("-")
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple()

    deck = Poker.Deck.new_with_seed(numbers)
    render(conn, "show.html", deck: deck, seed: numbers)
  end
end
