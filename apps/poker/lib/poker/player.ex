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

  def get_by(params) do
    Enum.find list_players(), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
