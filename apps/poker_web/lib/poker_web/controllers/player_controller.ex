defmodule Poker.Web.PlayerController do
  use Poker.Web, :controller

  alias Poker.Player

  def index(conn, _params) do
    players = Player.list_players()
    render conn, "index.html", players: players
  end

  def show(conn, %{"name" => name}) do
    player = Player.get_by(name: name)
    render conn, "show.html", player: player
  end
end
