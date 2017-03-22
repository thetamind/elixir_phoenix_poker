defmodule Poker.Web.DeckView do
  use Poker.Web, :view

  @spec card_html(Poker.Deck.card) :: Phoenix.HTML.Safe.t
  def card_html(card)
  def card_html({rank, suit}) do
    entity = suit_to_entity(suit)
    content_tag :span, [to_string(rank), entity]
  end

  @spec suit_to_entity(Poker.Deck.suit) :: Phoenix.HTML.Safe.t
  def suit_to_entity(suit)
  def suit_to_entity(:spades), do: raw "&spades;"
  def suit_to_entity(:clubs), do: raw "&clubs;"
  def suit_to_entity(:hearts), do: raw "&hearts;"
  def suit_to_entity(:diamonds), do: raw "&diams;"
end
