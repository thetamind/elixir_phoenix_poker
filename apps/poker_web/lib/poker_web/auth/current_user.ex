defmodule Poker.Web.Auth.CurrentUser do

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts \\ []) do
    case get_session(conn, :current_user) do
      id when is_number(id) ->
        current_user = Poker.Player.get(id)
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
