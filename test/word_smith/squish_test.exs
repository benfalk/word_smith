defmodule WordSmith.SquishTest do
  use ExUnit.Case, async: true
  import WordSmith.Squish
  import String, only: [duplicate: 2]

  test "pre-squished strings come out the same" do
    assert squish("hello world") == "hello world"
  end

  test "will squish this down" do
    assert squish("hello  world") == "hello world"
  end

  test "squishes left and right padding out" do
    assert squish("    hello    world   ") == "hello world"
  end

  test "squishes left and right with tabs and newlines" do
    assert squish("\n  \t   hello\n\n\tworld  \n \t  ") == "hello world"
  end

  test "white space get's emptied" do
    assert squish("\n\n\t\n\t\n\t    \t \n    \n") == ""
  end

  test "works on **large** strings" do
    big_string = duplicate("  \n  \t  hello  \n world  \n \t\t", 400)
    expected = Stream.repeatedly(fn -> "hello world" end)
    |> Enum.take(400)
    |> Enum.to_list
    |> Enum.join(" ")

    assert squish(big_string) == expected
  end
end
