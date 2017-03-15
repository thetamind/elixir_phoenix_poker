defmodule Poker.DeckTest do
  use ExUnit.Case, async: true

  alias Poker.Deck

  describe "Deck.new/0" do
    setup do: [deck: Deck.new()]

    test "deck has 52 cards", %{deck: deck} do
      assert Enum.count(deck) == 52
    end

    test "is without duplicates", %{deck: deck} do
      assert Enum.count(Enum.uniq(deck)) == 52
    end

    test "has 13 cards of each suite", %{deck: deck} do
      counts = deck
      |> Enum.reduce(%{}, fn({_rank, suit}, acc) ->
        Map.update(acc, suit, 1, &(&1 + 1))
      end)
      assert counts == %{spades: 13, clubs: 13, hearts: 13, diamonds: 13}
    end
  end
end
