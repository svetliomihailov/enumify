defmodule Enumify.MixProject do
  use Mix.Project

  def project do
    [
      app: :enumify,
      version: "0.1.0",
      elixir: ">= 1.7.0",
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
      {:ecto_sql, ">= 3.0.0", optional: true}
    ]
  end
end
