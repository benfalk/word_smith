defmodule SquishBench do
  use Benchfella
  import WordSmith.Squish
  import String, only: [duplicate: 2]
  @whitespaced_string "  \n  \t \n\n hello \n\n\n world\t\t\n  "
  @size byte_size(@whitespaced_string)

  bench "byte-size: #{1*@size} - squish", [string: gen_string(1)] do
    squish(string)
  end

  bench "byte-size: #{1*@size} - regex+libs", [string: gen_string(1)] do
    libs_squish(string)
  end

  bench "byte-size: #{4*@size} - squish", [string: gen_string(4)] do
    squish(string)
  end

  bench "byte-size: #{4*@size} - regex+libs", [string: gen_string(4)] do
    libs_squish(string)
  end

  def libs_squish(str) do
    str
    |> String.strip
    |> String.replace(~r/[[:space:]]+/, " ")
  end

  defp gen_string(times), do: duplicate(@whitespaced_string, times)
end
