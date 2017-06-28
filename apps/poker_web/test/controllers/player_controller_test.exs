defmodule Poker.Web.PlayerControllerTest do
  use Poker.Web.ConnCase

  test "GET /players", %{conn: conn} do
    conn = get conn, "/players"
    assert html_response(conn, 200) =~ "Players"
  end
end
