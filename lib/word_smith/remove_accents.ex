defmodule WordSmith.RemoveAccents do
  @accents_file Path.join([__DIR__, "../../priv/data/unaccent.rules"])
  @external_resource @accents_file
  @moduledoc false

  @doc false
  def remove_accents(str) when is_binary(str), do: remove_accents(str, "")

  def remove_accents_no_tail_call(str) when is_binary(str), do: remove_accentsx(str)

  def remove_accents_iodata(str) when is_binary(str), do: remove_accentsio(str) |> IO.iodata_to_binary

  def remove_accents_iodata_rec(str) when is_binary(str), do: remove_accentsio_rec(str, []) |> IO.iodata_to_binary

  for pair <- File.stream!(@accents_file, [], :line) do
    [char, replacement] = pair |> String.strip |> String.split("\t")
    defp remove_accents(unquote(char) <> rest, acc) do
      remove_accents(rest, acc <> unquote(replacement))
    end
  end

  defp remove_accents(<<char::utf8, rest::binary>>, acc) do
    remove_accents(rest, <<acc::binary, char>>)
  end
  defp remove_accents("", acc), do: acc

  for pair <- File.stream!(@accents_file, [], :line) do
    [char, replacement] = pair |> String.strip |> String.split("\t")
    defp remove_accentsx(unquote(char) <> rest) do
      unquote(replacement) <> remove_accentsx(rest)
    end
  end

  defp remove_accentsx(<<char::binary-1, rest::binary>>) do
    char <> remove_accentsx(rest)
  end
  defp remove_accentsx(""), do: ""


  for pair <- File.stream!(@accents_file, [], :line) do
    [char, replacement] = pair |> String.strip |> String.split("\t")
    defp remove_accentsio(unquote(char) <> rest) do
      [unquote(replacement) | remove_accentsio(rest)]
    end
  end

  defp remove_accentsio(<<char::utf8 , rest::binary>>) do
    [char | remove_accentsio(rest)]
  end
  defp remove_accentsio(""), do: []

  for pair <- File.stream!(@accents_file, [], :line) do
    [char, replacement] = pair |> String.strip |> String.split("\t")
    defp remove_accentsio_rec(unquote(char) <> rest, acc) do
      remove_accentsio_rec(rest, [unquote(replacement) | acc])
    end
  end

  defp remove_accentsio_rec(<<char::utf8 , rest::binary>>, acc) do
    remove_accentsio_rec(rest, [char | acc])
  end
  defp remove_accentsio_rec("",acc), do: Enum.reverse(acc)
end
