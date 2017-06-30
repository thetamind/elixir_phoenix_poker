defmodule Poker.Web.SessionController do
  use Poker.Web, :controller

  alias Poker.Player

  def new(conn, _params) do
    players = Player.list_players()
    render conn, "new.html", players: players
  end

  def create(conn, %{"name" => name}) do
    player = Player.get_by(name: name)
    if player do
      conn = put_session(conn, :current_user, player.name)
      conn = put_flash(conn, :info, "Sign in successful.")
      redirect(conn, to: player_path(conn, :index))
    else
      conn = Plug.Conn.delete_session(conn, :current_user)
      conn = put_flash(conn, :error, "Sign in failed.")
      redirect(conn, to: session_path(conn, :new))
    end
  end

  def delete(conn, _params) do
    conn = Plug.Conn.delete_session(conn, :current_user)
    redirect(conn, to: player_path(conn, :index))
  end
end
