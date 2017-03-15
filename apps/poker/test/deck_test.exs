defmodule Poker.DeckTest do
  use ExUnit.Case, async: true

  alias Poker.Deck

  describe "Deck.new/0" do
    test "deck has 52 cards" do
      assert Enum.count(Deck.new()) == 52
    end
  end
end
