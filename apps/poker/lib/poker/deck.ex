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

  @doc """
  Create a Roman numeral representation of the integer
  """
  @spec create(count :: non_neg_integer) :: String.t
  def create(0), do: "nvilla"
  def create(5), do: "v"
  def create(_), do: "ooops"
end
