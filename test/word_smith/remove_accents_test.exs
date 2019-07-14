defmodule WordSmith.RemoveAccentsTest do
  use ExUnit.Case, async: true
  alias WordSmith.RemoveAccents

  test "non-accented text comes through the same" do
    assert RemoveAccents.remove_accents("hello world") == "hello world"
  end

  test "accented text comes through 'un-accented'" do
    assert RemoveAccents.remove_accents("hello world ©") == "hello world (C)"
  end

  test "characters not found in the map that are outside normal ascii range work" do
    assert RemoveAccents.remove_accents("Molokaʻi Princess") == "Moloka'i Princess"
  end

  test "characters in and out the map that outside normal ascii range work" do
    assert RemoveAccents.remove_accents("Molokaʻi Ƥrincess") == "Moloka'i Princess"
  end
end
