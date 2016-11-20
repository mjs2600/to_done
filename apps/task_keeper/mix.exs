defmodule TaskKeeper.Mixfile do
  use Mix.Project

  def project do
    [
      app: :task_keeper,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      aliases: aliases
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:logger, :ecto, :postgrex],
      mod: {TaskKeeper, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # To depend on another app inside the umbrella:
  #
  #   {:myapp, in_umbrella: true}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ecto, "~> 2.0"},
      {:postgrex, "~> 0.11"}
    ]
  end

  defp aliases do
    [
      test: [
        "ecto.create --quiet",
        # "ecto.migrate",
        "test"
      ]
    ]

  end
end
