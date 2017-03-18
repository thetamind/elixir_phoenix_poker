defmodule Poker.Deck do
  @moduledoc """
  A standard 52 card deck.
  """

  @ranks Enum.to_list(2..14)
  @suits [:spades, :clubs, :hearts, :diamonds]

  @doc """
  Creates a shuffled deck.
  """
  @spec new() :: nonempty_list()
  def new() do
    for suit <- @suits, rank <- @ranks do
      {rank, suit}
    end |> Enum.shuffle()
  end

  @spec new(integer()) :: tuple()
  def new(3), do: new() |> Enum.take(1)

  @doc """
  Create a Roman numeral representation of the integer
  """
  @spec create(non_neg_integer) :: String.t
  def create(0), do: "nvlla"
  def create(5), do: "v"
  def create(_), do: "ooops"
end
