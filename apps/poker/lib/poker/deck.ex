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

  def new_with_seed(seed) do
      :rand.seed(:exsplus, seed)
      new()
  end

  @spec rank_to_letter(rank) :: char
  def rank_to_letter(rank) when rank <= 10, do: to_string(rank)
  def rank_to_letter(rank) when rank == 11, do: "J"
  def rank_to_letter(rank) when rank == 12, do: "Q"
  def rank_to_letter(rank) when rank == 13, do: "K"
  def rank_to_letter(rank) when rank == 14, do: "A"
end
