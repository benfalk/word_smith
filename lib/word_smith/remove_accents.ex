defmodule WordSmith.RemoveAccents do
  @accents_file Path.join([__DIR__, "../../priv/data/unaccent.rules"])
  @external_resource @accents_file
  @moduledoc false

  @doc false
  def remove_accents(str) when is_binary(str), do: remove_accents(str, [])

  for pair <- File.stream!(@accents_file, [], :line) do
    case pair |> String.trim() |> String.split("\t") do
      [char] ->
        # No replacement, just strip it
        defp remove_accents(unquote(char) <> rest, acc) do
          remove_accents(rest, acc)
        end

      [char, replacement] ->
        defp remove_accents(unquote(char) <> rest, acc) do
          remove_accents(rest, [unquote(replacement) | acc])
        end
    end
  end

  defp remove_accents(<<char::binary-1, rest::binary>>, acc) do
    remove_accents(rest, [char | acc])
  end

  defp remove_accents("", acc) do
    Enum.reverse(acc) |> IO.iodata_to_binary()
  end
end
