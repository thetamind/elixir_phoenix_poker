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
end
