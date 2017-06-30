defmodule Poker.Web.Auth.CurrentUserTest do

  use ExUnit.Case, async: true
  use Plug.Test

  alias Poker.Web.Auth.CurrentUser
  alias Poker.Player

  @default_opts [
    store: :cookie,
    key: "signing key",
    encryption_salt: "encrypted cookie salt",
    signing_salt: "signing salt"
  ]

  @secret String.duplicate("abcdef0123456789", 8)
  @signing_opts Plug.Session.init(Keyword.put(@default_opts, :encrypt, false))

  def conn_with_fetched_session(conn) do
    conn.secret_key_base
    |> put_in(@secret)
    |> Plug.Session.call(@signing_opts)
    |> Plug.Conn.fetch_session
  end

  setup do
    conn = conn(:get, "/")
    |> conn_with_fetched_session()
    {:ok, %{conn: conn}}
  end

  describe "without session" do
    test "assigns is nil", %{conn: conn} do
      conn = conn
      |> delete_session(:current_user)
      |> CurrentUser.call()

      assert conn.assigns[:current_user] == nil
    end

    test "assigns is has valid user", %{conn: conn} do
      player = Player.list_players() |> List.first()
      conn = conn
      |> put_session(:current_user, player.name)
      |> CurrentUser.call()

      assert conn.assigns[:current_user] == player
    end

    test "assigns is has invalid user", %{conn: conn} do
      player = Player.list_players() |> List.first() |> Map.put(:name, "NOT FOUND")
      conn = conn
      |> put_session(:current_user, player.name)
      |> CurrentUser.call()

      assert conn.assigns[:current_user] == nil
    end
  end
end
