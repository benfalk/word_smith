defmodule RemoveAccentsBench do
  @base "Ĥĕľŀö Ŵóŕƚƌ ©"
  @size byte_size(@base)

  def run(string) do
    WordSmith.remove_accents(string)
  end

  def gen_string(times), do: String.duplicate(@base, times)

  def byte_size(times), do: @size * times
end

Benchee.run(
  %{
    "remove_accents" => fn input -> RemoveAccentsBench.run(input) end
  },
  inputs: %{
    "#{RemoveAccentsBench.byte_size(1)} bytes" => RemoveAccentsBench.gen_string(1),
    "#{RemoveAccentsBench.byte_size(10)} bytes" => RemoveAccentsBench.gen_string(10),
    "#{RemoveAccentsBench.byte_size(100)} bytes" => RemoveAccentsBench.gen_string(100),
    "#{RemoveAccentsBench.byte_size(1000)} bytes" => RemoveAccentsBench.gen_string(1000),
    "#{RemoveAccentsBench.byte_size(10000)} bytes" => RemoveAccentsBench.gen_string(10000),
    "#{RemoveAccentsBench.byte_size(100_000)} bytes" => RemoveAccentsBench.gen_string(100_000)
  },
  warmup: 5
)
