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

  test "simple game" do
    execute_main = fn ->
      Poker.CLI.main(["--seed", "AAAAAAAAAAAAAAAA"])
    end

    assert capture_io(execute_main) =~ "Your hand: 6d Kd 10d Ah Qh"
  end

  test "simple game seed" do
    execute_main = fn ->
      Poker.CLI.main(["--seed", "BBBBBBBBBBBBBBBB"])
    end

    assert capture_io(execute_main) =~ "Your hand: Kd 4c 10s Qc Qd"
  end
end
