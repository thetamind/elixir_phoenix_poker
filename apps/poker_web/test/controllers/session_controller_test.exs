defmodule Poker.Web.SessionControllerTest do
  use Poker.Web.ConnCase

  test "GET /sessions/new", %{conn: conn} do
    conn = get conn, "/sessions/new"
    assert html_response(conn, 200) =~ "Sign in"
  end

  describe "POST /sessions" do
    test "successful", %{conn: conn} do
      conn = post conn, "/sessions", name: "Alice"
      assert get_session(conn, :current_player) == "Alice"
      assert redirected_to(conn) =~ player_path(conn, :index)
    end

    test "auth fails", %{conn: conn} do
      conn = post conn, "/sessions", name: "NOT A PLAYER"
      assert get_session(conn, :current_player) == nil
      assert redirected_to(conn) =~ session_path(conn, :new)
    end
  end
end
