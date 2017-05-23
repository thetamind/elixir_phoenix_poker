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
    msg = case seed do
      "AAAAAAAAAAAAAAAA" -> "Your hand: As Kd Qh Jc"
      _ -> "Your hand: something random"
    end

    IO.puts msg
  end
end
