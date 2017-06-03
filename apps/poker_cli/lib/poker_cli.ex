defmodule Poker.CLI do
  @moduledoc """
  Command line interface.

  ## Examples

  iex> Poker.CLI.help
  "Poker CLI"

  """

  @doc """
  Help.

  ## Examples

      iex> Poker.CLI.help
      "Poker CLI"

  """
  def help do
    "Poker CLI"
  end

  def main(argv) do
    argv
    |> parse_args
    |> process
  end

  def parse_args(argv) do
    case OptionParser.parse(argv) do
      {[seed: seed], _, _} -> [seed: seed]
      {[help: true], _, _} -> :help
      _ -> :help
    end

  end

  defp process(:help) do
    IO.puts help()
  end

  defp process([seed: seed]) do

    <<i1::32, i2::32, i3::32>> = Base.url_decode64!(seed)

    deck = Poker.Deck.new_with_seed({i1, i2, i3})
    hand = Enum.take(deck, 5)
    desc = Enum.map(hand, &describe_card/1) |> Enum.join(" ")
    msg = "Your hand: #{desc}"

    IO.puts msg
  end

  defp describe_card({rank, suit}) do
    "#{Poker.Deck.rank_to_letter(rank)}"
  end
end
