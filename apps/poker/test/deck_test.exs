defmodule Poker.DeckTest do
  use ExUnit.Case, async: true

  alias Poker.Deck

  describe "Deck.new/0" do
    setup do: [deck: Deck.new()]

    test "deck has 52 cards", %{deck: deck} do
      assert Enum.count(deck) == 52
    end

    test "is without duplicates", %{deck: deck} do
      assert deck |> Enum.uniq() |> Enum.count() == 52
    end

    test "has 13 cards of each suit", %{deck: deck} do
      counts = Enum.reduce(deck, %{}, fn({_rank, suit}, acc) ->
        Map.update(acc, suit, 1, &(&1 + 1))
      end)
      assert counts == %{spades: 13, clubs: 13, hearts: 13, diamonds: 13}
    end

    test "has 4 cards of each value", %{deck: deck} do
      counts = Enum.reduce(deck, %{}, fn({rank, _suit}, acc) ->
        Map.update(acc, rank, 1, &(&1 + 1))
      end)
      assert counts == Enum.to_list(2..14) |> Map.new(&({&1, 4}))
    end
  end

  describe "Deck.new_with_seed/1" do
    test "deck shuffle with seed" do
      deck = Deck.new_with_seed({1, 2, 3})
      assert Enum.count(deck) == 52
      assert Enum.take(deck, 3) == [{6, :clubs}, {5, :clubs}, {11, :hearts}]
    end
  end

  describe "rank_to_letter/1" do
    test "output" do
      values = [
        [2, "2"],
        [9, "9"],
        [10, "10"],
        [11, "J"],
        [12, "Q"],
        [13, "K"],
        [14, "A"],
      ]
      for [rank, expected] <- values do
        assert Deck.rank_to_letter(rank) == expected
      end
    end
  end

  describe "suit_to_letter/1" do
    test "output" do
      values = [
        [:clubs, "c"],
        [:diamonds, "d"],
        [:hearts, "h"],
        [:spades, "s"],
      ]
      for [suit, expected] <- values do
        assert Deck.suit_to_letter(suit) == expected
      end
    end
  end
end
