defmodule WordSmith do
  @moduledoc """
  General text utility library to help with string tasks not found in the
  standard Elixir library
  """

  @doc """
  Cleans the accents from a string.  This is **largely** based from the
  `unaccent` functionality found from Postgres.  In fact, the default
  unaccent.rules is used to provide this functionality:

  https://github.com/postgres/postgres/blob/master/contrib/unaccent/unaccent.rules

  It should be noted that while this is a good attempt it is not an
  exhaustive conversion.

      iex> WordSmith.remove_accents("Ĥĕľŀö Ŵóŕƚƌ ©")
      "Hello World (C)"
  """
  def remove_accents(string) when is_binary(string) do
    WordSmith.RemoveAccents.remove_accents(string)
  end

  def remove_accents(any) do
    WordSmith.RemoveAccents.remove_accents(to_string(any))
  end
end
