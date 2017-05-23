defmodule Poker.CLITest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  doctest Poker.CLI

  test "prints help" do
    execute_main = fn ->
      Poker.CLI.main(["help"])
    end

    assert capture_io(execute_main) =~ "Poker CLI"
  end
end
