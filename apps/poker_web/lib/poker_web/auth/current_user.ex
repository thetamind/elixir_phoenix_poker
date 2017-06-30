defmodule Poker.Web.Auth.CurrentUser do

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts \\ []) do
    case get_session(conn, :current_user) do
      name when is_binary(name) ->
        current_user = Poker.Player.get_by(name: name)
        if current_user do
          assign(conn, :current_user, current_user)
        else
          conn
        end
      _ ->
        conn
    end
  end
end
