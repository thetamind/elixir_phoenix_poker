defmodule Poker.DeckTest do
  use ExUnit.Case, async: true

  alias Poker.Deck

  describe "Deck.new/0" do
    test "deck has 52 cards" do
      assert Enum.count(Deck.new()) == 52
    end

    test "is without duplicates" do
      assert Enum.count(Enum.uniq(Deck.new())) == 52
    end

    test "has 13 cards of each suite" do
      counts = Deck.new()
      |> Enum.reduce %{}, fn({_rank, suit}, acc) ->
        Map.update(acc, suit, 1, &(&1 + 1))
      end
      assert counts == %{spades: 13, clubs: 13, hearts: 13, diamonds: 13}
    end
  end
end
