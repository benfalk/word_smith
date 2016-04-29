defmodule WordSmith.RemoveAccentsTest do
  use ExUnit.Case
  alias WordSmith.RemoveAccents

  test "non-accented text comes through the same" do
    assert RemoveAccents.remove_accents("hello world") == "hello world"
  end

  test "accented text comes through 'un-accented'" do
    assert RemoveAccents.remove_accents("hello world ©") == "hello world (C)"
  end
end
