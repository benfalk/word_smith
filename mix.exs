defmodule WordSmith.MixProject do
  use Mix.Project

  def project do
    [
      app: :word_smith,
      version: "0.2.0",
      elixir: "~> 1.15",
      description: description(),
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:benchee, "~> 1.3", only: :dev},
      {:ex_doc, "~> 0.36", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    General text utility library to help with string manipulation not
    found in the standard Elixir library.
    """
  end

  defp package do
    [
      maintainers: ["Benjamin Falk"],
      links: %{"GitHub" => "https://github.com/benfalk/word_smith"},
      licenses: ["MIT License"]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
