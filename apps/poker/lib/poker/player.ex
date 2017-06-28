defmodule Poker.Player do
  @moduledoc """
  A player.
  """

  defstruct [:name]

  def list_players do
    [
      %__MODULE__{name: "Alice"},
      %__MODULE__{name: "Bob"},
      %__MODULE__{name: "Carol"},
      %__MODULE__{name: "Derek"},
    ]
  end
end
