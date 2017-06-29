defmodule Poker.Web.PlayerControllerTest do
  use Poker.Web.ConnCase

  test "GET /players", %{conn: conn} do
    conn = get conn, "/players"
    assert html_response(conn, 200) =~ "Players"
  end

  describe "POST /auth/become" do
    test "successful", %{conn: conn} do
      conn = post conn, "/auth/become", name: "Alice"
      assert get_session(conn, :current_player) == "Alice"
    end

    test "auth fails", %{conn: conn} do
      conn = post conn, "/auth/become", name: "NOT A PLAYER"
      assert get_session(conn, :current_player) == nil
    end
  end
end
