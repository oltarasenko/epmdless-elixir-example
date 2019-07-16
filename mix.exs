defmodule EpmdlessElixirExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :epmdless_elixir_example,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :sasl, :epmdless],
      mod: {EpmdlessElixirExample.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:epmdless, "~> 0.1.4"},
      {:distillery, "~> 2.1"}
    ]
  end
end
