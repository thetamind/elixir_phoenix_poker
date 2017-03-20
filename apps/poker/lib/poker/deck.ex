defmodule Poker.Deck do
  @moduledoc """
  A standard 52 card deck.
  """

  @type rank :: 2..14
  @type suit :: :spades | :clubs | :hearts | :diamonds
  @type card :: {rank, suit}
  @type deck :: [card, ...]

  @ranks Enum.to_list(2..14)
  @suits [:spades, :clubs, :hearts, :diamonds]

  @doc """
  Creates a shuffled deck.
  """
  @spec new() :: deck
  def new() do
    for suit <- @suits, rank <- @ranks do
      {rank, suit}
    end |> Enum.shuffle()
  end
end
