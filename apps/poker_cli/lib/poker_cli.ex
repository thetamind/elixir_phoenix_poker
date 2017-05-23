defmodule Poker.CLI do
  @moduledoc """
  Command line interface.
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
    argv |> List.first() |> String.to_atom()
  end

  defp process(:help) do
    IO.puts help()
  end
end
