defmodule Poker.Web.DeckViewTest do
  use Poker.Web.ConnCase, async: true

  # For safe_to_string/0
  import Phoenix.HTML
  import Poker.Web.DeckView

  describe "card_html/1" do
    test "output" do
      values = [
        [5, :spades, "<span>5&spades;</span>"],
        [6, :clubs, "<span>6&clubs;</span>"],
        [7, :hearts, "<span>7&hearts;</span>"],
        [12, :diamonds, "<span>Q&diams;</span>"],
      ]
      for [rank, suit, expected_html] <- values do
        assert card_html({rank, suit}) |> safe_to_string() == expected_html
      end
    end
  end
end
