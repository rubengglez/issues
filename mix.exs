defmodule Issues.MixProject do
  use Mix.Project

  def project do
    [
      app: :issues,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      escript: escript_config,
      deps: deps(),
      # docs
      name: "Issues",
      source_url: "https://github.com/rubengglez/issues"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mix_test_watch, "~> 0.9.0"},
      {:httpoison, "~> 1.4"},
      {:poison, "~> 3.1"},
      {:ex_doc, github: "elixir-lang/ex_doc"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

  # Specify who contains the main function
  defp escript_config do
    [main_module: Issues.CLI]
  end
end
