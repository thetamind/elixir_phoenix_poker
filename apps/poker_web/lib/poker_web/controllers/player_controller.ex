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

  def become(conn, %{"name" => name}) do
    player = Player.get_by(name: name)
    if player do
      conn = put_session(conn, :current_player, player.name)
      conn = put_flash(conn, :info, "Sign in successful.")
      redirect(conn, to: player_path(conn, :index))
    else
      conn = Plug.Conn.delete_session(conn, :current_player)
      conn = put_flash(conn, :error, "Sign in failed.")
      redirect(conn, to: player_path(conn, :index))
    end
  end
end
