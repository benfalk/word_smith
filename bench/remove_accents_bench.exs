defmodule RemoveAccentsBench do
  use Benchfella
  alias WordSmith.RemoveAccents

  bench "with tail-call optimization", [string: gen_string()] do
    RemoveAccents.remove_accents(string)
  end

  bench "without tail-call optimization", [string: gen_string()] do
    RemoveAccents.remove_accents_no_tail_call(string)
  end

  bench "as io-data (non-recursive)", [string: gen_string()] do
    RemoveAccents.remove_accents_iodata(string)
  end

  bench "as io-data (recursive)", [string: gen_string()] do
    RemoveAccents.remove_accents_iodata_rec(string)
  end

  defp gen_string do
    String.duplicate("Ĥĕľŀö Ŵóŕƚƌ ©", 3000)
  end
end
