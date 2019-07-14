defmodule WordSmith.Mixfile do
  use Mix.Project

  def project do
    [
      app: :word_smith,
      version: "0.2.0",
      elixir: "~> 1.7",
      description: description(),
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:benchfella, "~> 0.3.0", only: :dev}
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
end
