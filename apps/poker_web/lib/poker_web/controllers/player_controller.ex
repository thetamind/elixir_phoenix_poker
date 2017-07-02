defmodule Poker.Web.PlayerController do
  use Poker.Web, :controller

  alias Poker.Player

  def index(conn, _params) do
    players = Player.list_players()
    render conn, "index.html", players: players
  end

  def show(conn, %{"id" => id}) do
    id = String.to_integer(id)
    case Player.get(id) do
      nil -> conn |> put_status(404) |> render(Poker.Web.ErrorView, "404.html", [])
      player -> render conn, "show.html", player: player
    end
  end
end
