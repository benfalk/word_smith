defmodule WordSmith.Squish do
  import String, only: [replace: 3, trim: 1]
  @moduledoc false

  @doc false
  def squish(str) when is_binary(str) and byte_size(str) < 150, do: squish(str, [])
  def squish(str) when is_binary(str), do: str |> trim |> replace(~r/[[:space:]]+/, " ")

  # left-trimming
  defp squish(" " <> rest, []), do: squish(rest, [])
  defp squish("\n" <> rest, []), do: squish(rest, [])
  defp squish("\t" <> rest, []), do: squish(rest, [])

  # right-trimming
  defp squish(" ", acc), do: squish("", acc)
  defp squish("\n", acc), do: squish("", acc)
  defp squish("\t", acc), do: squish("", acc)

  # compacting
  defp squish("\n" <> rest, acc), do: squish(" " <> rest, acc)
  defp squish("\n\n" <> rest, acc), do: squish(" " <> rest, acc)
  defp squish("\t" <> rest, acc), do: squish(" " <> rest, acc)
  defp squish("\t\t" <> rest, acc), do: squish(" " <> rest, acc)
  defp squish(" \n" <> rest, acc), do: squish(" " <> rest, acc)
  defp squish(" \t" <> rest, acc), do: squish(" " <> rest, acc)
  defp squish("  " <> rest, acc), do: squish(" " <> rest, acc)
  defp squish("   " <> rest, acc), do: squish(" " <> rest, acc)
  defp squish("    " <> rest, acc), do: squish(" " <> rest, acc)

  # flow-through
  defp squish(<<char::binary-1, rest::binary>>, acc), do: squish(rest, [char|acc])

  # finished
  defp squish("", acc), do: Enum.reverse(acc) |> IO.iodata_to_binary
end
