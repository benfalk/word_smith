defmodule WordSmith.Mixfile do
  use Mix.Project

  def project do
    [app: :word_smith,
     version: "0.1.0",
     elixir: "~> 1.1",
     description: description,
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev},
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
