defmodule SquishBench do
  @whitespaced_string "  \n  \t \n\n hello \n\n\n world\t\t\n  "
  @size byte_size(@whitespaced_string)

  def squish(string) do
    WordSmith.squish(string)
  end

  def regex(string) do
    string
    |> String.trim()
    |> String.replace(~r/[[:space:]]+/, " ")
  end

  def gen_string(times), do: String.duplicate(@whitespaced_string, times)
  def byte_size(times), do: @size * times
end

Benchee.run(
  %{
    "squish" => fn input -> SquishBench.squish(input) end,
    "regex" => fn input -> SquishBench.regex(input) end
  },
  inputs: %{
    "#{SquishBench.byte_size(1)} bytes" => SquishBench.gen_string(1),
    "#{SquishBench.byte_size(10)} bytes" => SquishBench.gen_string(10),
    "#{SquishBench.byte_size(100)} bytes" => SquishBench.gen_string(100),
    "#{SquishBench.byte_size(1000)} bytes" => SquishBench.gen_string(1000),
    "#{SquishBench.byte_size(10000)} bytes" => SquishBench.gen_string(10000)
  },
  warmup: 5
)
