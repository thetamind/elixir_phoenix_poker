defmodule Poker.Deck do
  @moduledoc """
  A standard 52 card deck.
  """

  @ranks Enum.to_list(2..14)
  @suits [:spades, :clubs, :hearts, :diamonds]

  def new do
    for suit <- @suits, rank <- @ranks do
      {rank, suit}
    end |> Enum.shuffle()
  end
end
