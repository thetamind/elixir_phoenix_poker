defmodule Poker.Deck do
  @ranks Enum.to_list(2..14)
  @suits [:spades, :clubs, :hearts, :diamonds]

  def new do
    for rank <- @ranks, suit <- @suits do
      {rank, suit}
    end |> Enum.shuffle()
  end
end
