defmodule Poker.Web.SessionControllerTest do
  use Poker.Web.ConnCase

  test "GET /sessions/new", %{conn: conn} do
    conn = get conn, "/sessions/new"
    assert html_response(conn, 200) =~ "Sign in"
  end

  describe "POST /sessions" do
    test "successful", %{conn: conn} do
      conn = post conn, "/sessions", id: "1"
      assert get_session(conn, :current_user) == 1
      location = redirected_to(conn)
      assert location =~ player_path(conn, :index)
      conn = get conn, location
      html = html_response(conn, 200)
      assert html =~ "(<b>Alice</b>)"
      assert html =~ "Sign out"
    end

    test "auth fails", %{conn: conn} do
      conn = post conn, "/sessions", id: "-1"
      assert get_session(conn, :current_user) == nil
      location = redirected_to(conn)
      assert location =~ session_path(conn, :new)
      conn = get conn, location
      html = html_response(conn, 200)
      assert html =~ "Sign in"
      refute html =~ "Signed in"
    end
  end
end
