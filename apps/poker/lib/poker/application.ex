defmodule Poker.Application do
  @moduledoc """
  The Poker Application Service.

  The poker system business domain lives in this application.

  Exposes API to clients such as the `Poker.Web` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      worker(Poker.Repo, []),
    ], strategy: :one_for_one, name: Poker.Supervisor)
  end
end
