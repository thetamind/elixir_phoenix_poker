defmodule Poker.Web.PlayerControllerTest do
  use Poker.Web.ConnCase

  test "GET /players", %{conn: conn} do
    conn = get conn, "/players"
    assert html_response(conn, 200) =~ "Players"
  end

  test "GET /player/:id", %{conn: conn} do
    conn = get conn, "/players/2"
    assert html_response(conn, 200) =~ "<h2>Bob</h2>"
  end

  test "GET /player/:id not found", %{conn: conn} do
    conn = get conn, "/players/100"
    assert html_response(conn, 404) =~ "Page not found"
  end
end
