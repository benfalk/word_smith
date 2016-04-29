defmodule WordSmith.RemoveAccentsTest do
  use ExUnit.Case
  alias WordSmith.RemoveAccents

  test "non-accented text comes through the same" do
    assert RemoveAccents.remove_accents("hello world") == "hello world"
  end

  test "accented text comes through 'un-accented'" do
    assert RemoveAccents.remove_accents("hello world ©") == "hello world (C)"
  end

  test "(no tail call) non-accented text comes through the same" do
    assert RemoveAccents.remove_accents_no_tail_call("hello world") == "hello world"
  end

  test "(no tail call) accented text comes through 'un-accented'" do
    assert RemoveAccents.remove_accents_no_tail_call("hello world ©") == "hello world (C)"
  end

  test "(io data) non-accented text comes through the same" do
    assert RemoveAccents.remove_accents_iodata("hello world") == "hello world"
  end

  test "(io data) accented text comes through 'un-accented'" do
    assert RemoveAccents.remove_accents_iodata("hello world ©") == "hello world (C)"
  end

  test "(io data - recursive) non-accented text comes through the same" do
    assert RemoveAccents.remove_accents_iodata_rec("hello world") == "hello world"
  end

  test "(io data - recursive) accented text comes through 'un-accented'" do
    assert RemoveAccents.remove_accents_iodata_rec("hello world ©") == "hello world (C)"
  end
end
