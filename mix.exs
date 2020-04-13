defmodule Caesar.MixProject do
  use Mix.Project

  def project do
    [
      escript: escript_config(),
      app: :caesar,
      version: "0.1.0",
      source_url: "https://github.com/GustavoEdny/caesar",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:ex_doc, "~> 0.11"},
      {:earmark, "> 0.2.0"}
    ]
  end

  defp escript_config do
    [main_module: Caesar]
  end
end
