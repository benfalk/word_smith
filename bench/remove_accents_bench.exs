defmodule RemoveAccentsBench do
  use Benchfella
  alias WordSmith.RemoveAccents

  bench "byte-size: #{1*24}", [string: gen_string(1)] do
    RemoveAccents.remove_accents(string)
  end

  bench "byte-size: #{10*24}", [string: gen_string(10)] do
    RemoveAccents.remove_accents(string)
  end

  bench "byte-size: #{100*24}", [string: gen_string(100)] do
    RemoveAccents.remove_accents(string)
  end

  bench "byte-size: #{1000*24}", [string: gen_string(1000)] do
    RemoveAccents.remove_accents(string)
  end

  bench "byte-size: #{10000*24}", [string: gen_string(10000)] do
    RemoveAccents.remove_accents(string)
  end

  defp gen_string(times \\ 1) do
    String.duplicate("Ĥĕľŀö Ŵóŕƚƌ ©", times)
  end
end
