defmodule Poker.Umbrella.Mixfile do
  use Mix.Project

  def project do
    [apps_path: "apps",
     start_permanent: Mix.env == :prod,
     dialyzer: [plt_add_deps: :transitive, flags: [:unmatched_returns, :error_handling, :race_conditions, :underspecs]],
     deps: deps()]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options.
  #
  # Dependencies listed here are available only for this project
  # and cannot be accessed from applications inside the apps folder
  defp deps do
    [
      {:credo, "~> 0.8", only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: [:dev, :test], runtime: false}
    ]
  end
end
