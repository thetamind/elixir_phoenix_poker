defmodule Poker.Web.DeckControllerTest do
  use Poker.Web.ConnCase

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, deck_path(conn, :index)
    assert html_response(conn, 200) =~ "<span>9&clubs;</span>"
  end

  test "list cards shuffled by seed", %{conn: conn} do
    conn = get conn, deck_path(conn, :show, "1-2-3")
    assert html_response(conn, 200) =~ "<span>J&hearts;</span></li>\n<li class=\"card\">\n<span>10&spades;</span></li>\n"
  end

  # alias Poker.Web.Poker

  # @create_attrs %{fee: 42, name: "some name"}
  # @update_attrs %{fee: 43, name: "some updated name"}
  # @invalid_attrs %{fee: nil, name: nil}

  # def fixture(:table) do
  #   {:ok, table} = Web.Poker.create_table(@create_attrs)
  #   table
  # end
  #
  # test "lists all entries on index", %{conn: conn} do
  #   conn = get conn, table_path(conn, :index)
  #   assert html_response(conn, 200) =~ "Listing Tables"
  # end
  #
  # test "renders form for new tables", %{conn: conn} do
  #   conn = get conn, table_path(conn, :new)
  #   assert html_response(conn, 200) =~ "New Table"
  # end
  #
  # test "creates table and redirects to show when data is valid", %{conn: conn} do
  #   conn = post conn, table_path(conn, :create), table: @create_attrs
  #
  #   assert %{id: id} = redirected_params(conn)
  #   assert redirected_to(conn) == table_path(conn, :show, id)
  #
  #   conn = get conn, table_path(conn, :show, id)
  #   assert html_response(conn, 200) =~ "Show Table"
  # end
  #
  # test "does not create table and renders errors when data is invalid", %{conn: conn} do
  #   conn = post conn, table_path(conn, :create), table: @invalid_attrs
  #   assert html_response(conn, 200) =~ "New Table"
  # end
  #
  # test "renders form for editing chosen table", %{conn: conn} do
  #   table = fixture(:table)
  #   conn = get conn, table_path(conn, :edit, table)
  #   assert html_response(conn, 200) =~ "Edit Table"
  # end
  #
  # test "updates chosen table and redirects when data is valid", %{conn: conn} do
  #   table = fixture(:table)
  #   conn = put conn, table_path(conn, :update, table), table: @update_attrs
  #   assert redirected_to(conn) == table_path(conn, :show, table)
  #
  #   conn = get conn, table_path(conn, :show, table)
  #   assert html_response(conn, 200) =~ "some updated name"
  # end
  #
  # test "does not update chosen table and renders errors when data is invalid", %{conn: conn} do
  #   table = fixture(:table)
  #   conn = put conn, table_path(conn, :update, table), table: @invalid_attrs
  #   assert html_response(conn, 200) =~ "Edit Table"
  # end
  #
  # test "deletes chosen table", %{conn: conn} do
  #   table = fixture(:table)
  #   conn = delete conn, table_path(conn, :delete, table)
  #   assert redirected_to(conn) == table_path(conn, :index)
  #   assert_error_sent 404, fn ->
  #     get conn, table_path(conn, :show, table)
  #   end
  # end
end
