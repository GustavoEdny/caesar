defmodule Caesar.CipherTest do
  use ExUnit.Case
  doctest Caesar.Cipher

  import Caesar.Cipher

  test "encrypt shift cipher mapping" do
    assert encrypt("abcd", 1) == "bcde"
  end

  test "encrypt handles capital letters" do
    assert encrypt("abCD", 1) == "bcDE"
  end

  test "encrypt handles spaces and special characters" do
    assert encrypt("ab cd", 1) == "bc de"
    assert encrypt("Hello :)", 1) == "Ifmmp :)"
  end

  test "encrypt handles a large shift number" do
    assert encrypt("abcd", 27) == "bcde"
  end

  test "decrypt shift cipher mapping" do
    assert decrypt("bcde", 1) == "abcd"
  end

  test "decrypt handles capital letters" do
    assert decrypt("bcDE", 1) == "abCD"
  end

  test "decrypt handles spaces and special characters" do
    assert decrypt("bc de", 1) == "ab cd"
    assert decrypt("Ifmmp :)", 1) == "Hello :)"
  end

  test "decrypt handles a large shift number" do
    assert decrypt("bcde", 27) == "abcd"
  end
end
