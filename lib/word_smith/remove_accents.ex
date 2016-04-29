defmodule WordSmith.RemoveAccents do
  @accents_file Path.join([__DIR__, "../../priv/data/unaccent.rules"])
  @external_resource @accents_file
  @moduledoc false

  @doc false
  def remove_accents(str) when is_binary(str), do: remove_accents(str, "")

  for pair <- File.stream!(@accents_file, [], :line) do
    [char, replacement] = pair |> String.strip |> String.split("\t")
    defp remove_accents(unquote(char) <> rest, acc) do
      remove_accents(rest, acc <> unquote(replacement))
    end
  end

  defp remove_accents(<<char, rest::binary>>, acc) do
    remove_accents(rest, <<acc::binary, char>>)
  end
  defp remove_accents("", acc), do: acc
end
