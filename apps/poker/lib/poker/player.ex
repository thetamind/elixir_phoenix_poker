defmodule Poker.Player do
  @moduledoc """
  A player.
  """

  defstruct [:id, :name]

  @type t(name) :: %__MODULE__{name: name}

  @type t :: %__MODULE__{name: String.t()}

  def list_players do
    [
      %__MODULE__{id: 1, name: "Alice"},
      %__MODULE__{id: 2, name: "Bob"},
      %__MODULE__{id: 3, name: "Carol"},
      %__MODULE__{id: 4, name: "Derek"},
    ]
  end

  @spec get(id :: pos_integer()) :: t | nil
  def get(id) do
    Enum.find list_players(), fn map ->
      Map.get(map, :id) == id
    end
  end

  @spec get_by(params :: Enumerable.t) :: t | nil
  def get_by(params) do
    Enum.find list_players(), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
