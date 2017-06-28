defmodule Poker.PlayerTest do
  use ExUnit.Case, async: true

  alias Poker.Player

  describe "list_players/0" do
    test "returns list of players" do
      all = Player.list_players()
      assert !Enum.empty?(all)

      %Player{name: name} = List.first(all)
      assert name != ""
    end
  end

  describe "get_by/1" do
    test "returns single player by attribute" do
      player = Player.get_by(name: "Bob")
      assert Map.get(player, :name) == "Bob"
    end
  end
end
