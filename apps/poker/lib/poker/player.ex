defmodule Poker.Player do
  @moduledoc """
  A player.
  """

  defstruct [:name]

  @type t(name) :: %__MODULE__{name: name}

  @type t :: %__MODULE__{name: String.t()}

  def list_players do
    [
      %__MODULE__{name: "Alice"},
      %__MODULE__{name: "Bob"},
      %__MODULE__{name: "Carol"},
      %__MODULE__{name: "Derek"},
    ]
  end

  @spec get_by(params :: Enumerable.t) :: t | nil
  def get_by(params) do
    Enum.find list_players(), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
